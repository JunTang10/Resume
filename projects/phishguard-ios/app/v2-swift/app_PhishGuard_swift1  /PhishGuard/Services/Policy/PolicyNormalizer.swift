import Foundation

enum PolicyNormalizeError: LocalizedError {
    case emptyInput
    case invalidURL
    case invalidEmail
    case invalidPhone
    case invalidName

    var errorDescription: String? {
        switch self {
        case .emptyInput:
            return "The input cannot be empty."
        case .invalidURL:
            return "Invalid URL format."
        case .invalidEmail:
            return "Invalid email format."
        case .invalidPhone:
            return "Invalid phone number format."
        case .invalidName:
            return "Invalid name format."
        }
    }
}

final class PolicyNormalizer {
    static let shared = PolicyNormalizer()

    private init() {}

    func normalize(kind: PolicyKind, value: String, matchType: PolicyMatchType) throws -> String {
        let trimmed = value.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else {
            throw PolicyNormalizeError.emptyInput
        }

        switch kind {
        case .url:
            return try normalizeURL(trimmed, matchType: matchType)
        case .email:
            return try normalizeEmail(trimmed)
        case .phone:
            return try normalizePhone(trimmed)
        case .name:
            return try normalizeName(trimmed)
        }
    }

    private func normalizeURL(_ raw: String, matchType: PolicyMatchType) throws -> String {
        switch matchType {
        case .domainSuffix:
            let candidate = raw.contains("://") ? raw : "https://\(raw)"
            guard let url = URL(string: candidate),
                  let host = url.host?.lowercased() else {
                throw PolicyNormalizeError.invalidURL
            }
            return host

        case .exact:
            let candidate = raw.contains("://") ? raw : "https://\(raw)"
            guard let url = URL(string: candidate) else {
                throw PolicyNormalizeError.invalidURL
            }
            var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
            components?.fragment = nil
            return (components?.url?.absoluteString ?? url.absoluteString)
                .trimmingCharacters(in: CharacterSet(charactersIn: "/"))
                .lowercased()

        case .contains:
            return raw.lowercased()
        }
    }

    private func normalizeEmail(_ raw: String) throws -> String {
        let lowercased = raw.lowercased()
        let pattern = #"(?i)^[A-Z0-9._%+\-]+@[A-Z0-9.\-]+\.[A-Z]{2,}$"#
        let regex = try NSRegularExpression(pattern: pattern)
        let range = NSRange(location: 0, length: lowercased.utf16.count)

        guard regex.firstMatch(in: lowercased, options: [], range: range) != nil else {
            throw PolicyNormalizeError.invalidEmail
        }
        return lowercased
    }

    private func normalizePhone(_ raw: String) throws -> String {
        var result = ""

        for (index, char) in raw.enumerated() {
            if char.isNumber {
                result.append(char)
            } else if char == "+", index == 0 {
                result.append(char)
            }
        }

        let digitCount = result.filter(\.isNumber).count
        guard digitCount >= 5 else {
            throw PolicyNormalizeError.invalidPhone
        }

        return result
    }

    private func normalizeName(_ raw: String) throws -> String {
        let normalized = raw
            .folding(options: [.diacriticInsensitive, .caseInsensitive], locale: .current)
            .split(whereSeparator: { $0.isWhitespace })
            .joined(separator: " ")

        guard !normalized.isEmpty else {
            throw PolicyNormalizeError.invalidName
        }

        return normalized
    }
}
