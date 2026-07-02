import Foundation

final class TextService {
    
    func readTextFile(from url: URL) throws -> String {
        return try String(contentsOf: url, encoding: .utf8)
    }
    
    func cleanText(_ text: String) -> String {
        text
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .replacingOccurrences(of: "\r\n", with: "\n")
    }
}
