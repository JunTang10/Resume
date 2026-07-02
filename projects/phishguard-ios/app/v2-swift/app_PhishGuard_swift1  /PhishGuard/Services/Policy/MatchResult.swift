import Foundation

enum MatchResult: Equatable {
    case block([String])
    case allow([String])
    case none

    var title: String {
        switch self {
        case .block:
            return "Policy block match"
        case .allow:
            return "Trusted contact match"
        case .none:
            return "No policy match"
        }
    }

    var reasons: [String] {
        switch self {
        case .block(let reasons):
            return reasons
        case .allow(let reasons):
            return reasons
        case .none:
            return []
        }
    }

    var indicators: [String] {
        switch self {
        case .block:
            return ["block rule matched"]
        case .allow:
            return ["trusted contact matched"]
        case .none:
            return []
        }
    }

    var reasoningText: String? {
        switch self {
        case .block(let reasons):
            return "Local policy matched a blocking rule: \(reasons.joined(separator: ", "))."
        case .allow(let reasons):
            return "Local policy matched a trusted contact rule: \(reasons.joined(separator: ", "))."
        case .none:
            return nil
        }
    }
}
