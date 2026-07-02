//逻辑实现   管理页面状态。 接受三种输入。自动识别来源。 调用引擎判断风险。 
import Foundation
import SwiftUI
import Combine

struct TrustedContactSuggestion: Equatable {
    let value: String
    let reason: String
}

enum PolicySuggestionAction: Equatable {
    case whitelist
    case blocklist
}

struct PolicySuggestion: Identifiable, Equatable {
    let action: PolicySuggestionAction
    let value: String
    let reason: String

    var id: String {
        "\(action)-\(value.lowercased())"
    }
}

struct InteractiveAnalyzeTestCase {
    let title: String
    let text: String
    let senderHint: String
    let supportingHistoryEvent: DetectionEvent
}

struct InteractiveVoiceTestCase {
    let title: String
    let transcript: String
    let sourceNumber: String
    let duration: Double
    let supportingHistoryEvent: DetectionEvent
}

struct InteractiveVideoTestCase {
    let title: String
    let extractedText: String
    let ocrText: String
    let sourceSummary: String
    let platform: String
    let supportingHistoryEvent: DetectionEvent
}

enum DebugChainState: String {
    case success = "Success"
    case failure = "Failure"
}

struct DebugChainResult {
    let title: String
    let state: DebugChainState
    let summary: String
    let reasoning: String
    let indicators: [String]
    let details: [String]
}

struct LoadedEmailDraft: Equatable {
    let sender: String
    let subject: String
    let body: String
    let suggestedSourceContext: String
}

struct LoadedTextMessageDraft: Equatable {
    let sender: String
    let messageBody: String
}

@MainActor
final class DashboardViewModel: ObservableObject {

    // MARK: - Published State

    @Published var currentRiskScore: RiskScore = .safeDefault
    @Published var tierStatuses: [TierStatus] = []

    @Published var monitorChannelStatuses: [MonitorChannelStatus] = [
        MonitorChannelStatus(type: .email, state: .inactive, isEnabled: false),
        MonitorChannelStatus(type: .message, state: .inactive, isEnabled: false),
        MonitorChannelStatus(type: .voice, state: .inactive, isEnabled: false),
        MonitorChannelStatus(type: .video, state: .inactive, isEnabled: false)
    ]
    @Published var recentEvents: [DetectionEvent] = []
    @Published var activeAlert: DetectionEvent? = nil
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    @Published var autoDetectedSourceContext: String = ""
    @Published var sourceContextStatus: String? = nil
    @Published var latestVoiceTranscript: String = ""
    @Published var latestVideoExtractedText: String = ""
    @Published var latestVideoOCRText: String = ""
    @Published var latestVideoSourceSummary: String = ""
    @Published var trustedContactSuggestion: TrustedContactSuggestion? = nil
    @Published var policySuggestion: PolicySuggestion? = nil
    @Published var debugChainResult: DebugChainResult? = nil
    @Published var loadedEmailDraft: LoadedEmailDraft? = nil
    @Published var loadedTextMessageDraft: LoadedTextMessageDraft? = nil
    @Published var isEmailMonitoringActive: Bool = false
    @Published var isMessageMonitoringActive: Bool = false

    // MARK: - Dependencies

    private let localAnalyzer: LocalSLMService
    private let decisionEngine: PhishingDecisionEngine
    private let externalAnalyzer: ExternalAnalysisAPI
    private let emailService: EmailFetching
    private let policyService: PolicyService
    private let historyService: HistoryService
    private var emailPollingTask: Task<Void, Never>?
    private var messagePollingTask: Task<Void, Never>?
    private var lastSeenEmailSignature: String?
    private var lastSeenTextMessageSignature: String?

    init(
        localAnalyzer: LocalSLMService? = nil,
        externalAnalyzer: ExternalAnalysisAPI? = nil,
        emailService: EmailFetching? = nil
    ) {
        let resolvedLocalAnalyzer = localAnalyzer ?? .shared
        self.localAnalyzer = resolvedLocalAnalyzer
        self.policyService = .shared
        self.historyService = .shared
        self.decisionEngine = PhishingDecisionEngine(localAnalyzer: resolvedLocalAnalyzer)
        self.externalAnalyzer = externalAnalyzer ?? .shared
        self.emailService = emailService ?? EmailService.shared
        self.tierStatuses = resolvedLocalAnalyzer.tierStatus()
        self.recentEvents = historyService.historyEvents
        Task { @MainActor [self] in
            await loadInitialData()
        }
    }

    deinit {
        emailPollingTask?.cancel()
        messagePollingTask?.cancel()
    }

    // MARK: - Load & Refresh

    func loadInitialData() async {
        isLoading = true
        defer { isLoading = false }
        historyService.compactHistoryIfNeeded()
        recentEvents = historyService.historyEvents
        await refreshTierStatus()
    }

    func refreshTierStatus() async {
        tierStatuses = localAnalyzer.tierStatus()
    }

    // MARK: - Analyze (called by capture layer)

    func handleIncomingText(text: String, sender: String?, domain: String?) async -> RiskScore {
        return await analyzeNormalizedText(
            text: text,
            modality: .text,
            sourceHint: sender ?? domain
        )
    }

    func handleExternalTextAnalysis(text: String, sender: String?, domain: String?) async throws -> RiskScore {
        try await handleExternalAnalysis(
            text: text,
            modality: .text,
            sourceHint: sender ?? domain
        )
    }

    func handleExternalAnalysis(text: String, modality: ModalityType, sourceHint: String?) async throws -> RiskScore {
        updateModalityState(modality, state: .analyzing)
        let normalizedText = text.trimmingCharacters(in: .whitespacesAndNewlines)
        let effectiveSourceHint = sourceHint
        if modality == .text {
            _ = refreshSuggestedSourceContext(
                for: normalizedText,
                currentInput: effectiveSourceHint ?? ""
            )
        } else if let suggested = decisionEngine.suggestedContext(text: normalizedText, sourceHint: effectiveSourceHint) {
            autoDetectedSourceContext = suggested
        }
        do {
            let response = try await externalAnalyzer.analyzeText(text, modality: modality)
            let score = makeRiskScore(from: response, modality: modality)
            let resolvedSourceHint = effectiveSourceHint?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty == false
                ? effectiveSourceHint?.trimmingCharacters(in: .whitespacesAndNewlines)
                : autoDetectedSourceContext.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
                    ? nil
                    : autoDetectedSourceContext
            recordAnalysisResult(score, inputText: normalizedText, sourceHint: resolvedSourceHint)
            updateModalityState(modality, state: .active)
            updateTierFromResponse(response)
            errorMessage = nil
            return score
        } catch {
            updateModalityState(modality, state: .error)
            tierStatuses = localAnalyzer.tierStatus()
            errorMessage = error.localizedDescription
            throw error
        }
    }

    func handleVoiceTranscription(text: String, sourceNumber: String?, duration: Double) async -> RiskScore {
        print("[DashboardViewModel] handleVoiceTranscription called, characters: \(text.count), duration: \(duration)")
        latestVoiceTranscript = text.trimmingCharacters(in: .whitespacesAndNewlines)
        return await analyzeNormalizedText(
            text: text,
            modality: .voice,
            sourceHint: sourceNumber
        )
    }

    func handleVideoContent(ocrText: String?, visualMetadata: String?, platform: String?) async -> RiskScore {
        let text = ocrText?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""

        return await analyzeNormalizedText(
            text: text,
            modality: .video,
            sourceHint: platform ?? visualMetadata
        )
    }

    func refreshSuggestedSourceContext(for text: String, currentInput: String) -> String? {
        let normalizedText = text.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !normalizedText.isEmpty else {
            autoDetectedSourceContext = ""
            if currentInput.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                sourceContextStatus = nil
            }
            return nil
        }

        guard let suggestion = decisionEngine.suggestedContext(text: normalizedText)?
            .trimmingCharacters(in: .whitespacesAndNewlines),
              !suggestion.isEmpty else {
            autoDetectedSourceContext = ""
            if currentInput.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                sourceContextStatus = nil
            }
            return nil
        }

        autoDetectedSourceContext = suggestion
        let trimmedCurrentInput = currentInput.trimmingCharacters(in: .whitespacesAndNewlines)
        if trimmedCurrentInput.isEmpty || trimmedCurrentInput == suggestion {
            sourceContextStatus = "Auto-detected"
            return suggestion
        }

        sourceContextStatus = "Edited"
        return nil
    }

    func updateSourceContextStatus(for input: String) {
        let trimmedInput = input.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedInput.isEmpty else {
            sourceContextStatus = nil
            return
        }

        if !autoDetectedSourceContext.isEmpty && trimmedInput == autoDetectedSourceContext {
            sourceContextStatus = "Auto-detected"
        } else {
            sourceContextStatus = "Edited"
        }
    }

    func updateVideoPreview(_ result: VideoTextResult) {
        latestVideoExtractedText = result.mergedText.trimmingCharacters(in: .whitespacesAndNewlines)
        latestVideoOCRText = result.ocrText.trimmingCharacters(in: .whitespacesAndNewlines)
        latestVideoSourceSummary = result.sourceSummary.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    func clearVoicePreview() {
        latestVoiceTranscript = ""
    }

    func clearVideoPreview() {
        latestVideoExtractedText = ""
        latestVideoOCRText = ""
        latestVideoSourceSummary = ""
    }

    func addTrustedContactSuggestionToWhitelist() {
        guard let suggestion = trustedContactSuggestion else { return }
        PersistenceStore.shared.addWhitelist(
            value: suggestion.value,
            label: "Suggested Trusted Contact"
        )
        trustedContactSuggestion = nil
    }

    func dismissTrustedContactSuggestion() {
        trustedContactSuggestion = nil
    }

    func confirmPolicySuggestion(_ suggestion: PolicySuggestion) {
        print("[Policy] confirm suggestion:", suggestion.action, suggestion.value)
        switch suggestion.action {
        case .whitelist:
            PersistenceStore.shared.addWhitelist(
                value: suggestion.value,
                label: "Suggested Trusted Contact"
            )
        case .blocklist:
            PersistenceStore.shared.addBlocklist(
                value: suggestion.value,
                label: "Suggested Risky Sender"
            )
        }
        policySuggestion = nil
    }

    func dismissPolicySuggestion() {
        policySuggestion = nil
    }

    func clearDebugChainResult() {
        debugChainResult = nil
    }

    func loadLatestEmailIntoInput() {
        loadedEmailDraft = nil
        errorMessage = nil

        Task { [weak self] in
            guard let self else { return }
            await self.performLoadLatestEmailIntoInput()
        }
    }

    func loadLatestTextMessageIntoInput() {
        loadedTextMessageDraft = nil
        errorMessage = nil
        loadTextMessageCaptureIntoDraft(
            latestCaptureForManualLoad(),
            markAsSeen: false
        )
    }

    func toggleEmailMonitoring() {
        if isEmailMonitoringActive {
            stopEmailMonitoring()
        } else {
            startEmailMonitoring()
        }
    }

    func toggleMessageMonitoring() {
        if isMessageMonitoringActive {
            print("[MessageMonitor] Monitoring stopped")
            messagePollingTask?.cancel()
            messagePollingTask = nil
            isMessageMonitoringActive = false
            setMessageMonitoringState(isEnabled: false, state: .inactive)
            return
        }

        print("[MessageMonitor] Monitoring started")
        isMessageMonitoringActive = true
        setMessageMonitoringState(isEnabled: true, state: .active)
        messagePollingTask = Task { [weak self] in
            guard let self else { return }
            await self.checkLatestCapturedTextMessageOnce()
            while !Task.isCancelled {
                try? await Task.sleep(nanoseconds: 10_000_000_000)
                if Task.isCancelled { break }
                await self.checkLatestCapturedTextMessageOnce()
            }
        }
    }

#if DEBUG
    func injectTestSMSCaptureForDebug() {
        print("[MessageMonitorDebug] Injecting test SMS capture")

        let result = TextMessageCaptureResult(
            sender: "+61400000000",
            messageBody: "Your parcel delivery is currently on hold because some recipient details could not be confirmed. Please review your delivery information as soon as possible.",
            receivedAt: Date()
        )

        TextMessageSharedStore.saveLatestCapture(result)
        print("[MessageMonitorDebug] Test SMS capture saved")

        if !isMessageMonitoringActive {
            print("[MessageMonitorDebug] Message monitoring started for injected test capture")
            toggleMessageMonitoring()
        }
    }
#endif

    func startEmailMonitoring() {
        guard emailPollingTask == nil else { return }
        isEmailMonitoringActive = true
        setEmailMonitoringState(isEnabled: true, state: .active)
        print("Email monitoring started")

        emailPollingTask = Task { [weak self] in
            guard let self else { return }
            await self.checkLatestEmailOnce()
            while !Task.isCancelled {
                try? await Task.sleep(nanoseconds: 10_000_000_000)
                if Task.isCancelled { break }
                await self.checkLatestEmailOnce()
            }
        }
    }

    func stopEmailMonitoring() {
        print("Email monitoring stopped")
        emailPollingTask?.cancel()
        emailPollingTask = nil
        isEmailMonitoringActive = false
        setEmailMonitoringState(isEnabled: false, state: .inactive)
    }

    func checkLatestEmailOnce() async {
        print("Checking latest email")

        do {
            let email = try await emailService.fetchLatestEmail()
            let signature = makeEmailSignature(for: email)
            guard signature != lastSeenEmailSignature else {
                print("No new email")
                return
            }

            lastSeenEmailSignature = signature
            print("New email detected")

            let draft = makeLoadedEmailDraft(from: email)
            let analysisText = """
            From: \(email.sender)
            Subject: \(email.subject)

            \(email.body)
            """

            loadedEmailDraft = draft
            autoDetectedSourceContext = draft.suggestedSourceContext
            sourceContextStatus = "Auto-detected"
            errorMessage = nil

            _ = await analyzeNormalizedText(
                text: analysisText,
                modality: .text,
                sourceHint: draft.suggestedSourceContext
            )
        } catch {
            errorMessage = error.localizedDescription
            print("Email fetch failed: \(error.localizedDescription)")
        }
    }

    func prepareInteractiveTextTestCase() -> InteractiveAnalyzeTestCase {
        let sender = "bob@example.com"
        let historyEvent = DetectionEvent(
            modality: .text,
            riskScore: 1.0,
            riskLevel: .safe,
            summary: "Previous safe event for bob@example.com about the updated roster.",
            indicators: ["source: bob@example.com", "local demo event"],
            verdict: "safe",
            processingTimeMs: 12,
            sourceHint: sender,
            tiersUsed: [DetectionTier.onDevice.rawValue],
            wasBlocked: false
        )
        let testCase = InteractiveAnalyzeTestCase(
            title: "Local Similarity Demo",
            text: "Please contact bob@example.com for the updated roster and schedule confirmation.",
            senderHint: sender,
            supportingHistoryEvent: historyEvent
        )

        if !historyService.historyEvents.contains(where: {
            $0.sourceHint == sender && $0.summary == historyEvent.summary
        }) {
            historyService.addHistory(historyEvent)
        }

        recentEvents = historyService.historyEvents
        autoDetectedSourceContext = sender
        sourceContextStatus = "Auto-detected"
        errorMessage = nil

        return testCase
    }

    private func performLoadLatestEmailIntoInput() async {
        isLoading = true
        defer { isLoading = false }

        do {
            let email = try await emailService.fetchLatestEmail()
            let draft = makeLoadedEmailDraft(from: email)
            autoDetectedSourceContext = draft.suggestedSourceContext
            sourceContextStatus = "Auto-detected"
            loadedEmailDraft = draft
            print("[DashboardViewModel] latest email loaded into draft from: \(email.sender)")
            print("[DashboardViewModel] latest email subject: \(email.subject)")
        } catch {
            errorMessage = error.localizedDescription
            print("[DashboardViewModel] failed to load latest email: \(error.localizedDescription)")
        }
    }

    private func latestCaptureForManualLoad() -> TextMessageCaptureResult? {
        let sharedStoreAvailable = TextMessageSharedStore.canOpenSharedStore()
        if sharedStoreAvailable {
            print("[MessageMonitor] App Group shared store available")
        } else {
            print("[MessageMonitor] App Group shared store unavailable")
        }
        print("[MessageMonitor] Checking latest captured text message")
        let capture = TextMessageSharedStore.loadLatestCapture()
        guard let capture else {
            print("[MessageMonitor] No captured text message found")
            print("[MessageMonitor] Extension connection status: \(sharedStoreAvailable ? "shared store available, but no captured message found" : "shared store unavailable")")
            errorMessage = "No captured text message found yet."
            return nil
        }
        print("[MessageMonitor] Extension connection status: captured message found from \(capture.sender)")
        return capture
    }

    private func loadTextMessageCaptureIntoDraft(_ capture: TextMessageCaptureResult?, markAsSeen: Bool) {
        guard let capture else { return }

        loadedTextMessageDraft = LoadedTextMessageDraft(
            sender: capture.sender,
            messageBody: capture.messageBody
        )
        autoDetectedSourceContext = capture.sender.trimmingCharacters(in: .whitespacesAndNewlines)
        sourceContextStatus = autoDetectedSourceContext.isEmpty ? nil : "Auto-detected"
        errorMessage = nil

        if markAsSeen {
            lastSeenTextMessageSignature = makeTextMessageSignature(for: capture)
        }
    }

    private func makeTextMessageSignature(for capture: TextMessageCaptureResult) -> String {
        "\(capture.id.uuidString)|\(capture.sender)|\(capture.messageBody)|\(capture.receivedAt.timeIntervalSince1970)"
    }

    private func checkLatestCapturedTextMessageOnce() async {
        let sharedStoreAvailable = TextMessageSharedStore.canOpenSharedStore()
        if sharedStoreAvailable {
            print("[MessageMonitor] App Group shared store available")
        } else {
            print("[MessageMonitor] App Group shared store unavailable")
        }
        print("[MessageMonitor] Checking latest captured text message")

        guard let capture = TextMessageSharedStore.loadLatestCapture() else {
            print("[MessageMonitor] No captured text message found")
            print("[MessageMonitor] Extension connection status: \(sharedStoreAvailable ? "shared store available, but no captured message found" : "shared store unavailable")")
            return
        }

        print("[MessageMonitor] Extension connection status: captured message found from \(capture.sender)")

        let signature = makeTextMessageSignature(for: capture)
        guard signature != lastSeenTextMessageSignature else {
            print("[MessageMonitor] No new text message")
            return
        }

        print("[MessageMonitor] New captured text message detected: \(capture.sender)")
        loadTextMessageCaptureIntoDraft(capture, markAsSeen: true)
        print("[MessageMonitor] Auto analysis started")
        _ = await analyzeNormalizedText(
            text: capture.messageBody,
            modality: .text,
            sourceHint: capture.sender,
            monitorChannelOverride: .message
        )
        print("[MessageMonitor] Auto analysis completed")
    }

    private func extractDomain(from value: String) -> String? {
        let pattern = #"[A-Z0-9._%+-]+@([A-Z0-9.-]+\.[A-Z]{2,})"#
        guard let regex = try? NSRegularExpression(pattern: pattern, options: [.caseInsensitive]) else {
            return nil
        }

        let nsRange = NSRange(value.startIndex..<value.endIndex, in: value)
        guard let match = regex.firstMatch(in: value, options: [], range: nsRange),
              let range = Range(match.range(at: 1), in: value) else {
            return nil
        }

        return String(value[range]).lowercased()
    }

    func prepareInteractiveVoiceTestCase() -> InteractiveVoiceTestCase {
        let sourceNumber = "+61 412 345 678"
        let historyEvent = DetectionEvent(
            modality: .voice,
            riskScore: 1.2,
            riskLevel: .safe,
            summary: "Previous safe caller event for +61 412 345 678 about roster confirmation.",
            indicators: ["source: +61 412 345 678", "local voice demo event"],
            verdict: "safe",
            processingTimeMs: 16,
            sourceHint: sourceNumber,
            tiersUsed: [DetectionTier.onDevice.rawValue],
            wasBlocked: false
        )
        let testCase = InteractiveVoiceTestCase(
            title: "Voice Similarity Demo",
            transcript: "This is Bob calling from +61 412 345 678 to confirm the updated roster for tomorrow.",
            sourceNumber: sourceNumber,
            duration: 4.0,
            supportingHistoryEvent: historyEvent
        )

        if !historyService.historyEvents.contains(where: {
            $0.sourceHint == sourceNumber && $0.summary == historyEvent.summary
        }) {
            historyService.addHistory(historyEvent)
        }

        recentEvents = historyService.historyEvents
        autoDetectedSourceContext = sourceNumber
        sourceContextStatus = "Auto-detected"
        latestVoiceTranscript = testCase.transcript
        errorMessage = nil

        return testCase
    }

    func prepareInteractiveVideoTestCase() -> InteractiveVideoTestCase {
        let platform = "video-demo-platform"
        let extractedText = "ASR:\nWatch the secure roster portal now.\n\nOCR:\nsecure-payments.example.com"
        let historyEvent = DetectionEvent(
            modality: .video,
            riskScore: 1.4,
            riskLevel: .safe,
            summary: "Previous safe video event referencing secure-payments.example.com and roster confirmation.",
            indicators: ["source: secure-payments.example.com", "local video demo event"],
            verdict: "safe",
            processingTimeMs: 18,
            sourceHint: platform,
            tiersUsed: [DetectionTier.onDevice.rawValue],
            wasBlocked: false
        )
        let testCase = InteractiveVideoTestCase(
            title: "Video Similarity Demo",
            extractedText: extractedText,
            ocrText: "secure-payments.example.com",
            sourceSummary: "OCR + ASR merged",
            platform: platform,
            supportingHistoryEvent: historyEvent
        )

        if !historyService.historyEvents.contains(where: {
            $0.sourceHint == platform && $0.summary == historyEvent.summary
        }) {
            historyService.addHistory(historyEvent)
        }

        recentEvents = historyService.historyEvents
        autoDetectedSourceContext = "secure-payments.example.com"
        sourceContextStatus = "Auto-detected"
        latestVideoExtractedText = extractedText
        latestVideoOCRText = testCase.ocrText
        latestVideoSourceSummary = testCase.sourceSummary
        errorMessage = nil

        return testCase
    }

    // MARK: - Modality Toggle

    func toggleMonitoringChannel(_ type: MonitorChannelType) {
        switch type {
        case .email:
            toggleEmailMonitoring()
        case .message:
            toggleMessageMonitoring()
        case .voice, .video:
            guard let idx = monitorChannelStatuses.firstIndex(where: { $0.type == type }) else { return }
            monitorChannelStatuses[idx].isEnabled.toggle()
            monitorChannelStatuses[idx].state = monitorChannelStatuses[idx].isEnabled ? .active : .inactive
        }
    }

    func toggleModality(_ type: ModalityType) {
        switch type {
        case .text:
            toggleMonitoringChannel(.email)
        case .voice:
            toggleMonitoringChannel(.voice)
        case .video:
            toggleMonitoringChannel(.video)
        }
    }

    // MARK: - Alert Dismiss

    func dismissAlert() {
        activeAlert = nil
    }

    // MARK: - Unified Analysis Path

    func analyzeNormalizedText(
        text: String,
        modality: ModalityType,
        sourceHint: String? = nil,
        monitorChannelOverride: MonitorChannelType? = nil
    ) async -> RiskScore {
        updateModalityState(modality, state: .analyzing, monitorChannelOverride: monitorChannelOverride)
        let normalizedText = text.trimmingCharacters(in: .whitespacesAndNewlines)
        let suggestedContext = decisionEngine.suggestedContext(text: normalizedText, sourceHint: sourceHint)?
            .trimmingCharacters(in: .whitespacesAndNewlines)
        print("[DashboardViewModel] unified analysis input (\(modality.rawValue)): \(normalizedText)")
        if modality == .text {
            let trimmedSourceHint = sourceHint?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
            if let suggested = refreshSuggestedSourceContext(for: normalizedText, currentInput: trimmedSourceHint),
               trimmedSourceHint.isEmpty {
                print("[DashboardViewModel] auto-detected source context: \(suggested)")
            }
        } else if let suggestedContext, !suggestedContext.isEmpty {
            autoDetectedSourceContext = suggestedContext
        }

        do {
            let response = try await decisionEngine.evaluate(
                text: normalizedText,
                modality: modality,
                sourceHint: sourceHint,
                trustedContacts: PersistenceStore.shared.whitelist,
                blockedDomains: PersistenceStore.shared.blocklist,
                historyEvents: historyService.historyEvents
            )
            let score = makeRiskScore(from: response, modality: modality)
            updateTrustedContactSuggestion(
                score: score,
                effectiveContext: suggestedContext,
                sourceHint: sourceHint
            )
            //设置分数阀值
            updatePolicySuggestion(
                score: score,
                effectiveContext: suggestedContext,
                sourceHint: sourceHint
            )
            recordAnalysisResult(score, inputText: normalizedText, sourceHint: suggestedContext ?? sourceHint)
            updateModalityState(modality, state: .active, monitorChannelOverride: monitorChannelOverride)
            updateTierFromResponse(response)
            errorMessage = nil
            return score
        } catch {
            trustedContactSuggestion = nil
            policySuggestion = nil
            updateModalityState(modality, state: .error, monitorChannelOverride: monitorChannelOverride)
            tierStatuses = localAnalyzer.tierStatus()
            errorMessage = error.localizedDescription
            print("[DashboardViewModel] unified analysis failed (\(modality.rawValue)): \(error.localizedDescription)")
            return currentRiskScore
        }
    }

    func testPolicyHistoryChain(text: String, sourceHint: String?) {
        let normalizedText = text.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !normalizedText.isEmpty else {
            let message = "Policy / History test requires non-empty text input."
            print("[Debug Policy/History] \(message)")
            errorMessage = message
            debugChainResult = DebugChainResult(
                title: "Test Policy / History",
                state: .failure,
                summary: "policy/history failed",
                reasoning: message,
                indicators: [],
                details: []
            )
            return
        }

        let effectiveContext = suggestedContextForDebug(text: normalizedText, sourceHint: sourceHint)
        let policyMatch = policyService.evaluate(
            text: normalizedText,
            senderName: effectiveContext,
            trustedContacts: PersistenceStore.shared.whitelist,
            blockedDomains: PersistenceStore.shared.blocklist
        )
        let occurrenceResult = historyService.analyzeOccurrence(
            text: normalizedText,
            sourceHint: effectiveContext ?? sourceHint,
            modality: .text
        )

        var indicators = policyMatch.indicators
        indicators.append(contentsOf: policyMatch.reasons)
        indicators.append(contentsOf: occurrenceResult?.indicators ?? [])
        if indicators.isEmpty {
            indicators.append("no policy or history match")
        }

        var reasoningParts = ["Policy / History chain executed without SLM or external API."]
        if let effectiveContext, !effectiveContext.isEmpty {
            reasoningParts.append("Effective source context: \(effectiveContext).")
        }
        switch policyMatch {
        case .allow:
            reasoningParts.append(policyMatch.reasoningText ?? "Local policy returned allow.")
        case .block:
            reasoningParts.append(policyMatch.reasoningText ?? "Local policy returned block.")
        case .none:
            reasoningParts.append("Local policy returned noMatch.")
        }
        if let occurrenceReasoning = occurrenceResult?.rationale {
            reasoningParts.append(occurrenceReasoning)
        } else {
            reasoningParts.append("No relevant previous occurrence found.")
        }

        let summary: String
        switch policyMatch {
        case .allow:
            summary = "allow"
        case .block:
            summary = "block"
        case .none:
            summary = "noMatch"
        }

        print("[Debug Policy/History] summary=\(summary)")
        print("[Debug Policy/History] indicators=\(indicators)")
        print("[Debug Policy/History] reasoning=\(reasoningParts.joined(separator: " "))")

        errorMessage = nil
        debugChainResult = DebugChainResult(
                title: "Test Policy / History",
                state: .success,
                summary: summary,
                reasoning: reasoningParts.joined(separator: " "),
                indicators: uniqueIndicators(indicators),
                details: [
                    "context: \(effectiveContext ?? "none")",
                    "history matches: \(occurrenceResult?.matchedCount ?? 0)"
                ]
            )
    }

    func testLocalSLMChain(text: String) {
        let normalizedText = text.trimmingCharacters(in: .whitespacesAndNewlines)
        let sampleText = normalizedText.isEmpty
            ? "Dear user, your account has been compromised. Click here to verify: http://fake-bank.com/login"
            : normalizedText

        do {
            let runner = try PhishingDetectorRunner(bundle: .main)
            let encoded = runner.debugEncode(sampleText)
            let slmResult = try runner.detect(sampleText)
            let score = RiskLevel.normalizedScore(slmResult.phishingRisk * 10.0)
            let summary = "predicted label: \(slmResult.prediction)"
            let probabilities = slmResult.allProbabilities
                .sorted { $0.key < $1.key }
                .map { "\($0.key)=\(String(format: "%.6f", $0.value))" }

            print("[Debug Local SLM] tokenizer success: input_ids=\(encoded.inputIds.count), attention_mask=\(encoded.attentionMask.count)")
            print("[Debug Local SLM] probabilities=\(slmResult.allProbabilities)")
            print("[Debug Local SLM] predictedLabel=\(slmResult.prediction), riskScore=\(score)")

            errorMessage = nil
            debugChainResult = DebugChainResult(
                title: "Test Local SLM",
                state: .success,
                summary: summary,
                reasoning: "Local CoreML / SLM inference succeeded.",
                indicators: [
                    "risk score: \(String(format: "%.2f", score))",
                    "confidence: \(String(format: "%.2f", slmResult.confidence))"
                ],
                details: [
                    "tokenizer: loaded",
                    "input_ids count: \(encoded.inputIds.count)",
                    "attention_mask count: \(encoded.attentionMask.count)"
                ] + probabilities
            )
        } catch {
            let message = localSLMDebugErrorMessage(for: error)
            print("[Debug Local SLM] failure=\(message)")
            errorMessage = message
            debugChainResult = DebugChainResult(
                title: "Test Local SLM",
                state: .failure,
                summary: "local slm failed",
                reasoning: message,
                indicators: [],
                details: []
            )
        }
    }

    func testMergedDecisionChain(text: String, sourceHint: String?) {
        let normalizedText = text.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !normalizedText.isEmpty else {
            let message = "Merged decision test requires non-empty text input."
            print("[Debug Merged Decision] \(message)")
            errorMessage = message
            debugChainResult = DebugChainResult(
                title: "Test Merged Decision",
                state: .failure,
                summary: "merged decision failed",
                reasoning: message,
                indicators: [],
                details: []
            )
            return
        }

        let effectiveContext = suggestedContextForDebug(text: normalizedText, sourceHint: sourceHint)
        let policyMatch = policyService.evaluate(
            text: normalizedText,
            senderName: effectiveContext,
            trustedContacts: PersistenceStore.shared.whitelist,
            blockedDomains: PersistenceStore.shared.blocklist
        )
        let occurrenceResult = historyService.analyzeOccurrence(
            text: normalizedText,
            sourceHint: effectiveContext ?? sourceHint,
            modality: .text
        )

        let baseResponse: AnalyzeResponse
        do {
            baseResponse = try strictLocalSLMAnalyzeResponse(text: normalizedText, modality: .text)
        } catch {
            let message = "SLM layer failed: \(localSLMDebugErrorMessage(for: error))"
            print("[Debug Merged Decision] \(message)")
            errorMessage = message
            debugChainResult = DebugChainResult(
                title: "Test Merged Decision",
                state: .failure,
                summary: "merged decision failed",
                reasoning: message,
                indicators: [],
                details: ["policy/history layer: succeeded", "slm layer: failed"]
            )
            return
        }

        let mergedResponse = decisionEngine.mergeForDebug(
            base: baseResponse,
            policyMatch: policyMatch,
            effectiveContext: effectiveContext,
            originalSourceHint: sourceHint,
            occurrenceResult: occurrenceResult
        )
        let mergedScore = makeRiskScore(from: mergedResponse, modality: .text)

        print("[Debug Merged Decision] mergedScore=\(mergedScore.score), verdict=\(mergedScore.verdict ?? "unknown")")
        print("[Debug Merged Decision] indicators=\(mergedScore.indicators)")
        print("[Debug Merged Decision] reasoning=\(mergedScore.reasoning ?? "")")

        errorMessage = nil
        debugChainResult = DebugChainResult(
            title: "Test Merged Decision",
            state: .success,
            summary: "verdict: \(mergedScore.verdict ?? "unknown")",
            reasoning: mergedScore.reasoning ?? "Merged decision completed.",
            indicators: mergedScore.indicators,
            details: [
                "merged score: \(String(format: "%.2f", mergedScore.score))",
                "policy/history layer: succeeded",
                "slm layer: succeeded"
            ]
        )
    }

    // MARK: - Private helpers

    private func makeRiskScore(from response: AnalyzeResponse, modality: ModalityType) -> RiskScore {
        let normalizedScore = RiskLevel.normalizedScore(response.score)
        let level = RiskLevel.level(for: normalizedScore)
        let verdict = RiskLevel.verdict(for: normalizedScore)
        return RiskScore(
            score: normalizedScore,
            level: level,
            confidence: response.confidence,
            reasoning: response.reasoning,
            indicators: response.indicators,
            verdict: verdict,
            tierUsed: response.tierUsed,
            processingTimeMs: response.latencyMs,
            modality: modality
        )
    }

    private func recordAnalysisResult(_ score: RiskScore, inputText: String = "", sourceHint: String? = nil) {
        updateRiskScore(score)
        let event = DetectionEvent(
            modality: score.modality,
            riskScore: score.score,
            riskLevel: score.level,
            summary: score.reasoning ?? "Local analysis completed",
            indicators: score.indicators,
            verdict: score.verdict,
            processingTimeMs: score.processingTimeMs,
            sourceHint: sourceHint,
            tiersUsed: [score.tierUsed ?? DetectionTier.onDevice.rawValue],
            wasBlocked: score.level.isBlocked,
            inputText: inputText
        )
        historyService.addHistory(event)
        recentEvents = historyService.historyEvents
        if score.level.isFlagged {
            activeAlert = event
        } else {
            activeAlert = nil
        }
    }

    private func updateRiskScore(_ score: RiskScore) {
        withAnimation(.easeInOut(duration: 0.4)) {
            currentRiskScore = score
        }
    }

    private func updateModalityState(
        _ type: ModalityType,
        state: ModalityState,
        monitorChannelOverride: MonitorChannelType? = nil
    ) {
        switch type {
        case .text:
            let targetChannel = monitorChannelOverride ?? .email
            if let idx = monitorChannelStatuses.firstIndex(where: { $0.type == targetChannel }) {
                monitorChannelStatuses[idx].state = state
            }
        case .voice:
            if let idx = monitorChannelStatuses.firstIndex(where: { $0.type == .voice }) {
                monitorChannelStatuses[idx].state = state
            }
        case .video:
            if let idx = monitorChannelStatuses.firstIndex(where: { $0.type == .video }) {
                monitorChannelStatuses[idx].state = state
            }
        }
    }

    private func setEmailMonitoringState(isEnabled: Bool, state: ModalityState) {
        guard let idx = monitorChannelStatuses.firstIndex(where: { $0.type == .email }) else { return }
        monitorChannelStatuses[idx].isEnabled = isEnabled
        monitorChannelStatuses[idx].state = state
    }

    private func setMessageMonitoringState(isEnabled: Bool, state: ModalityState) {
        guard let idx = monitorChannelStatuses.firstIndex(where: { $0.type == .message }) else { return }
        monitorChannelStatuses[idx].isEnabled = isEnabled
        monitorChannelStatuses[idx].state = state
    }

    private func updateTierFromResponse(_ response: AnalyzeResponse) {
        tierStatuses = DetectionTier.allCases.map {
            TierStatus(tier: $0, state: .idle, latencyMs: nil)
        }

        guard let activeTier = DetectionTier(rawValue: response.tierUsed),
              let activeIndex = tierStatuses.firstIndex(where: { $0.tier == activeTier }) else {
            return
        }

        if response.wasEscalated {
            for index in tierStatuses.indices where tierStatuses[index].tier.rawValue < activeTier.rawValue {
                tierStatuses[index].state = .escalated
            }
        }

        tierStatuses[activeIndex].state = .active
        tierStatuses[activeIndex].latencyMs = response.latencyMs
    }

    private func updateTrustedContactSuggestion(
        score: RiskScore,
        effectiveContext: String?,
        sourceHint: String?
    ) {
        trustedContactSuggestion = nil
        _ = score
        _ = effectiveContext
        _ = sourceHint
    }

    private func updatePolicySuggestion(
        score: RiskScore,
        effectiveContext: String?,
        sourceHint: String?
    ) {
        policySuggestion = nil

        let candidate = stableSuggestedContext(
            effectiveContext: effectiveContext,
            sourceHint: sourceHint
        )

        guard let candidate, !candidate.isEmpty else { return }
        guard !isIgnoredSuggestionCandidate(candidate) else { return }

        switch score.level {
        case .high, .critical:
            guard !isAlreadyBlocked(candidate) else { return }
            policySuggestion = PolicySuggestion(
                action: .blocklist,
                value: candidate,
                reason: "This sender/source produced a phishing result. Add it to Blocklist?"
            )
        case .safe, .low:
            guard !isAlreadyTrusted(candidate) else { return }
            policySuggestion = PolicySuggestion(
                action: .whitelist,
                value: candidate,
                reason: "This sender/source produced a low-risk result. Add it to Whitelist?"
            )
        case .medium:
            policySuggestion = nil
        }
    }

    private func stableSuggestedContext(
        effectiveContext: String?,
        sourceHint: String?
    ) -> String? {
        guard let effectiveContext = effectiveContext?.trimmingCharacters(in: .whitespacesAndNewlines),
              !effectiveContext.isEmpty else {
            return nil
        }

        let trimmedSourceHint = sourceHint?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        if trimmedSourceHint.isEmpty {
            return effectiveContext
        }

        return normalizedSuggestionValue(trimmedSourceHint) == normalizedSuggestionValue(effectiveContext)
            ? effectiveContext
            : nil
    }

    private func isAlreadyTrusted(_ value: String) -> Bool {
        let normalizedCandidate = normalizedSuggestionValue(value)
        return PersistenceStore.shared.whitelist.contains {
            normalizedSuggestionValue($0.value) == normalizedCandidate
        }
    }

    private func isAlreadyBlocked(_ value: String) -> Bool {
        let normalizedCandidate = normalizedSuggestionValue(value)
        return PersistenceStore.shared.blocklist.contains {
            normalizedSuggestionValue($0.value) == normalizedCandidate
        }
    }

    private func isIgnoredSuggestionCandidate(_ value: String) -> Bool {
        let lowercased = value.lowercased()
        let ignoredDomains = ["gmail.com", "outlook.com", "icloud.com"]

        if lowercased.contains("@"),
           let domain = lowercased.split(separator: "@").last.map(String.init) {
            return ignoredDomains.contains(domain)
        }

        return ignoredDomains.contains(lowercased)
    }

    private func normalizedSuggestionValue(_ value: String) -> String {
        value
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .replacingOccurrences(of: " ", with: "")
            .replacingOccurrences(of: "-", with: "")
            .lowercased()
    }

    private func makeLoadedEmailDraft(from email: EmailMessage) -> LoadedEmailDraft {
        let trimmedBody = email.body.trimmingCharacters(in: .whitespacesAndNewlines)
        let suggestedSourceContext = decisionEngine.suggestedContext(
            text: trimmedBody,
            sourceHint: email.sender
        ) ?? extractDomain(from: email.sender) ?? email.sender

        return LoadedEmailDraft(
            sender: email.sender,
            subject: email.subject,
            body: trimmedBody,
            suggestedSourceContext: suggestedSourceContext
        )
    }

    private func makeEmailSignature(for email: EmailMessage) -> String {
        let bodyPrefix = String(email.body.trimmingCharacters(in: .whitespacesAndNewlines).prefix(80))
        return "\(email.sender.lowercased())|\(email.subject.lowercased())|\(bodyPrefix.lowercased())"
    }

    private func suggestedContextForDebug(text: String, sourceHint: String?) -> String? {
        decisionEngine.suggestedContext(text: text, sourceHint: sourceHint)?
            .trimmingCharacters(in: .whitespacesAndNewlines)
    }

    private func strictLocalSLMAnalyzeResponse(text: String, modality: ModalityType) throws -> AnalyzeResponse {
        let runner = try PhishingDetectorRunner(bundle: .main)
        let slmResult = try runner.detect(text)
        let score = min(10.0, max(0.0, slmResult.phishingRisk * 10.0))
        let verdict = RiskLevel.verdict(for: score)
        let indicators = slmResult.allProbabilities
            .filter { $0.value >= 0.2 }
            .sorted { $0.value > $1.value }
            .map { label, probability in
                "\(label): \(Int((probability * 100).rounded()))%"
            }

        return AnalyzeResponse(
            requestId: UUID().uuidString,
            modality: modality,
            inputText: text,
            score: score,
            level: RiskLevel(score: score, verdict: verdict),
            verdict: verdict,
            confidence: slmResult.confidence,
            reasoning: verdict == "phishing"
                ? "On-device SLM classified the text as phishing."
                : "On-device SLM completed local inference.",
            indicators: indicators,
            tierUsed: DetectionTier.onDevice.rawValue,
            tierName: DetectionTier.onDevice.apiName,
            latencyMs: nil,
            wasEscalated: false
        )
    }

    private func localSLMDebugErrorMessage(for error: Error) -> String {
        if let localError = error as? LocalAnalysisError {
            switch localError {
            case .missingResource(let name) where name.contains("tokenizer"):
                return "tokenizer load failed: \(localError.localizedDescription)"
            case .missingResource:
                return "model load failed: \(localError.localizedDescription)"
            case .invalidTokenizer:
                return "tokenizer load failed: \(localError.localizedDescription)"
            case .invalidModelOutput:
                return "input shape mismatch: \(localError.localizedDescription)"
            case .unavailable(let message):
                return "CoreML prediction failed: \(message)"
            }
        }

        let nsError = error as NSError
        if nsError.localizedDescription.localizedCaseInsensitiveContains("shape") {
            return "input shape mismatch: \(nsError.localizedDescription)"
        }
        return "CoreML prediction failed: \(nsError.localizedDescription)"
    }

    private func uniqueIndicators(_ values: [String]) -> [String] {
        values.reduce(into: [String]()) { partialResult, value in
            guard !partialResult.contains(value) else { return }
            partialResult.append(value)
        }
    }
}
