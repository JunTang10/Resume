import Foundation

enum PolicyMode: String, Codable, CaseIterable, Identifiable {
    case allow
    case block

    var id: String { rawValue }
}

enum PolicyKind: String, Codable, CaseIterable, Identifiable {
    case url
    case email
    case phone
    case name

    var id: String { rawValue }
}

enum PolicyMatchType: String, Codable, CaseIterable, Identifiable {
    case exact
    case domainSuffix
    case contains

    var id: String { rawValue }
}

enum PolicySource: String, Codable, CaseIterable, Identifiable {
    case user
    case admin
    case trustedContacts

    var id: String { rawValue }
}

struct PolicyEntry: Identifiable, Codable, Hashable {
    var id: UUID
    var mode: PolicyMode
    var kind: PolicyKind
    var matchType: PolicyMatchType
    var source: PolicySource
    var value: String
    var normalizedValue: String
    var enabled: Bool
    var note: String?
    var createdAt: Date
    var updatedAt: Date

    init(
        id: UUID = UUID(),
        mode: PolicyMode,
        kind: PolicyKind,
        matchType: PolicyMatchType,
        source: PolicySource,
        value: String,
        normalizedValue: String,
        enabled: Bool = true,
        note: String? = nil,
        createdAt: Date = Date(),
        updatedAt: Date = Date()
    ) {
        self.id = id
        self.mode = mode
        self.kind = kind
        self.matchType = matchType
        self.source = source
        self.value = value
        self.normalizedValue = normalizedValue
        self.enabled = enabled
        self.note = note
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
