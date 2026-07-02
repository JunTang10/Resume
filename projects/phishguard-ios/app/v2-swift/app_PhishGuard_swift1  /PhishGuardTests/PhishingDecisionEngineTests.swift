import XCTest
import CoreML
@testable import PhishGuard

@MainActor
final class PhishingDecisionEngineTests: XCTestCase {
    private static let sharedStore = PolicyStore()
    private static let sharedMatcher = PolicyMatcher()
    private static let sharedExtractor = SignalExtractor()
    private static let sharedLocalAnalyzer = LocalSLMService()
    private static let sharedRunner = try! PhishingDetectorRunner(bundle: .main)
    private static let sharedHistoryMatcher = HistoryMatcher(extractor: sharedExtractor)
    private static let sharedHistoryEngine = HistoryOccurrenceEngine(matcher: sharedHistoryMatcher)
    private static let sharedHistoryService = HistoryService(
        store: .shared,
        matcher: sharedHistoryMatcher,
        occurrenceEngine: sharedHistoryEngine,
        policyService: sharedService
    )
    private static let sharedService = PolicyService(
        store: sharedStore,
        matcher: sharedMatcher,
        extractor: sharedExtractor
    )
    private var savedEvents: [DetectionEvent] = []
    private var savedWhitelist: [WhitelistEntry] = []
    private var savedBlocklist: [WhitelistEntry] = []

    override func setUp() {
        super.setUp()
        savedEvents = HistoryStore.shared.historyEvents
        savedWhitelist = PersistenceStore.shared.whitelist
        savedBlocklist = PersistenceStore.shared.blocklist
        HistoryStore.shared.historyEvents = []
        PersistenceStore.shared.whitelist = []
        PersistenceStore.shared.blocklist = []
    }

    override func tearDown() {
        HistoryStore.shared.historyEvents = savedEvents
        PersistenceStore.shared.whitelist = savedWhitelist
        PersistenceStore.shared.blocklist = savedBlocklist
        super.tearDown()
    }

    //能不能从文本中自动提取自动提取邮箱作为上下文
    func testSuggestedContextPrefersEmailExtractedFromText() {
        let suggested = Self.sharedService.suggestedContext(
            text: "Please contact noreply@safe-bank.com to verify your account."
        )

        XCTAssertEqual(suggested, "noreply@safe-bank.com")
    }
//在可信任的规则里能不能自动返回allow/block测试命中白名单邮箱时是否返回 allow
    func testPolicyMatcherReturnsAllowForTrustedEmail() throws {
        let trustedEmail = "friend@example.com"
        let entry = try makeEntry(
            mode: .allow,
            kind: .email,
            matchType: .exact,
            value: trustedEmail,
            source: .trustedContacts
        )

        let result = Self.sharedMatcher.evaluate(
            text: "friend@example.com sent you a reminder.",
            entries: [entry]
        )

        guard case .allow(let reasons) = result else {
            return XCTFail("Expected allow result for trusted email")
        }

        XCTAssertTrue(reasons.contains(where: { $0.contains(trustedEmail) }))
        XCTAssertTrue(result.indicators.contains("trusted contact matched"))
    }
//出现了block的域名能不能正确返回block
    func testPolicyMatcherReturnsBlockForBlockedDomain() throws {
        let blockedDomain = "phishy-payments.com"
        let entry = try makeEntry(
            mode: .block,
            kind: .url,
            matchType: .domainSuffix,
            value: blockedDomain,
            source: .user
        )

        let result = Self.sharedMatcher.evaluate(
            text: "Please review https://login.phishy-payments.com/reset right away.",
            entries: [entry]
        )

        guard case .block(let reasons) = result else {
            return XCTFail("Expected block result for blocked domain")
        }

        XCTAssertTrue(reasons.contains(where: { $0.contains(blockedDomain) }))
        XCTAssertTrue(result.indicators.contains("block rule matched"))
    }

    func testSignalExtractorCapturesEmailDomains() {
        let signals = Self.sharedExtractor.extract(
            text: "Please reply to noreply@bank.com for your statement."
        )

        XCTAssertTrue(signals.emails.contains("noreply@bank.com"))
        XCTAssertTrue(signals.emailDomains.contains("bank.com"))
    }

    func testSignalExtractorCapturesNameAndPhoneFromVoiceContactContext() {
        let signals = Self.sharedExtractor.extract(
            text: "Please review this voicemail transcript.",
            senderName: "Alice Chen (+61 412 345 678)"
        )

        XCTAssertTrue(signals.names.contains("alice chen"))
        XCTAssertTrue(signals.phones.contains("+61412345678"))
    }

    func testPolicyMatcherMatchesSenderEmailDomainForBlocklistRule() throws {
        let blockedDomain = "bank.com"
        let entry = try makeEntry(
            mode: .block,
            kind: .url,
            matchType: .domainSuffix,
            value: blockedDomain,
            source: .user
        )

        let result = Self.sharedMatcher.evaluate(
            text: "Monthly account notification.",
            senderName: "noreply@bank.com",
            entries: [entry]
        )

        guard case .block(let reasons) = result else {
            return XCTFail("Expected sender email domain to match blocklist domain rule")
        }

        XCTAssertTrue(reasons.contains(where: { $0.contains(blockedDomain) }))
    }

    func testRiskLevelReturnsLowForScoresBetweenOneAndMediumThreshold() {
        XCTAssertEqual(RiskLevel.level(for: 1.0), .low)
        XCTAssertEqual(RiskLevel.level(for: 2.9), .low)
    }

    func testAnalyzeResponseDecodesTierUsedWhenBackendReturnsInt() throws {
        let payload: [String: Any] = [
            "success": true,
            "request_id": "req-123",
            "modality": "text",
            "input_text": "hello",
            "risk_score": 2.0,
            "risk_level": "LOW",
            "verdict": "safe",
            "confidence": 0.88,
            "rationale": "Decoded from tier integer.",
            "indicators": ["demo"],
            "tier_used": 2,
            "processing_time_ms": 18,
            "was_escalated": true
        ]
        let data = try JSONSerialization.data(withJSONObject: payload)

        let response = try JSONDecoder().decode(AnalyzeResponse.self, from: data)

        XCTAssertEqual(response.tierUsed, 2)
        XCTAssertEqual(response.tierName, DetectionTier.rawValueToAPIName(2))
        XCTAssertTrue(response.wasEscalated)
    }

    func testPersistenceStoreAddsBlocklistRule() {
        PersistenceStore.shared.addBlocklist(value: "blocked-domain.example.com", label: nil)

        XCTAssertEqual(PersistenceStore.shared.blocklist.count, 1)
        XCTAssertEqual(PersistenceStore.shared.blocklist.first?.value, "blocked-domain.example.com")
    }

    func testPersistenceStoreSkipsConsecutiveDuplicateHistoryEvent() {
        let event = DetectionEvent(
            modality: .text,
            riskScore: 0.0,
            riskLevel: .safe,
            summary: "Decision Path: Automated Policy + Content Analysis.",
            indicators: ["no local policy rule matched"],
            verdict: "safe",
            processingTimeMs: 10,
            sourceHint: "bob@example.com",
            tiersUsed: [0],
            wasBlocked: false
        )

        PersistenceStore.shared.addEvent(event)
        PersistenceStore.shared.addEvent(event)

        XCTAssertEqual(PersistenceStore.shared.events.count, 1)
    }

    func testPersistenceStoreRemovesBlocklistRule() {
        PersistenceStore.shared.blocklist = [WhitelistEntry(value: "blocked-domain.example.com", label: nil)]

        PersistenceStore.shared.removeBlocklist(at: IndexSet(integer: 0))

        XCTAssertTrue(PersistenceStore.shared.blocklist.isEmpty)
    }

    func testRemoveWhitelistEntryPersistsThroughPersistenceStore() async throws {
        PersistenceStore.shared.addWhitelist(value: "persisted@example.com", label: "Persisted")
        let id = try XCTUnwrap(PersistenceStore.shared.whitelist.first?.id.uuidString)

        try await PhishGuardAPI.shared.removeWhitelistEntry(id: id)

        XCTAssertTrue(PersistenceStore.shared.whitelist.isEmpty)

        let data = try XCTUnwrap(UserDefaults.standard.data(forKey: "pg_whitelist"))
        let decoded = try JSONDecoder().decode([WhitelistEntry].self, from: data)
        XCTAssertTrue(decoded.isEmpty)
    }

    func testPolicyServiceAddsWhitelistEntryToSettingsDataSource() {
        let entry = Self.sharedService.addWhitelistEntry(from: "bob@example.com", label: "Suggested Trusted Contact")

        XCTAssertEqual(entry?.value, "bob@example.com")
        XCTAssertEqual(entry?.matchKind, "email")
        XCTAssertEqual(entry?.primaryMatchValue, "bob@example.com")
        XCTAssertEqual(PersistenceStore.shared.whitelist.count, 1)
        XCTAssertEqual(PersistenceStore.shared.whitelist.first?.value, "bob@example.com")
        XCTAssertEqual(PersistenceStore.shared.whitelist.first?.matchKind, "email")
        XCTAssertEqual(PersistenceStore.shared.whitelist.first?.primaryMatchValue, "bob@example.com")
        XCTAssertTrue(PersistenceStore.shared.whitelist.first?.normalizedValues.contains("bob@example.com") == true)
        XCTAssertTrue(PersistenceStore.shared.whitelist.first?.normalizedValues.contains("example.com") == true)
    }

    func testPolicyServiceAddsBlocklistEntryToSettingsDataSource() {
        let entry = Self.sharedService.addBlocklistEntry(from: "fake-bank.com", label: "Blocked Sender")

        XCTAssertEqual(entry?.value, "fake-bank.com")
        XCTAssertEqual(entry?.matchKind, "url")
        XCTAssertEqual(entry?.primaryMatchValue, "fake-bank.com")
        XCTAssertEqual(PersistenceStore.shared.blocklist.count, 1)
        XCTAssertEqual(PersistenceStore.shared.blocklist.first?.value, "fake-bank.com")
        XCTAssertEqual(PersistenceStore.shared.blocklist.first?.matchKind, "url")
        XCTAssertEqual(PersistenceStore.shared.blocklist.first?.primaryMatchValue, "fake-bank.com")
        XCTAssertTrue(PersistenceStore.shared.blocklist.first?.normalizedValues.contains("fake-bank.com") == true)
    }

    func testEmailAddedToWhitelistMatchesAllowOnNextEvaluation() {
        _ = Self.sharedService.addWhitelistEntry(from: "bob@example.com", label: "Trusted")

        let result = Self.sharedService.evaluate(
            text: "Weekly update attached.",
            senderName: "bob@example.com",
            trustedContacts: PersistenceStore.shared.whitelist,
            blockedDomains: []
        )

        guard case .allow = result else {
            return XCTFail("Expected allow result for stored whitelist email")
        }
        XCTAssertTrue(result.indicators.contains("trusted contact matched"))
    }

    func testDomainAddedToBlocklistMatchesBlockOnNextEvaluation() {
        _ = Self.sharedService.addBlocklistEntry(from: "fake-bank.com", label: "Blocked")

        let result = Self.sharedService.evaluate(
            text: "Please verify now at https://login.fake-bank.com/reset",
            senderName: nil,
            trustedContacts: [],
            blockedDomains: PersistenceStore.shared.blocklist
        )

        guard case .block = result else {
            return XCTFail("Expected block result for stored blocklist domain")
        }
        XCTAssertTrue(result.indicators.contains("block rule matched"))
    }

    func testPhoneFormatsMatchAfterNormalization() {
        _ = Self.sharedService.addWhitelistEntry(from: "+61 412 345 678", label: "Trusted Caller")

        XCTAssertEqual(PersistenceStore.shared.whitelist.first?.matchKind, "phone")
        XCTAssertEqual(PersistenceStore.shared.whitelist.first?.primaryMatchValue, "+61412345678")

        let result = Self.sharedService.evaluate(
            text: "Missed call transcript.",
            senderName: "Alice Chen (+61412345678)",
            trustedContacts: PersistenceStore.shared.whitelist,
            blockedDomains: []
        )

        guard case .allow = result else {
            return XCTFail("Expected allow result for normalized phone match")
        }
        XCTAssertTrue(result.indicators.contains("trusted contact matched"))
    }

    func testDisplayValueWithPhoneUsesPrimaryPhoneIdentity() {
        _ = Self.sharedService.addWhitelistEntry(from: "Alice Chen (+61 412 345 678)", label: "Trusted Caller")

        XCTAssertEqual(PersistenceStore.shared.whitelist.first?.matchKind, "phone")
        XCTAssertEqual(PersistenceStore.shared.whitelist.first?.primaryMatchValue, "+61412345678")

        let result = Self.sharedService.evaluate(
            text: "Missed call transcript.",
            senderName: "Alice Chen (+61 412-345-678)",
            trustedContacts: PersistenceStore.shared.whitelist,
            blockedDomains: []
        )

        guard case .allow = result else {
            return XCTFail("Expected allow result for primary phone identity match")
        }
    }

    func testDuplicateNormalizedValueDoesNotInsertTwice() {
        _ = Self.sharedService.addWhitelistEntry(from: "+61 412 345 678", label: "Trusted Caller")
        _ = Self.sharedService.addWhitelistEntry(from: "+61412345678", label: "Trusted Caller Duplicate")

        XCTAssertEqual(PersistenceStore.shared.whitelist.count, 1)
    }

    func testPolicyServiceMatchesBlocklistDomainRule() {
        let blockedDomain = WhitelistEntry(value: "blocked-domain.example.com", label: nil)
        let result = Self.sharedService.evaluate(
            text: "Open https://login.blocked-domain.example.com/reset now.",
            senderName: nil,
            trustedContacts: [],
            blockedDomains: [blockedDomain]
        )

        guard case .block(let reasons) = result else {
            return XCTFail("Expected block result for blocklist domain")
        }

        XCTAssertTrue(reasons.contains(where: { $0.contains("blocked-domain.example.com") }))
        XCTAssertTrue(result.indicators.contains("block rule matched"))
    }

    func testPolicyServiceMatchesBlocklistPhoneRule() {
        let blockedPhone = WhitelistEntry(value: "+61 412 345 678", label: nil)
        let result = Self.sharedService.evaluate(
            text: "Please call me back later.",
            senderName: "Alice Chen (+61 412 345 678)",
            trustedContacts: [],
            blockedDomains: [blockedPhone]
        )

        guard case .block = result else {
            return XCTFail("Expected block result for blocked phone rule")
        }

        XCTAssertTrue(result.indicators.contains("block rule matched"))
    }
//在最终决策时能不能把决策证据写在结果里 测试决策结果中是否包含策略命中的证据和解释
    func testDecisionEngineAddsPolicyEvidenceToAnalyzeResponse() async throws {
        let decisionEngine = PhishingDecisionEngine(
            policyService: Self.sharedService,
            localAnalyzer: Self.sharedLocalAnalyzer
        )
        let trustedContacts = [WhitelistEntry(value: "trusted@company.com", label: "Trusted Sender")]

        let response = try await decisionEngine.evaluate(
            text: "trusted@company.com says the invoice is attached.",
            modality: .text,
            sourceHint: nil,
            trustedContacts: trustedContacts
        )

        let reasoning = response.reasoning ?? ""

        XCTAssertEqual(response.modality, .text)
        XCTAssertFalse(reasoning.isEmpty)
        XCTAssertTrue(reasoning.contains("Decision Path: Automated Policy + Content Analysis."))
        XCTAssertTrue(response.indicators.contains("trusted contact matched"))
        XCTAssertTrue(response.indicators.contains("auto-detected sender context used"))
        XCTAssertTrue(reasoning.contains("trusted@company.com"))
    }

    func testDecisionEngineReturnsBlockWhenBlocklistDomainMatches() async throws {
        let decisionEngine = PhishingDecisionEngine(
            policyService: Self.sharedService,
            localAnalyzer: Self.sharedLocalAnalyzer
        )
        let blockedDomain = WhitelistEntry(value: "blocked-domain.example.com", label: nil)

        let response = try await decisionEngine.evaluate(
            text: "Open https://login.blocked-domain.example.com/reset now.",
            modality: .text,
            sourceHint: nil,
            trustedContacts: [],
            blockedDomains: [blockedDomain]
        )

        XCTAssertTrue(response.indicators.contains("block rule matched"))
        XCTAssertTrue(response.indicators.contains("blocklist override applied"))
        XCTAssertEqual(response.verdict, "phishing")
        XCTAssertGreaterThanOrEqual(response.score, 7.5)
        XCTAssertTrue(response.level == .high || response.level == .critical)
    }

    func testDecisionEngineReturnsAllowWhenWhitelistMatchesBeforeSLM() async throws {
        let decisionEngine = PhishingDecisionEngine(
            policyService: Self.sharedService,
            localAnalyzer: Self.sharedLocalAnalyzer
        )

        let response = try await decisionEngine.evaluate(
            text: "Urgent: verify your password immediately at http://fake-bank.com/login within 10 minutes.",
            modality: .text,
            sourceHint: "trusted@company.com",
            trustedContacts: [WhitelistEntry(value: "trusted@company.com", normalizedValues: ["trusted@company.com", "company.com"], label: "Trusted")]
        )

        XCTAssertEqual(response.verdict, "safe")
        XCTAssertEqual(response.level, .safe)
        XCTAssertTrue(response.indicators.contains("whitelist override applied"))
        XCTAssertTrue((response.reasoning ?? "").contains("before SLM, history, heuristic, or external analysis"))
    }

    func testDecisionEngineAllowPolicyAlwaysCapsHighRiskScore() async throws {
        let decisionEngine = PhishingDecisionEngine(
            policyService: Self.sharedService,
            localAnalyzer: Self.sharedLocalAnalyzer
        )
        let text = "Urgent notice from trusted@company.com: click the secure portal immediately to verify your bank account."

        let untrustedResponse = try await decisionEngine.evaluate(
            text: text,
            modality: .text,
            sourceHint: nil,
            trustedContacts: []
        )
        let trustedResponse = try await decisionEngine.evaluate(
            text: text,
            modality: .text,
            sourceHint: nil,
            trustedContacts: [WhitelistEntry(value: "trusted@company.com", label: "Trusted Sender")]
        )

        XCTAssertTrue(trustedResponse.indicators.contains("trusted contact matched"))
        XCTAssertLessThan(trustedResponse.score, untrustedResponse.score)
    }
//历史记录不是只拿来展示，是拿来反哺判断的
    func testDecisionEngineAddsLocalSimilarityEvidenceToAnalyzeResponse() async throws {
        let decisionEngine = PhishingDecisionEngine(
            policyService: Self.sharedService,
            localAnalyzer: Self.sharedLocalAnalyzer,
            occurrenceHistoryEngine: Self.sharedHistoryEngine
        )
        let previousEvent = DetectionEvent(
            modality: .text,
            riskScore: 1.0,
            riskLevel: .safe,
            summary: "Previous safe event for alice@example.com",
            indicators: ["source: alice@example.com"],
            verdict: "safe",
            processingTimeMs: 10,
            sourceHint: "alice@example.com",
            tiersUsed: [0],
            wasBlocked: false
        )

        let response = try await decisionEngine.evaluate(
            text: "Follow up with alice@example.com about the schedule.",
            modality: .text,
            sourceHint: nil,
            trustedContacts: [],
            historyEvents: [previousEvent]
        )

        let reasoning = response.reasoning ?? ""
        XCTAssertTrue(response.indicators.contains("local similar occurrence found"))
        XCTAssertTrue(response.indicators.contains("matched previous events: 1"))
        XCTAssertTrue(reasoning.contains("Previous safe event for alice@example.com found"))
    }
//ViewModel 在做“统一入口收口”并记录历史
    func testDashboardViewModelUsesUnifiedPathForTextAndRecordsHistory() async {
        PersistenceStore.shared.whitelist = [WhitelistEntry(value: "trusted@company.com", label: "Trusted Sender")]
        let viewModel = DashboardViewModel(localAnalyzer: Self.sharedLocalAnalyzer)

        let score = await viewModel.handleIncomingText(
            text: "trusted@company.com asks you to review the message.",
            sender: nil,
            domain: nil
        )

        XCTAssertEqual(score.modality, .text)
        XCTAssertTrue(score.indicators.contains("trusted contact matched"))
        XCTAssertEqual(PersistenceStore.shared.events.count, 1)
        XCTAssertEqual(PersistenceStore.shared.events.first?.modality, .text)
    }

    func testDashboardViewModelUsesUnifiedPathForVoice() async {
        let viewModel = DashboardViewModel(localAnalyzer: Self.sharedLocalAnalyzer)

        let score = await viewModel.handleVoiceTranscription(
            text: "Call me back at +61 412 345 678.",
            sourceNumber: "+61 412 345 678",
            duration: 3.2
        )

        XCTAssertEqual(score.modality, .voice)
        XCTAssertEqual(PersistenceStore.shared.events.first?.modality, .voice)
        XCTAssertEqual(PersistenceStore.shared.events.first?.sourceHint, "+61 412 345 678")
    }
//测试语音分析是否走统一流程并记录来源号码
    func testDashboardViewModelUsesUnifiedPathForVideo() async {
        let viewModel = DashboardViewModel(localAnalyzer: Self.sharedLocalAnalyzer)

        let score = await viewModel.handleVideoContent(
            ocrText: "Watch the transfer portal at https://secure-payments.example.com now.",
            visualMetadata: "promo clip",
            platform: "video-platform"
        )

        XCTAssertEqual(score.modality, .video)
        XCTAssertEqual(PersistenceStore.shared.events.first?.modality, .video)
        XCTAssertEqual(PersistenceStore.shared.events.first?.sourceHint, "video-platform")
    }

    func testDashboardViewModelAutoDetectsSourceContextForAnalyzeInput() {
        let viewModel = DashboardViewModel(localAnalyzer: Self.sharedLocalAnalyzer)

        let suggested = viewModel.refreshSuggestedSourceContext(
            for: "Please contact noreply@safe-bank.com to verify your account.",
            currentInput: ""
        )

        XCTAssertEqual(suggested, "noreply@safe-bank.com")
        XCTAssertEqual(viewModel.autoDetectedSourceContext, "noreply@safe-bank.com")
        XCTAssertEqual(viewModel.sourceContextStatus, "Auto-detected")
    }
//测试视频分析是否走统一流程并记录来源平台
    func testDashboardViewModelStoresLatestVoiceTranscriptForUI() async {
        let viewModel = DashboardViewModel(localAnalyzer: Self.sharedLocalAnalyzer)

        _ = await viewModel.handleVoiceTranscription(
            text: "I listened to this suspicious call transcript.",
            sourceNumber: "unknown caller",
            duration: 4.0
        )

        XCTAssertEqual(viewModel.latestVoiceTranscript, "I listened to this suspicious call transcript.")
    }

    func testDashboardViewModelStoresLatestVideoPreviewForUI() {
        let viewModel = DashboardViewModel(localAnalyzer: Self.sharedLocalAnalyzer)
        let preview = VideoTextResult(
            speechText: "call support now",
            ocrText: "secure-payments.example.com",
            mergedText: "ASR:\ncall support now\n\nOCR:\nsecure-payments.example.com",
            sourceSummary: "OCR + ASR merged"
        )

        viewModel.updateVideoPreview(preview)

        XCTAssertEqual(viewModel.latestVideoExtractedText, preview.mergedText)
        XCTAssertEqual(viewModel.latestVideoOCRText, preview.ocrText)
        XCTAssertEqual(viewModel.latestVideoSourceSummary, "OCR + ASR merged")
    }
//测试 ViewModel 是否自动识别并保存上下文（如邮箱）
    func testDashboardViewModelCreatesSingleWhitelistPolicySuggestionForSafeAutoDetectedContext() async {
        let viewModel = DashboardViewModel(localAnalyzer: Self.sharedLocalAnalyzer)

        _ = await viewModel.handleIncomingText(
            text: "alice@example.com sent the project update for tomorrow morning.",
            sender: nil,
            domain: nil
        )

        XCTAssertNil(viewModel.trustedContactSuggestion)
        XCTAssertEqual(viewModel.policySuggestion?.action, .whitelist)
        XCTAssertEqual(viewModel.policySuggestion?.value, "alice@example.com")
    }

    func testDashboardViewModelCreatesWhitelistPolicySuggestionForSafeSender() async {
        let viewModel = DashboardViewModel(localAnalyzer: Self.sharedLocalAnalyzer)

        _ = await viewModel.handleIncomingText(
            text: "alice@example.com sent the project update for tomorrow morning.",
            sender: nil,
            domain: nil
        )

        XCTAssertEqual(viewModel.policySuggestion?.action, .whitelist)
        XCTAssertEqual(viewModel.policySuggestion?.value, "alice@example.com")
    }
//测试语音转写结果是否正确保存用于 UI 显示
    func testDashboardViewModelConfirmsWhitelistPolicySuggestion() async {
        let viewModel = DashboardViewModel(localAnalyzer: Self.sharedLocalAnalyzer)

        _ = await viewModel.handleIncomingText(
            text: "alice@example.com sent the project update for tomorrow morning.",
            sender: nil,
            domain: nil
        )
        if let suggestion = viewModel.policySuggestion {
            viewModel.confirmPolicySuggestion(suggestion)
        }

        XCTAssertNil(viewModel.policySuggestion)
        XCTAssertTrue(PersistenceStore.shared.whitelist.contains { $0.value == "alice@example.com" })
        XCTAssertEqual(PersistenceStore.shared.whitelist.count, 1)
    }

    func testDashboardViewModelIgnoresDuplicateWhitelistSuggestionAdds() {
        let viewModel = DashboardViewModel(localAnalyzer: Self.sharedLocalAnalyzer)
        viewModel.policySuggestion = PolicySuggestion(
            action: .whitelist,
            value: "alice@example.com",
            reason: "Trusted sender"
        )

        if let suggestion = viewModel.policySuggestion {
            viewModel.confirmPolicySuggestion(suggestion)
        }
        viewModel.policySuggestion = PolicySuggestion(
            action: .whitelist,
            value: "alice@example.com",
            reason: "Duplicate"
        )
        if let suggestion = viewModel.policySuggestion {
            viewModel.confirmPolicySuggestion(suggestion)
        }

        XCTAssertEqual(PersistenceStore.shared.whitelist.count, 1)
    }

    func testDashboardViewModelCreatesBlocklistPolicySuggestionForHighRiskSender() async {
        let viewModel = DashboardViewModel(localAnalyzer: Self.sharedLocalAnalyzer)

        _ = await viewModel.handleIncomingText(
            text: "Urgent: verify your password immediately at http://fake-bank.com/login within 10 minutes.",
            sender: "alerts@fake-bank.com",
            domain: nil
        )

        XCTAssertEqual(viewModel.policySuggestion?.action, .blocklist)
        XCTAssertEqual(viewModel.policySuggestion?.value, "alerts@fake-bank.com")
    }

    func testDashboardViewModelConfirmsBlocklistPolicySuggestion() {
        let viewModel = DashboardViewModel(localAnalyzer: Self.sharedLocalAnalyzer)
        viewModel.policySuggestion = PolicySuggestion(
            action: .blocklist,
            value: "alerts@fake-bank.com",
            reason: "Risky sender"
        )

        if let suggestion = viewModel.policySuggestion {
            viewModel.confirmPolicySuggestion(suggestion)
        }

        XCTAssertNil(viewModel.policySuggestion)
        XCTAssertTrue(PersistenceStore.shared.blocklist.contains { $0.value == "alerts@fake-bank.com" })
    }
//测试视频提取文本（OCR/ASR）是否正确保存用于 UI
    func testDashboardViewModelPreparesInteractiveTextTestCase() {
        let viewModel = DashboardViewModel(localAnalyzer: Self.sharedLocalAnalyzer)

        let testCase = viewModel.prepareInteractiveTextTestCase()

        XCTAssertEqual(testCase.senderHint, "bob@example.com")
        XCTAssertTrue(testCase.text.contains("bob@example.com"))
        XCTAssertEqual(viewModel.autoDetectedSourceContext, "bob@example.com")
        XCTAssertEqual(viewModel.sourceContextStatus, "Auto-detected")
        XCTAssertTrue(PersistenceStore.shared.events.contains {
            $0.sourceHint == "bob@example.com" && $0.summary.contains("updated roster")
        })
    }
//测试安全内容下是否生成可信联系人建议
    func testDashboardViewModelPreparesInteractiveVoiceTestCase() {
        let viewModel = DashboardViewModel(localAnalyzer: Self.sharedLocalAnalyzer)

        let testCase = viewModel.prepareInteractiveVoiceTestCase()

        XCTAssertEqual(testCase.sourceNumber, "+61 412 345 678")
        XCTAssertTrue(testCase.transcript.contains("+61 412 345 678"))
        XCTAssertEqual(viewModel.autoDetectedSourceContext, "+61 412 345 678")
        XCTAssertEqual(viewModel.sourceContextStatus, "Auto-detected")
        XCTAssertEqual(viewModel.latestVoiceTranscript, testCase.transcript)
        XCTAssertTrue(PersistenceStore.shared.events.contains {
            $0.sourceHint == "+61 412 345 678" && $0.summary.contains("roster confirmation")
        })
    }
//测试是否能把建议联系人加入白名单
    func testDashboardViewModelPreparesInteractiveVideoTestCase() {
        let viewModel = DashboardViewModel(localAnalyzer: Self.sharedLocalAnalyzer)

        let testCase = viewModel.prepareInteractiveVideoTestCase()

        XCTAssertEqual(testCase.platform, "video-demo-platform")
        XCTAssertTrue(testCase.extractedText.contains("secure-payments.example.com"))
        XCTAssertEqual(viewModel.autoDetectedSourceContext, "secure-payments.example.com")
        XCTAssertEqual(viewModel.sourceContextStatus, "Auto-detected")
        XCTAssertEqual(viewModel.latestVideoExtractedText, testCase.extractedText)
        XCTAssertEqual(viewModel.latestVideoOCRText, testCase.ocrText)
        XCTAssertEqual(viewModel.latestVideoSourceSummary, "OCR + ASR merged")
        XCTAssertTrue(PersistenceStore.shared.events.contains {
            $0.sourceHint == "video-demo-platform" && $0.summary.contains("secure-payments.example.com")
        })
    }
//测试系统是否能根据历史记录找到相似事件，并把“相似性证据”加入当前分析结果（indicators 和 reasoning）
    func testDashboardViewModelIncludesLocalSimilarityEvidence() async {
        PersistenceStore.shared.events = [
            DetectionEvent(
                modality: .text,
                riskScore: 1.0,
                riskLevel: .safe,
                summary: "Previous safe event for bob@example.com",
                indicators: ["source: bob@example.com"],
                verdict: "safe",
                processingTimeMs: 10,
                sourceHint: "bob@example.com",
                tiersUsed: [0],
                wasBlocked: false
            )
        ]
        let viewModel = DashboardViewModel(localAnalyzer: Self.sharedLocalAnalyzer)

        let score = await viewModel.handleIncomingText(
            text: "Please contact bob@example.com for the updated roster.",
            sender: nil,
            domain: nil
        )

        XCTAssertTrue(score.indicators.contains("local similar occurrence found"))
        XCTAssertTrue((score.reasoning ?? "").contains("Previous safe event for bob@example.com found"))
    }

    func testWhitelistMatchAppliesAfterConfirmingSuggestedSender() async {
        let viewModel = DashboardViewModel(localAnalyzer: Self.sharedLocalAnalyzer)

        _ = await viewModel.handleIncomingText(
            text: "bob@example.com sent the weekly status update.",
            sender: nil,
            domain: nil
        )
        if let suggestion = viewModel.policySuggestion {
            viewModel.confirmPolicySuggestion(suggestion)
        }

        let secondScore = await viewModel.handleIncomingText(
            text: "bob@example.com sent the weekly status update.",
            sender: nil,
            domain: nil
        )

        XCTAssertTrue(PersistenceStore.shared.whitelist.contains { $0.value == "bob@example.com" })
        XCTAssertTrue(secondScore.indicators.contains("trusted contact matched"))
    }

    func testBlocklistPriorityOverridesWhitelistAndHistory() async throws {
        let decisionEngine = PhishingDecisionEngine(
            policyService: Self.sharedService,
            localAnalyzer: Self.sharedLocalAnalyzer
        )

        let response = try await decisionEngine.evaluate(
            text: "Review your invoice at https://login.fake-bank.com immediately.",
            modality: .text,
            sourceHint: "alerts@fake-bank.com",
            trustedContacts: [WhitelistEntry(value: "alerts@fake-bank.com", label: "Trusted")],
            blockedDomains: [WhitelistEntry(value: "fake-bank.com", label: "Blocked")],
            historyEvents: [
                DetectionEvent(
                    modality: .text,
                    riskScore: 0.0,
                    riskLevel: .safe,
                    summary: "Previous safe event",
                    indicators: [],
                    verdict: "safe",
                    processingTimeMs: 10,
                    sourceHint: "alerts@fake-bank.com",
                    tiersUsed: [0],
                    wasBlocked: false
                )
            ]
        )

        XCTAssertEqual(response.verdict, "phishing")
        XCTAssertTrue(response.indicators.contains("blocklist override applied"))
        XCTAssertFalse(response.indicators.contains("trusted history/source similarity"))
    }

    func testHistoryOccurrenceEnginePreviousSafeEventOnlySlightlyReducesRisk() {
        let result = Self.sharedHistoryEngine.analyze(
            text: "Follow up with bob@example.com on the weekly roster.",
            sourceHint: "bob@example.com",
            modality: .text,
            historyEvents: [
                DetectionEvent(
                    modality: .text,
                    riskScore: 1.0,
                    riskLevel: .safe,
                    summary: "Previous safe event",
                    indicators: [],
                    verdict: "safe",
                    processingTimeMs: 10,
                    sourceHint: "bob@example.com",
                    tiersUsed: [0],
                    wasBlocked: false
                )
            ]
        )

        XCTAssertEqual(result?.matchedSource, "bob@example.com")
        XCTAssertEqual(result?.previousSafeCount, 1)
        XCTAssertEqual(result?.scoreAdjustment, -1.0)
    }

    func testHistoryOccurrenceEnginePreviousSuspiciousEventIncreasesRisk() {
        let result = Self.sharedHistoryEngine.analyze(
            text: "Follow up with bob@example.com on the weekly roster.",
            sourceHint: "bob@example.com",
            modality: .text,
            historyEvents: [
                DetectionEvent(
                    modality: .text,
                    riskScore: 8.0,
                    riskLevel: .high,
                    summary: "Previous phishing event",
                    indicators: [],
                    verdict: "phishing",
                    processingTimeMs: 10,
                    sourceHint: "bob@example.com",
                    tiersUsed: [0],
                    wasBlocked: true
                )
            ]
        )

        XCTAssertEqual(result?.previousSuspiciousCount, 1)
        XCTAssertGreaterThanOrEqual(result?.scoreAdjustment ?? 0.0, 2.0)
    }

    func testHistoryOccurrenceEngineDoesNotReduceRiskWithoutSourceMatch() {
        let result = Self.sharedHistoryEngine.analyze(
            text: "Please confirm the updated roster.",
            sourceHint: "alice@example.com",
            modality: .text,
            historyEvents: [
                DetectionEvent(
                    modality: .text,
                    riskScore: 0.0,
                    riskLevel: .safe,
                    summary: "Please confirm the updated roster.",
                    indicators: [],
                    verdict: "safe",
                    processingTimeMs: 10,
                    sourceHint: "charlie@example.com",
                    tiersUsed: [0],
                    wasBlocked: false
                )
            ]
        )

        XCTAssertFalse(result?.matched ?? false)
        XCTAssertEqual(result?.scoreAdjustment, 0.0)
    }

    func testHistoryStoreCanAddHistory() {
        let event = DetectionEvent(
            modality: .text,
            riskScore: 1.0,
            riskLevel: .low,
            summary: "Added through HistoryStore",
            indicators: [],
            verdict: "safe",
            processingTimeMs: 10,
            sourceHint: "demo@example.com",
            tiersUsed: [0],
            wasBlocked: false,
            inputText: "Hello from history store."
        )

        HistoryStore.shared.add(event)

        XCTAssertEqual(HistoryStore.shared.historyEvents.count, 1)
        XCTAssertEqual(HistoryStore.shared.historyEvents.first?.sourceHint, "demo@example.com")
    }

    func testHistoryStoreCanDeleteHistory() {
        let event = DetectionEvent(
            modality: .text,
            riskScore: 1.0,
            riskLevel: .low,
            summary: "Delete me",
            indicators: [],
            verdict: "safe",
            processingTimeMs: 10,
            sourceHint: "delete@example.com",
            tiersUsed: [0],
            wasBlocked: false,
            inputText: "Delete me."
        )

        HistoryStore.shared.add(event)
        HistoryStore.shared.delete(id: event.id)

        XCTAssertTrue(HistoryStore.shared.historyEvents.isEmpty)
    }

    func testHistoryStoreCanClearHistory() {
        HistoryStore.shared.add(
            DetectionEvent(
                modality: .text,
                riskScore: 1.0,
                riskLevel: .low,
                summary: "First",
                indicators: [],
                verdict: "safe",
                processingTimeMs: 10,
                sourceHint: "first@example.com",
                tiersUsed: [0],
                wasBlocked: false,
                inputText: "First event."
            )
        )
        HistoryStore.shared.add(
            DetectionEvent(
                modality: .voice,
                riskScore: 2.0,
                riskLevel: .medium,
                summary: "Second",
                indicators: [],
                verdict: "suspicious",
                processingTimeMs: 10,
                sourceHint: "+61412345678",
                tiersUsed: [0],
                wasBlocked: false,
                inputText: "Second event."
            )
        )

        HistoryStore.shared.clear()

        XCTAssertTrue(HistoryStore.shared.historyEvents.isEmpty)
    }

    func testHistoryStoreSavesToUserDefaults() {
        let event = DetectionEvent(
            modality: .text,
            riskScore: 0.0,
            riskLevel: .safe,
            summary: "Persist me",
            indicators: [],
            verdict: "safe",
            processingTimeMs: 10,
            sourceHint: "persist@example.com",
            tiersUsed: [0],
            wasBlocked: false,
            inputText: "Persist me."
        )

        HistoryStore.shared.add(event)

        XCTAssertNotNil(UserDefaults.standard.data(forKey: "pg_events"))
    }

    func testHistoryMatcherMatchesSameSource() {
        let event = DetectionEvent(
            modality: .text,
            riskScore: 1.0,
            riskLevel: .safe,
            summary: "Previous event",
            indicators: [],
            verdict: "safe",
            processingTimeMs: 10,
            sourceHint: "bob@example.com",
            tiersUsed: [0],
            wasBlocked: false,
            inputText: "Weekly roster update."
        )

        let result = Self.sharedHistoryMatcher.searchSimilarEvents(
            for: HistorySearchInput(source: "bob@example.com", modality: .text, inputText: "Another roster update."),
            in: [event]
        )

        XCTAssertTrue(result.matched)
        XCTAssertEqual(result.matchedSource, "bob@example.com")
    }

    func testHistoryMatcherMatchesSimilarText() {
        let event = DetectionEvent(
            modality: .text,
            riskScore: 1.0,
            riskLevel: .safe,
            summary: "Weekly roster update reminder",
            indicators: [],
            verdict: "safe",
            processingTimeMs: 10,
            sourceHint: "alice@example.com",
            tiersUsed: [0],
            wasBlocked: false,
            inputText: "Please confirm the weekly roster update."
        )

        let result = Self.sharedHistoryMatcher.searchSimilarEvents(
            for: HistorySearchInput(source: "different@example.com", modality: .text, inputText: "Confirm the weekly roster update today."),
            in: [event]
        )

        XCTAssertTrue(result.matched)
        XCTAssertNil(result.matchedSource)
    }

    func testHistoryServiceReturnsHistoryDetail() {
        let event = DetectionEvent(
            modality: .text,
            riskScore: 1.0,
            riskLevel: .safe,
            summary: "Detail event",
            indicators: ["source: detail@example.com"],
            verdict: "safe",
            processingTimeMs: 10,
            sourceHint: "detail@example.com",
            tiersUsed: [0],
            wasBlocked: false,
            inputText: "Detail event input."
        )

        Self.sharedHistoryService.addHistory(event)
        let detail = Self.sharedHistoryService.getHistoryDetail(id: event.id)

        XCTAssertEqual(detail?.id, event.id)
        XCTAssertEqual(detail?.inputText, "Detail event input.")
    }

    func testHistoryDetailCanAddWhitelistFromHistoryEvent() {
        let event = DetectionEvent(
            modality: .text,
            riskScore: 0.0,
            riskLevel: .safe,
            summary: "Safe update from bob@example.com",
            indicators: [],
            verdict: "safe",
            processingTimeMs: 10,
            sourceHint: "bob@example.com",
            tiersUsed: [0],
            wasBlocked: false,
            inputText: "Please contact bob@example.com for the updated roster."
        )

        Self.sharedHistoryService.addHistory(event)
        let result = Self.sharedHistoryService.addHistoryEventToWhitelist(id: event.id)

        XCTAssertEqual(result.status, .added)
        XCTAssertTrue(PersistenceStore.shared.whitelist.contains { $0.value == "bob@example.com" })
    }

    func testHistoryDetailCanAddBlocklistFromHistoryEvent() {
        let event = DetectionEvent(
            modality: .text,
            riskScore: 9.0,
            riskLevel: .high,
            summary: "Risky sender fake-bank.com",
            indicators: [],
            verdict: "phishing",
            processingTimeMs: 10,
            sourceHint: nil,
            tiersUsed: [2],
            wasBlocked: true,
            inputText: "Verify now at http://fake-bank.com/login"
        )

        Self.sharedHistoryService.addHistory(event)
        let result = Self.sharedHistoryService.addHistoryEventToBlocklist(id: event.id)

        XCTAssertEqual(result.status, .added)
        XCTAssertTrue(PersistenceStore.shared.blocklist.contains {
            $0.primaryMatchValue == "fake-bank.com" || $0.value == "fake-bank.com"
        })
    }

    func testHistoryDetailDuplicateWhitelistAddDoesNotInsertTwice() {
        let event = DetectionEvent(
            modality: .text,
            riskScore: 0.0,
            riskLevel: .safe,
            summary: "Safe update from bob@example.com",
            indicators: [],
            verdict: "safe",
            processingTimeMs: 10,
            sourceHint: "bob@example.com",
            tiersUsed: [0],
            wasBlocked: false,
            inputText: "Please contact bob@example.com for the updated roster."
        )

        Self.sharedHistoryService.addHistory(event)
        let first = Self.sharedHistoryService.addHistoryEventToWhitelist(id: event.id)
        let second = Self.sharedHistoryService.addHistoryEventToWhitelist(id: event.id)

        XCTAssertEqual(first.status, .added)
        XCTAssertEqual(second.status, .alreadyExists)
        XCTAssertEqual(PersistenceStore.shared.whitelist.count, 1)
    }

    func testHistoryOccurrenceEngineReturnsMatchedResultForSimilarEvent() {
        let event = DetectionEvent(
            modality: .text,
            riskScore: 1.0,
            riskLevel: .safe,
            summary: "Similar sender",
            indicators: [],
            verdict: "safe",
            processingTimeMs: 10,
            sourceHint: "bob@example.com",
            tiersUsed: [0],
            wasBlocked: false,
            inputText: "Please review the weekly roster update."
        )

        let result = Self.sharedHistoryEngine.analyze(
            text: "Please review the weekly roster update.",
            sourceHint: "bob@example.com",
            modality: .text,
            historyEvents: [event]
        )

        XCTAssertTrue(result?.matched ?? false)
        XCTAssertEqual(result?.matchedCount, 1)
    }

    func testAnalyzeViewSourceNoLongerContainsDebugChainButtons() throws {
        let testFileURL = URL(fileURLWithPath: #filePath)
        let projectRoot = testFileURL.deletingLastPathComponent().deletingLastPathComponent()
        let viewsURL = projectRoot.appendingPathComponent("PhishGuard/Views/Views.swift")
        let contents = try String(contentsOf: viewsURL)

        XCTAssertFalse(contents.contains("DEBUG CHAIN TESTS"))
        XCTAssertFalse(contents.contains("Test Policy / History"))
        XCTAssertFalse(contents.contains("Test Local SLM"))
        XCTAssertFalse(contents.contains("Test Merged Decision"))
        XCTAssertTrue(contents.contains("View Details"))
    }
    
    
    
    /////////////////////////////////////////
//测试外部分析返回后，系统是否能从文本中自动提取邮箱并回填为 source context（autoDetectedSourceContext）
    func testExternalAnalysisAutoDetectsSenderContextForBackfill() async throws {
        let response = AnalyzeResponse(
            requestId: UUID().uuidString,
            modality: .text,
            inputText: "Please reply to sender@demo.com about the meeting.",
            score: 1.0,
            level: .safe,
            verdict: "safe",
            confidence: 0.9,
            reasoning: "External analysis marked this as safe.",
            indicators: ["external label: safe"],
            tierUsed: DetectionTier.localServer.rawValue,
            tierName: DetectionTier.localServer.apiName,
            latencyMs: 30,
            wasEscalated: true
        )
        let externalAnalyzer = StubExternalAnalysisAPI(response: response)
        let viewModel = DashboardViewModel(localAnalyzer: Self.sharedLocalAnalyzer, externalAnalyzer: externalAnalyzer)

        _ = try await viewModel.handleExternalTextAnalysis(
            text: "Please reply to sender@demo.com about the meeting.",
            sender: nil,
            domain: nil
        )

        XCTAssertEqual(viewModel.autoDetectedSourceContext, "sender@demo.com")
        XCTAssertEqual(viewModel.sourceContextStatus, "Auto-detected")
    }

    func testOnDeviceSLMInferenceReturnsProbabilitiesForPhishingText() throws {
        let phishingText = "Dear user, your account has been compromised. Click here to verify: http://fake-bank.com/login"
        let runner = Self.sharedRunner

        let result = try runner.detect(phishingText)

        print("[SLM Test] probabilities: \(result.allProbabilities)")
        print("[SLM Test] prediction: \(result.prediction), risk: \(result.phishingRisk), confidence: \(result.confidence)")

        XCTAssertFalse(result.allProbabilities.isEmpty)
        XCTAssertNotNil(result.allProbabilities["phishing_url"])
        XCTAssertNotNil(result.allProbabilities["phishing_url_alt"])
        XCTAssertGreaterThanOrEqual(result.phishingRisk, 0.0)
        XCTAssertLessThanOrEqual(result.phishingRisk, 2.0)
    }

    func testSimpleLegitimateEmailRemainsLowRisk() async throws {
        let result = try await Self.sharedLocalAnalyzer.analyze(
            text: "Hi Sarah, just checking whether you're free for lunch tomorrow. No action is needed.",
            modality: .text
        )

        print("[Fusion Sample] simple legitimate email => score=\(result.score), verdict=\(result.verdict)")
        XCTAssertLessThan(result.score, 3.0)
        XCTAssertTrue(result.level == .safe || result.level == .low)
    }

    func testLegitimateOrderNotificationIsNotTenOutOfTen() async throws {
        let result = try await Self.sharedLocalAnalyzer.analyze(
            text: "Your order #48371 has shipped and is available in your account portal. You can view order details at https://store.example.com/orders/48371. No action is required.",
            modality: .text
        )

        print("[Fusion Sample] legitimate order notification => score=\(result.score), verdict=\(result.verdict)")
        XCTAssertLessThan(result.score, 10.0)
        XCTAssertLessThanOrEqual(result.score, 7.0)
    }

    func testClearPhishingEmailWithUrlUrgencyAndSensitiveRequestBecomesHighRisk() async throws {
        let result = try await Self.sharedLocalAnalyzer.analyze(
            text: "Urgent: verify your password and bank account details immediately at http://fake-bank.com/login within 10 minutes to avoid permanent suspension.",
            modality: .text
        )

        print("[Fusion Sample] clear phishing email => score=\(result.score), verdict=\(result.verdict)")
        XCTAssertGreaterThanOrEqual(result.score, 8.0)
        XCTAssertEqual(result.verdict, "phishing")
    }

    func testBlocklistWithUrlAndSensitiveRequestEscalatesToCritical() async throws {
        let decisionEngine = PhishingDecisionEngine(
            policyService: Self.sharedService,
            localAnalyzer: Self.sharedLocalAnalyzer
        )
        let blockedDomain = WhitelistEntry(value: "fake-bank.com", label: nil)

        let response = try await decisionEngine.evaluate(
            text: "Urgent security alert: verify your password and bank account details at http://fake-bank.com/login immediately.",
            modality: .text,
            sourceHint: nil,
            trustedContacts: [],
            blockedDomains: [blockedDomain]
        )

        XCTAssertEqual(response.level, .critical)
        XCTAssertEqual(response.verdict, "phishing")
        XCTAssertGreaterThanOrEqual(response.score, 9.0)
        XCTAssertTrue(response.indicators.contains("critical block override"))
        XCTAssertTrue((response.reasoning ?? "").contains("critical"))
    }

    func testTrustedSenderMatchReducesRiskComparedToUntrustedPath() async throws {
        let decisionEngine = PhishingDecisionEngine(
            policyService: Self.sharedService,
            localAnalyzer: Self.sharedLocalAnalyzer
        )
        let text = "trusted@company.com asks you to verify your account at http://secure-portal.example.com/login."

        let untrustedResponse = try await decisionEngine.evaluate(
            text: text,
            modality: .text,
            sourceHint: nil,
            trustedContacts: []
        )
        let trustedResponse = try await decisionEngine.evaluate(
            text: text,
            modality: .text,
            sourceHint: nil,
            trustedContacts: [WhitelistEntry(value: "trusted@company.com", label: "Trusted Sender")]
        )

        XCTAssertLessThan(trustedResponse.score, untrustedResponse.score)
        XCTAssertTrue(trustedResponse.indicators.contains("trusted contact matched"))
    }

    func testGeneratedPhishingDetectorClassExposesCompiledModelURL() {
        let generatedURL = PhishingDetector.urlOfModelInThisBundle
        XCTAssertEqual(generatedURL.lastPathComponent, "PhishingDetector.mlmodelc")
        XCTAssertTrue(FileManager.default.fileExists(atPath: generatedURL.path))
    }

    private func makeEntry(
        mode: PolicyMode,
        kind: PolicyKind,
        matchType: PolicyMatchType,
        value: String,
        source: PolicySource
    ) throws -> PolicyEntry {
        PolicyEntry(
            mode: mode,
            kind: kind,
            matchType: matchType,
            source: source,
            value: value,
            normalizedValue: try PolicyNormalizer.shared.normalize(
                kind: kind,
                value: value,
                matchType: matchType
            ),
            note: nil
        )
    }
}

private final class StubExternalAnalysisAPI: ExternalAnalysisAPI {
    private let stubResponse: AnalyzeResponse

    init(response: AnalyzeResponse) {
        self.stubResponse = response
        super.init(baseURL: URL(string: "http://127.0.0.1:5000")!)
    }

    override func analyzeText(_ text: String, modality: ModalityType = .text) async throws -> AnalyzeResponse {
        stubResponse
    }
}
