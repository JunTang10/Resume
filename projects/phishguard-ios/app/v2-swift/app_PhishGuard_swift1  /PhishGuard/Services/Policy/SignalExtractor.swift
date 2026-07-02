import Foundation

struct ExtractedSignals {
    var urls: [String] = []
    var urlHosts: [String] = []
    var emails: [String] = []
    var emailDomains: [String] = []
    var phones: [String] = []
    var names: [String] = []
}

final class SignalExtractor {
    func normalizedPolicyValues(for rawValue: String) -> [String] {
        let trimmed = rawValue.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return [] }

        let signals = extract(text: "", senderName: trimmed)
        var values = signals.emails
            + signals.emailDomains
            + signals.phones
            + signals.urlHosts
            + signals.names

        if values.isEmpty,
           let normalizedDomain = try? PolicyNormalizer.shared.normalize(
               kind: .url,
               value: trimmed,
               matchType: .domainSuffix
           ) {
            values.append(normalizedDomain)
        }

        if values.isEmpty,
           let normalizedName = try? PolicyNormalizer.shared.normalize(
               kind: .name,
               value: trimmed,
               matchType: .exact
           ) {
            values.append(normalizedName)
        }

        return uniquePreservingOrder(values)
    }

    func extract(text: String, senderName: String? = nil) -> ExtractedSignals {
        var result = ExtractedSignals()

        extractURLs(from: text, into: &result)
        extractPhones(from: text, into: &result)
        extractEmails(from: text, into: &result)

        if let senderName {
            extractURLs(from: senderName, into: &result)
            extractPhones(from: senderName, into: &result)
            extractEmails(from: senderName, into: &result)

            let displayName = senderDisplayName(from: senderName)

            if let normalizedName = try? PolicyNormalizer.shared.normalize(
                kind: .name,
                value: displayName,
                matchType: .exact
            ) {
                result.names.append(normalizedName)
            }
        }

        result.urls = Array(Set(result.urls))
        result.urlHosts = Array(Set(result.urlHosts))
        result.emails = Array(Set(result.emails))
        result.emailDomains = Array(Set(result.emailDomains))
        result.phones = Array(Set(result.phones))
        result.names = Array(Set(result.names))

        return result
    }

    func preferredContext(text: String, senderName: String? = nil) -> String? {
        let trimmedSender = senderName?.trimmingCharacters(in: .whitespacesAndNewlines)
        if let trimmedSender, !trimmedSender.isEmpty {
            return trimmedSender
        }

        let signals = extract(text: text, senderName: senderName)
        if let email = signals.emails.first {
            return email
        }
        if let phone = signals.phones.first {
            return phone
        }
        if let host = signals.urlHosts.first {
            return host
        }
        if let emailDomain = signals.emailDomains.first {
            return emailDomain
        }
        if let name = signals.names.first {
            return name
        }
        return nil
    }

    private func extractURLs(from text: String, into result: inout ExtractedSignals) {
        let pattern = #"(?i)\b((?:https?://|www\.)[^\s<>"']+)"#
        guard let regex = try? NSRegularExpression(pattern: pattern) else { return }

        let range = NSRange(text.startIndex..<text.endIndex, in: text)
        let matches = regex.matches(in: text, options: [], range: range)

        for match in matches {
            guard let matchRange = Range(match.range(at: 1), in: text) else { continue }
            let raw = String(text[matchRange])

            if let normalizedURL = try? PolicyNormalizer.shared.normalize(
                kind: .url,
                value: raw,
                matchType: .exact
            ) {
                result.urls.append(normalizedURL)
            }

            if let normalizedHost = try? PolicyNormalizer.shared.normalize(
                kind: .url,
                value: raw,
                matchType: .domainSuffix
            ) {
                result.urlHosts.append(normalizedHost)
            }
        }
    }

    private func extractPhones(from text: String, into result: inout ExtractedSignals) {
        let pattern = #"(?:\+?\d[\d\s\-\(\)]{4,}\d)"#
        guard let regex = try? NSRegularExpression(pattern: pattern) else { return }

        let range = NSRange(text.startIndex..<text.endIndex, in: text)
        let matches = regex.matches(in: text, options: [], range: range)

        for match in matches {
            guard let matchRange = Range(match.range, in: text) else { continue }
            let phone = String(text[matchRange])

            if let normalizedPhone = try? PolicyNormalizer.shared.normalize(
                kind: .phone,
                value: phone,
                matchType: .exact
            ) {
                result.phones.append(normalizedPhone)
            }
        }
    }

    private func extractEmails(from text: String, into result: inout ExtractedSignals) {
        let pattern = #"(?i)\b[A-Z0-9._%+\-]+@[A-Z0-9.\-]+\.[A-Z]{2,}\b"#

        guard let regex = try? NSRegularExpression(pattern: pattern) else { return }

        let nsRange = NSRange(text.startIndex..<text.endIndex, in: text)
        let matches = regex.matches(in: text, options: [], range: nsRange)

        for match in matches {
            guard let range = Range(match.range, in: text) else { continue }
            let email = String(text[range])

            if let normalizedEmail = try? PolicyNormalizer.shared.normalize(
                kind: .email,
                value: email,
                matchType: .exact
            ) {
                result.emails.append(normalizedEmail)
                if let domain = normalizedEmail.split(separator: "@").last {
                    result.emailDomains.append(String(domain))
                }
            }
        }
    }

    private func senderDisplayName(from senderName: String) -> String {
        let trimmed = senderName.trimmingCharacters(in: .whitespacesAndNewlines)
        guard let range = trimmed.range(of: " (") else {
            return trimmed
        }
        return String(trimmed[..<range.lowerBound]).trimmingCharacters(in: .whitespacesAndNewlines)
    }

    private func uniquePreservingOrder(_ values: [String]) -> [String] {
        values.reduce(into: [String]()) { partialResult, value in
            guard !value.isEmpty, !partialResult.contains(value) else { return }
            partialResult.append(value)
        }
    }
}
