import Foundation

enum HistoryPolicyAddStatus: Equatable {
    case added
    case alreadyExists
    case unavailable
}

struct HistoryPolicyAddResult {
    let status: HistoryPolicyAddStatus
    let entry: WhitelistEntry?
    let message: String
}

@MainActor
final class HistoryService {
    static let shared = HistoryService()

    private let store: HistoryStore
    private let matcher: HistoryMatcher
    private let occurrenceEngine: HistoryOccurrenceEngine
    private let policyService: PolicyService

    init(
        store: HistoryStore? = nil,
        matcher: HistoryMatcher? = nil,
        occurrenceEngine: HistoryOccurrenceEngine? = nil,
        policyService: PolicyService = .shared
    ) {
        let resolvedStore = store ?? .shared
        let resolvedMatcher = matcher ?? HistoryMatcher()
        self.store = resolvedStore
        self.matcher = resolvedMatcher
        self.occurrenceEngine = occurrenceEngine ?? HistoryOccurrenceEngine(matcher: resolvedMatcher)
        self.policyService = policyService
    }

    var historyEvents: [DetectionEvent] {
        store.historyEvents
    }

    func addHistory(_ event: DetectionEvent) {
        store.add(event)
    }

    func deleteHistory(id: UUID) {
        store.delete(id: id)
    }

    func clearHistory() {
        store.clear()
    }

    func removeHistory(at offsets: IndexSet) {
        store.remove(at: offsets)
    }

    func compactHistoryIfNeeded() {
        store.compactHistoryIfNeeded()
    }

    func searchSimilarEvents(for input: HistorySearchInput) -> HistoryMatchResult {
        matcher.searchSimilarEvents(for: input, in: store.historyEvents)
    }

    func getHistoryDetail(id: UUID) -> DetectionEvent? {
        store.findById(id)
    }

    func resolvePolicyEntry(for event: DetectionEvent, label: String? = nil) -> WhitelistEntry? {
        let extractor = SignalExtractor()

        if let primary = event.metadata?["primaryMatchValue"]?.trimmingCharacters(in: .whitespacesAndNewlines),
           !primary.isEmpty {
            let matchKind = event.metadata?["matchKind"]
            let normalizedValues = extractor.normalizedPolicyValues(for: primary)
            guard !normalizedValues.isEmpty else { return nil }
            return WhitelistEntry(
                value: event.sourceHint?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty == false
                    ? event.sourceHint!.trimmingCharacters(in: .whitespacesAndNewlines)
                    : primary,
                normalizedValues: normalizedValues,
                matchKind: matchKind,
                primaryMatchValue: primary.lowercased(),
                label: label
            )
        }

        let analysisText = event.inputText.isEmpty ? event.summary : event.inputText
        let candidates = [
            event.sourceHint,
            event.metadata?["sender"],
            event.metadata?["source"],
            event.metadata?["subject"],
            extractor.preferredContext(text: analysisText, senderName: event.sourceHint)
        ]

        for candidate in candidates.compactMap({ $0?.trimmingCharacters(in: .whitespacesAndNewlines) }) where !candidate.isEmpty {
            if let entry = policyService.makeEntry(from: candidate, label: label) {
                return entry
            }
        }

        return nil
    }

    func addHistoryEventToWhitelist(id: UUID) -> HistoryPolicyAddResult {
        guard let event = getHistoryDetail(id: id),
              let entry = resolvePolicyEntry(for: event, label: "Added from History") else {
            return HistoryPolicyAddResult(status: .unavailable, entry: nil, message: "No sender/source could be extracted.")
        }

        if PersistenceStore.shared.containsWhitelistMatch(for: entry) {
            return HistoryPolicyAddResult(status: .alreadyExists, entry: entry, message: "Already exists in whitelist")
        }

        PersistenceStore.shared.addWhitelist(entry)
        return HistoryPolicyAddResult(status: .added, entry: entry, message: "Added to whitelist")
    }

    func addHistoryEventToBlocklist(id: UUID) -> HistoryPolicyAddResult {
        guard let event = getHistoryDetail(id: id),
              let entry = resolvePolicyEntry(for: event, label: "Added from History") else {
            return HistoryPolicyAddResult(status: .unavailable, entry: nil, message: "No sender/source could be extracted.")
        }

        if PersistenceStore.shared.containsBlocklistMatch(for: entry) {
            return HistoryPolicyAddResult(status: .alreadyExists, entry: entry, message: "Already exists in blocklist")
        }

        PersistenceStore.shared.addBlocklist(entry)
        return HistoryPolicyAddResult(status: .added, entry: entry, message: "Added to blocklist")
    }

    func analyzeOccurrence(text: String, sourceHint: String?, modality: ModalityType) -> OccurrenceHistoryResult? {
        occurrenceEngine.analyze(
            text: text,
            sourceHint: sourceHint,
            modality: modality,
            historyEvents: store.historyEvents
        )
    }
}
