import Foundation
import Combine

@MainActor
final class HistoryStore: ObservableObject {
    static let shared = HistoryStore()

    @Published var historyEvents: [DetectionEvent] = [] {
        didSet { save(historyEvents, key: "pg_events") }
    }

    private init() {
        let loadedEvents: [DetectionEvent] = load(key: "pg_events") ?? []
        historyEvents = compactConsecutiveDuplicateEvents(loadedEvents)
        if loadedEvents.count != historyEvents.count {
            save(historyEvents, key: "pg_events")
        }
    }

    func add(_ event: DetectionEvent) {
        if let latestEvent = historyEvents.first, isEquivalentEvent(latestEvent, event) {
            print("[History] duplicate event ignored:", event.summary)
            return
        }

        var updatedEvents = historyEvents
        updatedEvents.insert(event, at: 0)
        if updatedEvents.count > 200 {
            updatedEvents = Array(updatedEvents.prefix(200))
        }
        historyEvents = updatedEvents
    }

    func delete(id: UUID) {
        historyEvents.removeAll { $0.id == id }
    }

    func remove(at offsets: IndexSet) {
        var updatedEvents = historyEvents
        for offset in offsets.sorted(by: >) {
            updatedEvents.remove(at: offset)
        }
        historyEvents = updatedEvents
    }

    func clear() {
        historyEvents = []
        UserDefaults.standard.removeObject(forKey: "pg_events")
        print("[History] cleared all events")
    }

    func findById(_ id: UUID) -> DetectionEvent? {
        historyEvents.first { $0.id == id }
    }

    func compactHistoryIfNeeded() {
        let compactedEvents = compactConsecutiveDuplicateEvents(historyEvents)
        guard compactedEvents.count != historyEvents.count else { return }
        historyEvents = compactedEvents
        print("[History] compacted duplicate events:", historyEvents.count)
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

    private func isEquivalentEvent(_ lhs: DetectionEvent, _ rhs: DetectionEvent) -> Bool {
        lhs.modality == rhs.modality
        && abs(lhs.riskScore - rhs.riskScore) < 0.01
        && lhs.riskLevel == rhs.riskLevel
        && lhs.verdict == rhs.verdict
        && normalizedStoredValue(lhs.sourceHint ?? "") == normalizedStoredValue(rhs.sourceHint ?? "")
        && lhs.summary == rhs.summary
        && lhs.indicators == rhs.indicators
        && lhs.inputText == rhs.inputText
    }

    private func compactConsecutiveDuplicateEvents(_ input: [DetectionEvent]) -> [DetectionEvent] {
        var compacted: [DetectionEvent] = []

        for event in input {
            if let latest = compacted.last, isEquivalentEvent(latest, event) {
                continue
            }
            compacted.append(event)
        }

        return compacted
    }
}
