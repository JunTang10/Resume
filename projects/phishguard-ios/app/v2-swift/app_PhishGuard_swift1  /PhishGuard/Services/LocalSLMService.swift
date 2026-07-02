import Foundation

enum LocalAnalysisError: LocalizedError {
    case missingResource(String)
    case invalidTokenizer
    case invalidModelOutput
    case unavailable(String)

    var errorDescription: String? {
        switch self {
        case .missingResource(let name):
            return "\(name) was not found in the app bundle."
        case .invalidTokenizer:
            return "tokenizer.json format is invalid."
        case .invalidModelOutput:
            return "PhishingDetector output is missing probabilities."
        case .unavailable(let message):
            return message
        }
    }
}

final class LocalSLMService {
    static let shared = LocalSLMService()

    private let onDeviceAnalyzer: OnDevicePhishingAnalyzer?

    init(onDeviceAnalyzer: OnDevicePhishingAnalyzer? = nil) {
        if let onDeviceAnalyzer {
            self.onDeviceAnalyzer = onDeviceAnalyzer
            print("[LocalSLMService] on-device analyzer injected successfully")
            return
        }

        do {
            let analyzer = try OnDevicePhishingAnalyzer()
            self.onDeviceAnalyzer = analyzer
            print("[LocalSLMService] on-device analyzer initialized successfully")
        } catch {
            self.onDeviceAnalyzer = nil
            print("[LocalSLMService] on-device analyzer unavailable during init: \(error.localizedDescription)")
        }
    }

    func analyze(text: String, modality: ModalityType) async throws -> AnalyzeResponse {
        let start = Date()
        let preprocessed = InputPreprocessor.preprocess(text, sources: sources(for: modality))
        let cleanedText = preprocessed.cleanText

        guard !preprocessed.isEmpty else {
            return emptyInputResponse(modality: modality, startedAt: start)
        }

        guard let onDeviceAnalyzer else {
            let message = "On-device phishing model is unavailable for \(modality.displayName.lowercased()) analysis."
            print("[LocalSLMService] \(message)")
            print("[LocalSLMService] >>> USING SHARED FALLBACK for modality: \(modality)")
            return sharedFallbackResponse(
                text: cleanedText,
                modality: modality,
                startedAt: start,
                trigger: message
            )
        }

        do {
            print("[LocalSLMService] >>> USING ON-DEVICE SLM for modality: \(modality)")
            let response = try onDeviceAnalyzer.analyze(
                text: cleanedText,
                modality: modality,
                startedAt: start
            )
            return response.withInputText(cleanedText)
        } catch {
            let message = "On-device phishing analysis failed for \(modality.displayName.lowercased()) input: \(error.localizedDescription)"
            print("[LocalSLMService] analysis failed (\(modality.rawValue)): \(message)")
            print("[LocalSLMService] >>> USING SHARED FALLBACK for modality: \(modality)")
            return sharedFallbackResponse(
                text: cleanedText,
                modality: modality,
                startedAt: start,
                trigger: message
            )
        }
    }

    func tierStatus() -> [TierStatus] {
        [
            TierStatus(tier: .onDevice, state: .active, latencyMs: nil),
            TierStatus(tier: .localServer, state: .idle, latencyMs: nil),
            TierStatus(tier: .cloud, state: .idle, latencyMs: nil)
        ]
    }

    private func sources(for modality: ModalityType) -> [InputSourceType] {
        switch modality {
        case .text:
            return [.typedText, .importedFile]
        case .voice:
            return [.asr]
        case .video:
            return [.ocr, .asr, .videoMetadata]
        }
    }

    private func emptyInputResponse(modality: ModalityType, startedAt: Date) -> AnalyzeResponse {
        AnalyzeResponse(
            requestId: UUID().uuidString,
            modality: modality,
            inputText: "",
            score: 0.0,
            level: .safe,
            verdict: "safe",
            confidence: 1.0,
            reasoning: "No analyzable text was provided after local preprocessing.",
            indicators: ["empty input"],
            tierUsed: DetectionTier.onDevice.rawValue,
            tierName: DetectionTier.onDevice.apiName,
            latencyMs: max(1, Int(Date().timeIntervalSince(startedAt) * 1000)),
            wasEscalated: false
        )
    }

    private func sharedFallbackResponse(
        text: String,
        modality: ModalityType,
        startedAt: Date,
        trigger: String
    ) -> AnalyzeResponse {
        let lowercased = text.lowercased()
        var indicators: [String] = ["shared fallback active"]
        var score = 0.8

        let weightedSignals: [(label: String, terms: [String], score: Double)] = [
            ("credential request", ["password", "passcode", "pin", "otp", "verification code"], 2.2),
            ("urgency language", ["urgent", "immediately", "asap", "expire", "suspended", "limited time"], 1.8),
            ("financial pressure", ["bank", "payment", "invoice", "refund", "wallet", "crypto", "wire"], 2.0),
            ("action bait", ["click", "tap", "open link", "verify", "confirm", "sign in", "login"], 1.7),
            ("identity spoofing", ["support", "help desk", "security team", "delivery", "administrator"], 1.4)
        ]

        for signal in weightedSignals {
            if signal.terms.contains(where: { lowercased.contains($0) }) {
                score += signal.score
                indicators.append(signal.label)
            }
        }

        if lowercased.contains("http://") || lowercased.contains("https://") || lowercased.contains("www.") {
            score += 1.4
            indicators.append("contains link")
        }

        if lowercased.contains("gift card") || lowercased.contains("bitcoin") || lowercased.contains("usdt") {
            score += 2.3
            indicators.append("payment diversion terms")
        }

        if lowercased.contains("account") && lowercased.contains("verify") {
            score += 1.6
            indicators.append("account verification request")
        }

        let uniqueIndicators = indicators.reduce(into: [String]()) { partialResult, indicator in
            guard !partialResult.contains(indicator) else { return }
            partialResult.append(indicator)
        }
        let normalizedScore = RiskLevel.normalizedScore(score)
        let verdict = RiskLevel.verdict(for: normalizedScore)
        let confidence = min(0.82, 0.32 + Double(uniqueIndicators.count) * 0.08)
        let latencyMs = max(1, Int(Date().timeIntervalSince(startedAt) * 1000))

        return AnalyzeResponse(
            requestId: UUID().uuidString,
            modality: modality,
            inputText: text,
            score: normalizedScore,
            level: RiskLevel(score: normalizedScore, verdict: verdict),
            verdict: verdict,
            confidence: confidence,
            reasoning: "Shared fallback heuristic analyzed the text because the on-device SLM was unavailable or failed. Trigger: \(trigger)",
            indicators: uniqueIndicators,
            tierUsed: DetectionTier.onDevice.rawValue,
            tierName: DetectionTier.onDevice.apiName,
            latencyMs: latencyMs,
            wasEscalated: false
        )
    }
}

private extension AnalyzeResponse {
    func withInputText(_ text: String) -> AnalyzeResponse {
        AnalyzeResponse(
            requestId: requestId,
            modality: modality,
            inputText: text,
            score: score,
            level: level,
            verdict: verdict,
            confidence: confidence,
            reasoning: reasoning,
            indicators: indicators,
            tierUsed: tierUsed,
            tierName: tierName,
            latencyMs: latencyMs,
            wasEscalated: wasEscalated
        )
    }
}
