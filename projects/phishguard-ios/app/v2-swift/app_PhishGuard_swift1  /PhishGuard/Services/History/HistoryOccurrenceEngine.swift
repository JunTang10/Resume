import Foundation

struct OccurrenceHistoryResult {
    let matched: Bool
    let matchedEvents: [DetectionEvent]
    let riskAdjustment: Double
    let explanation: String
    let matchedSource: String?
    let previousSafeCount: Int
    let previousSuspiciousCount: Int
    let matchedSignals: [String]

    var matchedCount: Int { matchedEvents.count }
    var rationale: String { explanation }
    var scoreAdjustment: Double { riskAdjustment }

    var indicators: [String] {
        guard matched || !matchedSignals.isEmpty else { return [] }

        var values = ["local similar occurrence found"]
        if let matchedSource, !matchedSource.isEmpty {
            values.append("matched source: \(matchedSource)")
        }
        if matchedCount > 0 {
            values.append("matched previous events: \(matchedCount)")
        }
        if previousSafeCount > 0 {
            values.append("trusted history/source similarity")
        }
        if previousSuspiciousCount > 0 {
            values.append("previous suspicious/phishing similarity")
        }
        values.append(contentsOf: matchedSignals.prefix(3).map { "matched value: \($0)" })
        return values
    }
}

final class HistoryOccurrenceEngine {
    private let matcher: HistoryMatcher

    init(matcher: HistoryMatcher = HistoryMatcher()) {
        self.matcher = matcher
    }

    func analyze(
        text: String,
        sourceHint: String?,
        modality: ModalityType,
        historyEvents: [DetectionEvent]
    ) -> OccurrenceHistoryResult? {
        guard !historyEvents.isEmpty else { return nil }

        let matchResult = matcher.searchSimilarEvents(
            for: HistorySearchInput(source: sourceHint, modality: modality, inputText: text),
            in: historyEvents
        )

        guard matchResult.matched else {
            return OccurrenceHistoryResult(
                matched: false,
                matchedEvents: [],
                riskAdjustment: 0.0,
                explanation: "No relevant previous occurrence found.",
                matchedSource: nil,
                previousSafeCount: 0,
                previousSuspiciousCount: 0,
                matchedSignals: []
            )
        }

        guard matchResult.matchedSource != nil else {
            return OccurrenceHistoryResult(
                matched: false,
                matchedEvents: matchResult.matchedEvents,
                riskAdjustment: 0.0,
                explanation: "Similar text was found in history, but no matching sender/source was found, so no history score adjustment was applied.",
                matchedSource: nil,
                previousSafeCount: 0,
                previousSuspiciousCount: 0,
                matchedSignals: matchResult.matchedSignals
            )
        }

        let previousSafeCount = matchResult.matchedEvents.filter(isTrustedEvent(_:)).count
        let previousSuspiciousCount = matchResult.matchedEvents.filter(isSuspiciousEvent(_:)).count

        let riskAdjustment: Double
        let explanation: String

        if previousSuspiciousCount > 0 {
            riskAdjustment = min(4.0, 2.0 + Double(max(0, previousSuspiciousCount - 1)))
            explanation = "Previous suspicious event for this sender found; risk increased."
        } else if previousSafeCount > 0 {
            let safeAdjustment = previousSafeCount == 1
                ? 1.0
                : min(2.0, 1.0 + Double(previousSafeCount - 1) * 0.5)
            riskAdjustment = -safeAdjustment
            explanation = "Previous safe event for \(matchResult.matchedSource ?? "this sender") found; risk slightly reduced."
        } else {
            riskAdjustment = 0.0
            explanation = "Previous occurrence for this sender/source was found, but it did not change the score."
        }

        return OccurrenceHistoryResult(
            matched: true,
            matchedEvents: matchResult.matchedEvents,
            riskAdjustment: riskAdjustment,
            explanation: explanation,
            matchedSource: matchResult.matchedSource,
            previousSafeCount: previousSafeCount,
            previousSuspiciousCount: previousSuspiciousCount,
            matchedSignals: matchResult.matchedSignals
        )
    }

    private func isTrustedEvent(_ event: DetectionEvent) -> Bool {
        !event.wasBlocked
        && (event.riskLevel == .safe || event.riskLevel == .low || event.verdict == "safe")
    }

    private func isSuspiciousEvent(_ event: DetectionEvent) -> Bool {
        event.wasBlocked
        || event.riskLevel == .high
        || event.riskLevel == .critical
        || event.verdict == "phishing"
        || event.verdict == "suspicious"
    }
}
