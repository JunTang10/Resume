import Foundation

final class HistoryMatcher {
    private let extractor: SignalExtractor

    init(extractor: SignalExtractor = SignalExtractor()) {
        self.extractor = extractor
    }

    func searchSimilarEvents(
        for input: HistorySearchInput,
        in historyEvents: [DetectionEvent]
    ) -> HistoryMatchResult {
        guard !historyEvents.isEmpty else {
            return HistoryMatchResult(
                matched: false,
                matchedEvents: [],
                matchedSource: nil,
                matchedSignals: [],
                explanation: "No relevant previous occurrence found."
            )
        }

        let currentSourceKey = normalizedSourceKey(from: input.source)
        let currentSignals = comparableSignals(text: input.inputText, sourceHint: input.source)

        if let currentSourceKey {
            let sourceMatches = historyEvents.filter { normalizedSourceKey(from: $0.sourceHint) == currentSourceKey }
            if !sourceMatches.isEmpty {
                return HistoryMatchResult(
                    matched: true,
                    matchedEvents: sourceMatches,
                    matchedSource: currentSourceKey,
                    matchedSignals: overlappingSignals(between: currentSignals, and: sourceMatches),
                    explanation: "Previous events from the same sender/source were found."
                )
            }
        }

        let contentMatches = historyEvents.filter { event in
            let eventText = event.inputText.isEmpty ? event.summary : event.inputText
            let eventSignals = comparableSignals(text: eventText, sourceHint: event.sourceHint)
            if !Set(currentSignals).intersection(eventSignals).isEmpty {
                return true
            }

            let currentTokens = tokenizedKeywords(from: input.inputText)
            let eventTokens = tokenizedKeywords(from: eventText)
            return Set(currentTokens).intersection(eventTokens).count >= 2
        }

        guard !contentMatches.isEmpty else {
            return HistoryMatchResult(
                matched: false,
                matchedEvents: [],
                matchedSource: nil,
                matchedSignals: [],
                explanation: "No relevant previous occurrence found."
            )
        }

        return HistoryMatchResult(
            matched: true,
            matchedEvents: contentMatches,
            matchedSource: nil,
            matchedSignals: overlappingSignals(between: currentSignals, and: contentMatches),
            explanation: "Similar text or signals were found in previous history."
        )
    }

    private func comparableSignals(text: String, sourceHint: String?) -> [String] {
        let signals = extractor.extract(text: text, senderName: sourceHint)
        let normalizedSource = normalizedSourceKey(from: sourceHint)

        return Array(
            Set(
                signals.emails
                + signals.emailDomains
                + signals.urlHosts
                + signals.urls
                + signals.phones
                + signals.names
                + [normalizedSource].compactMap { $0 }
            )
        ).filter { !$0.isEmpty }
    }

    private func overlappingSignals(between currentSignals: [String], and events: [DetectionEvent]) -> [String] {
        let currentSet = Set(currentSignals)
        let matchedSignals = events.reduce(into: Set<String>()) { partialResult, event in
            let eventText = event.inputText.isEmpty ? event.summary : event.inputText
            let eventSignals = comparableSignals(text: eventText, sourceHint: event.sourceHint)
            for value in currentSet where eventSignals.contains(value) {
                partialResult.insert(value)
            }
        }

        return matchedSignals.sorted()
    }

    private func normalizedSourceKey(from value: String?) -> String? {
        guard let value = value?.trimmingCharacters(in: .whitespacesAndNewlines),
              !value.isEmpty else {
            return nil
        }

        let signals = extractor.extract(text: "", senderName: value)
        if let email = signals.emails.first { return email }
        if let phone = signals.phones.first { return phone }
        if let domain = signals.emailDomains.first { return domain }
        if let host = signals.urlHosts.first { return host }
        if let name = signals.names.first { return name }
        return value.lowercased()
    }

    private func tokenizedKeywords(from value: String) -> [String] {
        value
            .lowercased()
            .components(separatedBy: CharacterSet.alphanumerics.inverted)
            .filter { $0.count > 2 }
    }
}
