import Foundation

final class PolicyMatcher {
    private let extractor = SignalExtractor()

    func evaluate(text: String, senderName: String? = nil, entries: [PolicyEntry]) -> MatchResult {
        let signals = extractor.extract(text: text, senderName: senderName)

        var blockReasons: [String] = []
        var allowReasons: [String] = []

        for entry in entries where entry.enabled {
            let matched = match(entry: entry, signals: signals)

            if matched {
                let reason = "\(entry.kind.rawValue): \(entry.value)"

                if entry.mode == .block {
                    blockReasons.append(reason)
                } else {
                    allowReasons.append(reason)
                }
            }
        }

        if !blockReasons.isEmpty {
            return .block(blockReasons)
        }

        if !allowReasons.isEmpty {
            return .allow(allowReasons)
        }

        return .none
    }

    private func match(entry: PolicyEntry, signals: ExtractedSignals) -> Bool {
        switch entry.kind {
        case .url:
            return matchURL(entry, signals)
        case .email:
            return matchSimple(entry: entry, values: signals.emails + signals.emailDomains)
        case .phone:
            return matchSimple(entry: entry, values: signals.phones)
        case .name:
            return matchSimple(entry: entry, values: signals.names)
        }
    }

    private func matchURL(_ entry: PolicyEntry, _ signals: ExtractedSignals) -> Bool {
        switch entry.matchType {
        case .exact:
            return signals.urls.contains(entry.normalizedValue)
        case .domainSuffix:
            let candidateDomains = signals.urlHosts + signals.emailDomains
            return candidateDomains.contains(where: {
                $0 == entry.normalizedValue || $0.hasSuffix("." + entry.normalizedValue)
            })
        case .contains:
            return signals.urls.contains(where: { $0.contains(entry.normalizedValue) })
        }
    }

    private func matchSimple(entry: PolicyEntry, values: [String]) -> Bool {
        switch entry.matchType {
        case .exact:
            return values.contains(entry.normalizedValue)
        case .contains:
            return values.contains(where: { $0.contains(entry.normalizedValue) })
        case .domainSuffix:
            return false
        }
    }
}
