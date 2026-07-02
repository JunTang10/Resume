import Foundation

enum InputSourceType: String, Codable {
    case typedText
    case importedFile
    case ocr
    case asr
    case videoMetadata
    case unknown
}

struct PreprocessedInput {
    let cleanText: String
    let sourceTypes: [InputSourceType]
    let originalLength: Int
    let cleanedLength: Int

    var isEmpty: Bool {
        cleanText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}

enum InputPreprocessor {
    static func preprocess(_ text: String, sources: [InputSourceType] = [.unknown]) -> PreprocessedInput {
        let originalLength = text.count
        var cleanText = text
        cleanText = normalizeLineEndings(cleanText)
        cleanText = repairCommonOCRBreaks(cleanText)
        cleanText = removeOCRNoise(from: cleanText)
        cleanText = normalizeURLs(in: cleanText)
        cleanText = removeASRFillers(from: cleanText)
        cleanText = normalizeWhitespace(cleanText)
        cleanText = deduplicateRepeatedSegments(cleanText)
        cleanText = cleanText.trimmingCharacters(in: .whitespacesAndNewlines)

        return PreprocessedInput(
            cleanText: cleanText,
            sourceTypes: sources,
            originalLength: originalLength,
            cleanedLength: cleanText.count
        )
    }

    private static func normalizeLineEndings(_ text: String) -> String {
        text
            .replacingOccurrences(of: "\r\n", with: "\n")
            .replacingOccurrences(of: "\r", with: "\n")
            .replacingOccurrences(of: "\t", with: " ")
    }

    private static func repairCommonOCRBreaks(_ text: String) -> String {
        var result = text
        let replacements = [
            #"(?i)\bh\s*t\s*t\s*p\s*s\s*:\s*/\s*/"#: "https://",
            #"(?i)\bh\s*t\s*t\s*p\s*:\s*/\s*/"#: "http://",
            #"(?i)\bw\s*w\s*w\s*\."#: "www."
        ]

        for (pattern, replacement) in replacements {
            result = result.replacingOccurrences(
                of: pattern,
                with: replacement,
                options: .regularExpression
            )
        }
        return result
    }

    private static func removeOCRNoise(from text: String) -> String {
        let mapped = text.map { character -> Character in
            switch character {
            case "\u{FFFD}", "\u{00A0}":
                return " "
            case "“", "”":
                return "\""
            case "‘", "’":
                return "'"
            case "–", "—":
                return "-"
            default:
                return character
            }
        }

        let text = String(mapped)
        let tokens = text.split(separator: " ", omittingEmptySubsequences: false).map(String.init)
        let filtered = tokens.filter { token in
            let trimmed = token.trimmingCharacters(in: .whitespacesAndNewlines)
            guard !trimmed.isEmpty else { return true }
            if trimmed.count >= 4 && trimmed.range(of: #"[A-Za-z0-9]"#, options: .regularExpression) == nil {
                return false
            }
            return true
        }
        return filtered.joined(separator: " ")
    }

    private static func normalizeURLs(in text: String) -> String {
        text
            .split(separator: " ", omittingEmptySubsequences: false)
            .map { normalizeURLToken(String($0)) }
            .joined(separator: " ")
    }

    private static func normalizeURLToken(_ token: String) -> String {
        guard token.range(of: #"(?i)^(https?://|www\.)"#, options: .regularExpression) != nil else {
            return token
        }

        let leadingTrimSet = CharacterSet(charactersIn: "([{\"'<")
        let trailingTrimSet = CharacterSet(charactersIn: ".,;:!?)]}\"'>")
        let leading = String(token.prefix { character in
            String(character).rangeOfCharacter(from: leadingTrimSet) != nil
        })
        let trailing = String(token.reversed().prefix { character in
            String(character).rangeOfCharacter(from: trailingTrimSet) != nil
        }.reversed())
        var core = token
            .trimmingCharacters(in: leadingTrimSet)
            .trimmingCharacters(in: trailingTrimSet)

        if core.lowercased().hasPrefix("www.") {
            core = "https://" + core
        }

        if let components = URLComponents(string: core), let host = components.host {
            var normalized = components
            normalized.scheme = components.scheme?.lowercased()
            normalized.host = host.lowercased()
            core = normalized.string ?? core.lowercased()
        } else {
            core = core.lowercased()
        }

        return leading + core + trailing
    }

    private static func removeASRFillers(from text: String) -> String {
        let pattern = #"(?i)\b(um+|uh+|erm+|hmm+|mm+|ah+|like|you know)\b"#
        var result = text.replacingOccurrences(of: pattern, with: " ", options: .regularExpression)
        result = result.replacingOccurrences(
            of: #"(?i)\b(\w{1,3})(?:\s+\1){2,}\b"#,
            with: "$1",
            options: .regularExpression
        )
        return result
    }

    private static func normalizeWhitespace(_ text: String) -> String {
        text
            .replacingOccurrences(of: #"[ \t]{2,}"#, with: " ", options: .regularExpression)
            .replacingOccurrences(of: #"\n{3,}"#, with: "\n\n", options: .regularExpression)
            .replacingOccurrences(of: #"[ \t]*\n[ \t]*"#, with: "\n", options: .regularExpression)
    }

    private static func deduplicateRepeatedSegments(_ text: String) -> String {
        let separators = CharacterSet(charactersIn: ".!?\n")
        let parts = text.components(separatedBy: separators)
        var seen = Set<String>()
        var kept: [String] = []

        for part in parts {
            let segment = part.trimmingCharacters(in: .whitespacesAndNewlines)
            guard !segment.isEmpty else { continue }
            let key = segment
                .lowercased()
                .replacingOccurrences(of: #"[^a-z0-9]+"#, with: " ", options: .regularExpression)
                .trimmingCharacters(in: .whitespacesAndNewlines)
            guard !key.isEmpty else { continue }
            if seen.insert(key).inserted {
                kept.append(segment)
            }
        }

        if kept.isEmpty {
            return text
        }
        return kept.joined(separator: ". ")
    }
}
