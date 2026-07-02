import Foundation

// MARK: - 钓鱼检测决策引擎
/// 综合本地策略、SLM 模型分析和历史事件相似度，输出最终风险评估结果
final class PhishingDecisionEngine {
    /// 本地策略服务（白名单/黑名单）
    private let policyService: PolicyService
    /// 本地 SLM（小语言模型）分析服务
    private let localAnalyzer: LocalSLMService
    /// 历史事件相似度搜索服务
    private let occurrenceHistoryEngine: HistoryOccurrenceEngine

    init(
        policyService: PolicyService = .shared,
        localAnalyzer: LocalSLMService = .shared,
        occurrenceHistoryEngine: HistoryOccurrenceEngine = HistoryOccurrenceEngine()
    ) {
        self.policyService = policyService
        self.localAnalyzer = localAnalyzer
        self.occurrenceHistoryEngine = occurrenceHistoryEngine
    }

    /// 对输入文本进行完整的钓鱼风险评估
    /// - Parameters:
    ///   - text: 待检测文本
    ///   - modality: 检测模态（短信、邮件等）
    ///   - sourceHint: 发件人/来源提示（可选）
    ///   - trustedContacts: 可信联系人白名单
    ///   - blockedDomains: 已屏蔽域名列表
    ///   - historyEvents: 本地历史检测事件
    /// - Returns: 完整的风险分析响应
    func evaluate(
        text: String,
        modality: ModalityType,
        sourceHint: String? = nil,
        trustedContacts: [WhitelistEntry],
        blockedDomains: [WhitelistEntry] = [],
        historyEvents: [DetectionEvent] = []
    ) async throws -> AnalyzeResponse {
        let normalizedText = text.trimmingCharacters(in: .whitespacesAndNewlines)
        // 尝试从文本内容中自动推断发送方上下文
        let effectiveContext = policyService.suggestedContext(text: normalizedText, senderName: sourceHint)
        // 执行本地策略匹配（白名单/黑名单）
        let policyMatch = policyService.evaluate(
            text: normalizedText,
            senderName: effectiveContext,
            trustedContacts: trustedContacts,
            blockedDomains: blockedDomains
        )

        // 若命中黑名单，直接走策略拦截路径，不调用 SLM
        if case .block = policyMatch {
            return overrideResponseForBlockPolicy(
                text: normalizedText,
                modality: modality,
                effectiveContext: effectiveContext,
                originalSourceHint: sourceHint,
                policyMatch: policyMatch
            )
        }

        if case .allow = policyMatch {
            return overrideResponseForAllowPolicy(
                text: normalizedText,
                modality: modality,
                effectiveContext: effectiveContext,
                originalSourceHint: sourceHint,
                policyMatch: policyMatch
            )
        }

        // 搜索本地历史相似事件
        let occurrenceResult = occurrenceHistoryEngine.analyze(
            text: normalizedText,
            sourceHint: effectiveContext ?? sourceHint,
            modality: modality,
            historyEvents: historyEvents
        )

        // 调用本地 SLM 进行内容分析
        var response = try await localAnalyzer.analyze(text: normalizedText, modality: modality)
        // 将策略结果和历史相似度结果合并到 SLM 响应中
        response = mergedResponse(
            response,
            policyMatch: policyMatch,
            effectiveContext: effectiveContext,
            originalSourceHint: sourceHint,
            occurrenceResult: occurrenceResult
        )
        return response
    }

    /// 对外暴露的上下文推断接口，供调试或预处理使用
    func suggestedContext(text: String, sourceHint: String? = nil) -> String? {
        policyService.suggestedContext(text: text, senderName: sourceHint)
    }

    /// 仅供调试使用：将策略结果和历史相似度手动合并到指定基础响应中
    func mergeForDebug(
        base: AnalyzeResponse,
        policyMatch: MatchResult,
        effectiveContext: String?,
        originalSourceHint: String?,
        occurrenceResult: OccurrenceHistoryResult?
    ) -> AnalyzeResponse {
        mergedResponse(
            base,
            policyMatch: policyMatch,
            effectiveContext: effectiveContext,
            originalSourceHint: originalSourceHint,
            occurrenceResult: occurrenceResult
        )
    }

    /// 将策略匹配结果和历史相似度结果合并到 SLM 基础响应中，输出最终评估结果
    private func mergedResponse(
        _ base: AnalyzeResponse,
        policyMatch: MatchResult,
        effectiveContext: String?,
        originalSourceHint: String?,
        occurrenceResult: OccurrenceHistoryResult?
    ) -> AnalyzeResponse {
        var mergedScore = base.score
        var mergedConfidence = base.confidence
        var mergedIndicators = base.indicators
        var reasoningParts = [String]()
        // 是否命中黑名单
        let blocklistOverride = policyMatch.isBlockMatch
        // 是否需要升级为 critical：黑名单命中 + 存在强钓鱼信号指标
        let criticalBlockOverride = blocklistOverride && base.indicators.containsAny(of: [
            "suspicious url/domain signal",
            "sensitive information request signal"
        ])

        reasoningParts.append("Decision Path: Automated Policy + Content Analysis.")

        // 若自动推断的发送方上下文与原始来源提示不同，记录该信息
        if let effectiveContext,
           !effectiveContext.isEmpty,
           effectiveContext != originalSourceHint {
            mergedIndicators.append("auto-detected sender context used")
            reasoningParts.append("Auto-detected source context: \(effectiveContext).")
        }

        // 根据策略匹配结果调整评分
        switch policyMatch {
        case .block(let reasons):
            // 黑名单命中：评分至少 7.5，并追加 +4.0
            mergedScore = max(7.5, mergedScore + 4.0)
            mergedConfidence = max(mergedConfidence, 0.8)
            mergedIndicators.append(contentsOf: policyMatch.indicators)
            mergedIndicators.append(contentsOf: reasons)
            if let reasoning = policyMatch.reasoningText {
                reasoningParts.append(reasoning)
            }
            reasoningParts.append("Blocklist or blocking policy added +4.0 risk.")
            reasoningParts.append("Blocklist override enforced a minimum score of 7.5.")

        case .allow(let reasons):
            // 白名单命中：评分 -3.0
            mergedScore = max(0.0, mergedScore - 3.0)
            mergedConfidence = max(mergedConfidence, 0.72)
            mergedIndicators.append(contentsOf: policyMatch.indicators)
            mergedIndicators.append(contentsOf: reasons)
            if let reasoning = policyMatch.reasoningText {
                reasoningParts.append(reasoning)
            }
            reasoningParts.append("Trusted contact signal reduced the score by 3.0.")

        case .none:
            reasoningParts.append("No local policy rule matched.")
        }

        // 根据历史相似度结果进一步微调评分
        if let occurrenceResult {
            mergedScore = min(10.0, max(0.0, mergedScore + occurrenceResult.scoreAdjustment))
            mergedIndicators.append(contentsOf: occurrenceResult.indicators)
            reasoningParts.append(occurrenceResult.rationale)
            mergedConfidence = max(mergedConfidence, 0.68)
        } else {
            reasoningParts.append("No relevant previous occurrence found.")
        }

        // 附加 SLM 原始推理文本
        if let baseReasoning = base.reasoning, !baseReasoning.isEmpty {
            reasoningParts.append(baseReasoning)
        }

        if blocklistOverride {
            mergedIndicators.append("blocklist override applied")
        }
        if criticalBlockOverride {
            mergedIndicators.append("critical block override")
        }

        // 对指标列表去重，保持原有顺序
        let uniqueIndicators = mergedIndicators.reduce(into: [String]()) { partialResult, indicator in
            guard !partialResult.contains(indicator) else { return }
            partialResult.append(indicator)
        }
        let normalizedScore = RiskLevel.normalizedScore(mergedScore)
        // critical override 时强制判定为 phishing，否则按评分推断 verdict
        let verdict = criticalBlockOverride ? "phishing" : RiskLevel.verdict(for: normalizedScore)
        // 确定最终风险等级
        let level: RiskLevel = {
            if criticalBlockOverride {
                return .critical
            }
            if blocklistOverride {
                // 黑名单命中时，风险等级至少为 high
                let baseLevel = RiskLevel(score: normalizedScore, verdict: verdict)
                if baseLevel == .safe || baseLevel == .low || baseLevel == .medium {
                    return .high
                }
                return baseLevel
            }
            return RiskLevel(score: normalizedScore, verdict: verdict)
        }()

        if criticalBlockOverride {
            reasoningParts.append("Blocklist override escalated the result to critical because strong phishing signals were also present.")
        }

        return AnalyzeResponse(
            requestId: base.requestId,
            modality: base.modality,
            inputText: base.inputText,
            score: normalizedScore,
            level: level,
            verdict: verdict,
            confidence: mergedConfidence,
            reasoning: reasoningParts.joined(separator: " "),
            indicators: uniqueIndicators,
            tierUsed: base.tierUsed,
            tierName: base.tierName,
            latencyMs: base.latencyMs,
            wasEscalated: base.wasEscalated
        )
    }

    /// 黑名单命中时的快速响应路径，不依赖 SLM，直接构造高风险/极高风险响应
    private func overrideResponseForBlockPolicy(
        text: String,
        modality: ModalityType,
        effectiveContext: String?,
        originalSourceHint: String?,
        policyMatch: MatchResult
    ) -> AnalyzeResponse {
        let baseSignals = SignalExtractor().extract(text: text, senderName: effectiveContext ?? originalSourceHint)
        // 判断是否存在强钓鱼信号，决定是 critical 还是 high
        let hasStrongSignal = hasStrongBlockSignal(text: text, signals: baseSignals)
        let level: RiskLevel = hasStrongSignal ? .critical : .high
        let score: Double = 10.0

        var reasoningParts = [
            "Decision Path: Automated Policy + Content Analysis.",
            "⚠️ This sender is flagged as risky (Blocklist match).",
            policyMatch.reasoningText ?? "Local policy matched a blocking rule."
        ]

        if let effectiveContext, !effectiveContext.isEmpty, effectiveContext != originalSourceHint {
            reasoningParts.append("Auto-detected source context: \(effectiveContext).")
        }

        if hasStrongSignal {
            reasoningParts.append("Blocklist override escalated the result to critical / Block Now because strong phishing signals were also present.")
        } else {
            reasoningParts.append("Blocklist override forced the result to the maximum risk score without relying on SLM.")
        }

        var indicators = policyMatch.indicators + policyMatch.reasons + [
            "blocklist override applied",
            "policy decision: block",
            "ui status: blocklist warning"
        ]
        if hasStrongSignal {
            indicators.append("critical block override")
        }
        if let effectiveContext, !effectiveContext.isEmpty, effectiveContext != originalSourceHint {
            indicators.append("auto-detected sender context used")
        }

        return AnalyzeResponse(
            requestId: UUID().uuidString,
            modality: modality,
            inputText: text,
            score: score,
            level: level,
            verdict: "phishing",
            confidence: hasStrongSignal ? 0.98 : 0.94,
            reasoning: uniqueStrings(reasoningParts).joined(separator: " "),
            indicators: uniqueStrings(indicators),
            tierUsed: DetectionTier.onDevice.rawValue,
            tierName: DetectionTier.onDevice.apiName,
            latencyMs: 1,
            wasEscalated: false
        )
    }

    private func overrideResponseForAllowPolicy(
        text: String,
        modality: ModalityType,
        effectiveContext: String?,
        originalSourceHint: String?,
        policyMatch: MatchResult
    ) -> AnalyzeResponse {
        var reasoningParts = [
            "Decision Path: Automated Policy + Trusted Allowlist.",
            "✔ Trusted sender.",
            policyMatch.reasoningText ?? "Local policy matched a trusted sender rule.",
            "Whitelist override allowed the input before SLM, history, heuristic, or external analysis."
        ]

        var indicators = policyMatch.indicators + policyMatch.reasons + [
            "whitelist override applied",
            "policy decision: allow",
            "ui status: trusted sender"
        ]

        if let effectiveContext, !effectiveContext.isEmpty, effectiveContext != originalSourceHint {
            reasoningParts.append("Auto-detected source context: \(effectiveContext).")
            indicators.append("auto-detected sender context used")
        }

        return AnalyzeResponse(
            requestId: UUID().uuidString,
            modality: modality,
            inputText: text,
            score: 0.0,
            level: .safe,
            verdict: "safe",
            confidence: 0.96,
            reasoning: uniqueStrings(reasoningParts).joined(separator: " "),
            indicators: uniqueStrings(indicators),
            tierUsed: DetectionTier.onDevice.rawValue,
            tierName: DetectionTier.onDevice.apiName,
            latencyMs: 1,
            wasEscalated: false
        )
    }

    /// 判断文本中是否存在强钓鱼信号：敏感信息请求 或 可疑 URL + 危险关键词
    private func hasStrongBlockSignal(text: String, signals: ExtractedSignals) -> Bool {
        let lowercased = text.lowercased()
        // 敏感信息关键词（密码、银行卡、验证码等）
        let sensitiveTerms = [
            "password", "passcode", "verification code", "otp", "one-time code",
            "bank account", "account number", "card number", "credit card", "debit card",
            "cvv", "date of birth", "dob", "social security"
        ]
        // 请求动词（要求用户提供/输入/回复信息）
        let requestVerbs = ["send", "provide", "confirm", "share", "enter", "reply with", "submit", "verify"]
        // 同时包含敏感词和请求动词，判定为敏感信息请求
        let hasSensitiveRequest = sensitiveTerms.contains { lowercased.contains($0) }
            && requestVerbs.contains { lowercased.contains($0) }
        // 存在 URL 且文本含有高风险路径关键词
        let hasSuspiciousURL = !signals.urlHosts.isEmpty && [
            "login", "signin", "verify", "secure", "reset", "bank", "payment", "confirm"
        ].contains { lowercased.contains($0) }
        return hasSuspiciousURL || hasSensitiveRequest
    }
}

// MARK: - MatchResult 扩展
private extension MatchResult {
    /// 判断当前策略匹配结果是否为黑名单拦截
    var isBlockMatch: Bool {
        if case .block = self {
            return true
        }
        return false
    }
}

// MARK: - Array<String> 扩展
private extension Array where Element == String {
    /// 判断数组是否包含给定列表中的任意一个元素
    func containsAny(of values: [String]) -> Bool {
        values.contains { contains($0) }
    }
}

/// 对字符串数组去重，保持首次出现的顺序
private func uniqueStrings(_ values: [String]) -> [String] {
    values.reduce(into: [String]()) { partialResult, value in
        guard !partialResult.contains(value) else { return }
        partialResult.append(value)
    }
}
