import Foundation
import Combine

// PersistenceStore keeps user-owned app data in UserDefaults,
// such as history, trusted contacts, and temporary blocklist entries.
@MainActor
final class PersistenceStore: ObservableObject {
    static let shared = PersistenceStore()

    @Published var whitelist: [WhitelistEntry] = [] {
        didSet { save(whitelist, key: "pg_whitelist") }
    }
    @Published var blocklist: [WhitelistEntry] = [] {
        didSet { save(blocklist, key: "pg_blocklist") }
    }

    private init() {
        whitelist = load(key: "pg_whitelist") ?? []
        blocklist = load(key: "pg_blocklist") ?? []
    }

    var events: [DetectionEvent] {
        get { HistoryStore.shared.historyEvents }
        set { HistoryStore.shared.historyEvents = newValue }
    }

    func addEvent(_ e: DetectionEvent) {
        HistoryStore.shared.add(e)
    }

    func removeEvents(at offsets: IndexSet) {
        HistoryStore.shared.remove(at: offsets)
    }
    func clearAllEvents() {
        HistoryStore.shared.clear()
    }

    func compactHistoryIfNeeded() {
        HistoryStore.shared.compactHistoryIfNeeded()
    }

    func addWhitelist(value: String, label: String?) {
        print("[Policy] addWhitelist requested:", value)
        let normalizedValues = SignalExtractor().normalizedPolicyValues(for: value)
        print("[Policy] addWhitelist normalized:", normalizedValues)
        addWhitelist(
            WhitelistEntry(
                value: value.trimmingCharacters(in: .whitespacesAndNewlines),
                normalizedValues: normalizedValues,
                primaryMatchValue: normalizedValues.first,
                label: label
            )
        )
    }

    func addWhitelist(_ entry: WhitelistEntry) {
        let trimmedValue = entry.value.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedValue.isEmpty else { return }
        let candidateValues = normalizedStoreValues(for: entry)
        objectWillChange.send()
        var updatedWhitelist = whitelist
        guard !updatedWhitelist.contains(where: { hasMatchingNormalizedValue(lhs: normalizedStoreValues(for: $0), rhs: candidateValues) }) else {
            print("[Policy] whitelist duplicate ignored:", trimmedValue)
            return
        }
        updatedWhitelist.append(
            WhitelistEntry(
                value: trimmedValue,
                normalizedValues: candidateValues,
                matchKind: entry.matchKind,
                primaryMatchValue: storageComparableValue(entry.primaryMatchValue ?? candidateValues.first ?? trimmedValue),
                label: entry.label
            )
        )
        whitelist = updatedWhitelist
        print("[Policy] whitelist count:", whitelist.count)
    }

    func containsWhitelistMatch(for entry: WhitelistEntry) -> Bool {
        let candidateValues = normalizedStoreValues(for: entry)
        return whitelist.contains {
            hasMatchingNormalizedValue(lhs: normalizedStoreValues(for: $0), rhs: candidateValues)
        }
    }

    func removeWhitelist(at offsets: IndexSet) {
        let idsToRemove = offsets.compactMap { index in
            whitelist.indices.contains(index) ? whitelist[index].id : nil
        }
        removeWhitelist(ids: idsToRemove)
    }

    func addBlocklist(value: String, label: String?) {
        print("[Policy] addBlocklist requested:", value)
        let normalizedValues = SignalExtractor().normalizedPolicyValues(for: value)
        print("[Policy] addBlocklist normalized:", normalizedValues)
        addBlocklist(
            WhitelistEntry(
                value: value.trimmingCharacters(in: .whitespacesAndNewlines),
                normalizedValues: normalizedValues,
                primaryMatchValue: normalizedValues.first,
                label: label
            )
        )
    }

    func addBlocklist(_ entry: WhitelistEntry) {
        let trimmedValue = entry.value.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedValue.isEmpty else { return }
        let candidateValues = normalizedStoreValues(for: entry)
        objectWillChange.send()
        var updatedBlocklist = blocklist
        guard !updatedBlocklist.contains(where: { hasMatchingNormalizedValue(lhs: normalizedStoreValues(for: $0), rhs: candidateValues) }) else {
            print("[Policy] blocklist duplicate ignored:", trimmedValue)
            return
        }
        updatedBlocklist.append(
            WhitelistEntry(
                value: trimmedValue,
                normalizedValues: candidateValues,
                matchKind: entry.matchKind,
                primaryMatchValue: storageComparableValue(entry.primaryMatchValue ?? candidateValues.first ?? trimmedValue),
                label: entry.label
            )
        )
        blocklist = updatedBlocklist
        print("[Policy] blocklist count:", blocklist.count)
    }

    func containsBlocklistMatch(for entry: WhitelistEntry) -> Bool {
        let candidateValues = normalizedStoreValues(for: entry)
        return blocklist.contains {
            hasMatchingNormalizedValue(lhs: normalizedStoreValues(for: $0), rhs: candidateValues)
        }
    }

    func removeBlocklist(at offsets: IndexSet) {
        let idsToRemove = offsets.compactMap { index in
            blocklist.indices.contains(index) ? blocklist[index].id : nil
        }
        removeBlocklist(ids: idsToRemove)
    }

    func removeWhitelist(ids: [UUID]) {
        guard !ids.isEmpty else { return }
        objectWillChange.send()
        whitelist = whitelist.filter { !ids.contains($0.id) }
        print("[Policy] whitelist count:", whitelist.count)
    }

    func removeBlocklist(ids: [UUID]) {
        guard !ids.isEmpty else { return }
        objectWillChange.send()
        blocklist = blocklist.filter { !ids.contains($0.id) }
        print("[Policy] blocklist count:", blocklist.count)
    }

    private func save<T: Encodable>(_ value: T, key: String) {
        if let data = try? JSONEncoder().encode(value) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }

    private func load<T: Decodable>(key: String) -> T? {
        guard let data = UserDefaults.standard.data(forKey: key) else { return nil }
        return try? JSONDecoder().decode(T.self, from: data)
    }

    private func normalizedStoredValue(_ value: String) -> String {
        value
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .replacingOccurrences(of: " ", with: "")
            .replacingOccurrences(of: "-", with: "")
            .lowercased()
    }

    private func normalizedStoreValues(for entry: WhitelistEntry) -> [String] {
        var normalizedValues = entry.normalizedValues
            .map(storageComparableValue(_:))
            .filter { !$0.isEmpty }

        if let primaryMatchValue = entry.primaryMatchValue.map(storageComparableValue(_:)),
           !primaryMatchValue.isEmpty,
           !normalizedValues.contains(primaryMatchValue) {
            normalizedValues.insert(primaryMatchValue, at: 0)
        }

        if !normalizedValues.isEmpty {
            return Array(Set(normalizedValues))
        }

        let fallback = normalizedStoredValue(entry.value)
        return fallback.isEmpty ? [] : [fallback]
    }

    private func hasMatchingNormalizedValue(lhs: [String], rhs: [String]) -> Bool {
        !Set(lhs).intersection(rhs).isEmpty
    }

    private func storageComparableValue(_ value: String) -> String {
        value
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .lowercased()
    }
}
