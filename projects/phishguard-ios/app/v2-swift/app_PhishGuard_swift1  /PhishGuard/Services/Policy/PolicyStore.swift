import Foundation

// PolicyStore persists reusable policy rules to a JSON file.
// This is separate from PersistenceStore, which keeps user app data in UserDefaults.
final class PolicyStore {
    private(set) var entries: [PolicyEntry] = []

    private let fileURL: URL

    init() {
        let doc = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        self.fileURL = doc.appendingPathComponent("policy_entries.json")
        load()
    }

    func addEntry(
        mode: PolicyMode,
        kind: PolicyKind,
        matchType: PolicyMatchType,
        source: PolicySource,
        value: String,
        note: String?
    ) throws {
        let normalized = try PolicyNormalizer.shared.normalize(
            kind: kind,
            value: value,
            matchType: matchType
        )

        let entry = PolicyEntry(
            mode: mode,
            kind: kind,
            matchType: matchType,
            source: source,
            value: value,
            normalizedValue: normalized,
            enabled: true,
            note: note
        )

        entries.append(entry)
        save()
    }

    func allEntries() -> [PolicyEntry] {
        entries
    }

    private func save() {
        do {
            let data = try JSONEncoder().encode(entries)
            try data.write(to: fileURL)
        } catch {
            print("[PolicyStore] save error: \(error.localizedDescription)")
        }
    }

    private func load() {
        do {
            let data = try Data(contentsOf: fileURL)
            entries = try JSONDecoder().decode([PolicyEntry].self, from: data)
        } catch {
            entries = []
        }
    }
}
