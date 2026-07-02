import Foundation

final class PolicyService {
    static let shared = PolicyService()

    private let store: PolicyStore
    private let matcher: PolicyMatcher
    private let extractor: SignalExtractor

    init(
        store: PolicyStore = PolicyStore(),
        matcher: PolicyMatcher = PolicyMatcher(),
        extractor: SignalExtractor = SignalExtractor()
    ) {
        self.store = store
        self.matcher = matcher
        self.extractor = extractor
    }

    func evaluate(
        text: String,
        senderName: String? = nil,
        trustedContacts: [WhitelistEntry],
        blockedDomains: [WhitelistEntry] = []
    ) -> MatchResult {
        let mergedEntries = store.allEntries()
            + policyEntries(from: trustedContacts, mode: .allow, source: .trustedContacts)
            + policyEntries(from: blockedDomains, mode: .block, source: .user)
        return matcher.evaluate(text: text, senderName: senderName, entries: mergedEntries)
    }

    func suggestedContext(text: String, senderName: String? = nil) -> String? {
        extractor.preferredContext(text: text, senderName: senderName)
    }

    @discardableResult
    @MainActor
    func addWhitelistEntry(from rawValue: String, label: String? = nil) -> WhitelistEntry? {
        makeEntry(from: rawValue, label: label).map {
            PersistenceStore.shared.addWhitelist($0)
            return $0
        }
    }

    @discardableResult
    @MainActor
    func addBlocklistEntry(from rawValue: String, label: String? = nil) -> WhitelistEntry? {
        makeEntry(from: rawValue, label: label).map {
            PersistenceStore.shared.addBlocklist($0)
            return $0
        }
    }

    func makeEntry(from rawValue: String, label: String? = nil) -> WhitelistEntry? {
        buildEntry(from: rawValue, label: label)
    }

    private func policyEntries(
        from entries: [WhitelistEntry],
        mode: PolicyMode,
        source: PolicySource
    ) -> [PolicyEntry] {
        entries.flatMap { entry -> [PolicyEntry] in
            let rawValue = entry.value.trimmingCharacters(in: .whitespacesAndNewlines)
            guard !rawValue.isEmpty else { return [] }

            let normalizedValues = entry.normalizedValues.isEmpty
                ? extractor.normalizedPolicyValues(for: rawValue)
                : entry.normalizedValues
            let primaryNormalizedValue = normalizedComparableValue(
                entry.primaryMatchValue?.isEmpty == false ? entry.primaryMatchValue! : normalizedValues.first
            )
            let primaryRule = policyRule(
                for: primaryNormalizedValue,
                originalDisplayValue: rawValue,
                storedMatchKind: entry.matchKind
            )

            var policyEntries: [PolicyEntry] = []
            if let primaryNormalizedValue {
                policyEntries.append(
                    PolicyEntry(
                        id: entry.id,
                        mode: mode,
                        kind: primaryRule.kind,
                        matchType: primaryRule.matchType,
                        source: source,
                        value: rawValue,
                        normalizedValue: primaryNormalizedValue,
                        enabled: true,
                        note: entry.label,
                        createdAt: entry.addedAt,
                        updatedAt: entry.addedAt
                    )
                )
            }

            let fallbackEntries = normalizedValues.compactMap { normalizedValue -> PolicyEntry? in
                let comparableValue = normalizedComparableValue(normalizedValue)
                guard let comparableValue, comparableValue != primaryNormalizedValue else { return nil }
                let rule = policyRule(
                    for: comparableValue,
                    originalDisplayValue: rawValue,
                    storedMatchKind: entry.matchKind
                )
                return PolicyEntry(
                    id: entry.id,
                    mode: mode,
                    kind: rule.kind,
                    matchType: rule.matchType,
                    source: source,
                    value: rawValue,
                    normalizedValue: comparableValue,
                    enabled: true,
                    note: entry.label,
                    createdAt: entry.addedAt,
                    updatedAt: entry.addedAt
                )
            }

            return policyEntries + fallbackEntries
        }
    }

    private func buildEntry(from rawValue: String, label: String?) -> WhitelistEntry? {
        let displayValue = rawValue.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !displayValue.isEmpty else { return nil }
        let normalizedValues = extractor.normalizedPolicyValues(for: displayValue)
        guard !normalizedValues.isEmpty else { return nil }
        let identity = preferredIdentity(for: displayValue, normalizedValues: normalizedValues)
        return WhitelistEntry(
            value: displayValue,
            normalizedValues: normalizedValues,
            matchKind: identity.kind.rawValue,
            primaryMatchValue: identity.primaryValue,
            label: label
        )
    }

    private func policyRule(
        for normalizedValue: String?,
        originalDisplayValue: String,
        storedMatchKind: String?
    ) -> (kind: PolicyKind, matchType: PolicyMatchType) {
        if let storedMatchKind, let kind = PolicyKind(rawValue: storedMatchKind) {
            switch kind {
            case .email, .phone:
                return (kind, .exact)
            case .url:
                return (kind, .domainSuffix)
            case .name:
                return (kind, .contains)
            }
        }

        guard let normalizedValue else {
            return (.name, .contains)
        }

        if normalizedValue.contains("@") {
            return (.email, .exact)
        }
        if normalizedValue.contains(".") {
            return (.url, .domainSuffix)
        }
        if normalizedValue.contains(where: \.isNumber) {
            return (.phone, .exact)
        }
        if originalDisplayValue.contains("@") {
            return (.email, .exact)
        }
        return (.name, .contains)
    }

    private func preferredIdentity(for rawValue: String, normalizedValues: [String]) -> (kind: PolicyKind, primaryValue: String) {
        if let email = normalizedValues.first(where: { $0.contains("@") }) {
            return (.email, email)
        }
        if let phone = normalizedValues.first(where: { $0.contains(where: \.isNumber) && !$0.contains(".") }) {
            return (.phone, phone)
        }
        if let domain = normalizedValues.first(where: { $0.contains(".") }) {
            return (.url, domain)
        }
        if let name = normalizedValues.first {
            return (.name, name)
        }

        let fallback = rawValue.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        return (.name, fallback)
    }

    private func normalizedComparableValue(_ value: String?) -> String? {
        guard let value else { return nil }
        let trimmed = value.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        return trimmed.isEmpty ? nil : trimmed
    }
}
