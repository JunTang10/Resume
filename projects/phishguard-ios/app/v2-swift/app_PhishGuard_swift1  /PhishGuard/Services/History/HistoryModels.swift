import Foundation

struct DetectionEvent: Identifiable, Codable {
    let id: UUID
    var modality: ModalityType
    var riskScore: Double
    var riskLevel: RiskLevel
    var summary: String
    var indicators: [String]
    var verdict: String?
    var processingTimeMs: Int?
    var sourceHint: String?
    var timestamp: Date
    var tiersUsed: [Int]
    var wasBlocked: Bool
    var inputText: String
    var metadata: [String: String]?

    var source: String? { sourceHint }
    var reason: String { summary }
    var matchedSignals: [String] { indicators }
    var modelUsedDescription: String? {
        tiersUsed.first.map { DetectionTier.rawValueToAPIName($0) }
    }

    init(
        modality: ModalityType,
        riskScore: Double,
        riskLevel: RiskLevel,
        summary: String,
        indicators: [String] = [],
        verdict: String? = nil,
        processingTimeMs: Int? = nil,
        sourceHint: String? = nil,
        tiersUsed: [Int],
        wasBlocked: Bool,
        inputText: String = "",
        metadata: [String: String]? = nil
    ) {
        self.id = UUID()
        self.modality = modality
        self.riskScore = riskScore
        self.riskLevel = riskLevel
        self.summary = summary
        self.indicators = indicators
        self.verdict = verdict
        self.processingTimeMs = processingTimeMs
        self.sourceHint = sourceHint
        self.timestamp = Date()
        self.tiersUsed = tiersUsed
        self.wasBlocked = wasBlocked
        self.inputText = inputText
        self.metadata = metadata
    }

    private enum CodingKeys: String, CodingKey {
        case id
        case modality
        case riskScore
        case riskLevel
        case summary
        case indicators
        case verdict
        case processingTimeMs
        case sourceHint
        case timestamp
        case tiersUsed
        case wasBlocked
        case inputText
        case metadata
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(UUID.self, forKey: .id) ?? UUID()
        modality = try container.decode(ModalityType.self, forKey: .modality)
        riskScore = try container.decode(Double.self, forKey: .riskScore)
        riskLevel = try container.decode(RiskLevel.self, forKey: .riskLevel)
        summary = try container.decode(String.self, forKey: .summary)
        indicators = try container.decodeIfPresent([String].self, forKey: .indicators) ?? []
        verdict = try container.decodeIfPresent(String.self, forKey: .verdict)
        processingTimeMs = try container.decodeIfPresent(Int.self, forKey: .processingTimeMs)
        sourceHint = try container.decodeIfPresent(String.self, forKey: .sourceHint)
        timestamp = try container.decodeIfPresent(Date.self, forKey: .timestamp) ?? Date()
        tiersUsed = try container.decodeIfPresent([Int].self, forKey: .tiersUsed) ?? []
        wasBlocked = try container.decodeIfPresent(Bool.self, forKey: .wasBlocked) ?? false
        inputText = try container.decodeIfPresent(String.self, forKey: .inputText) ?? ""
        metadata = try container.decodeIfPresent([String: String].self, forKey: .metadata)
    }
}

struct HistorySearchInput {
    let source: String?
    let modality: ModalityType
    let inputText: String
}

struct HistoryMatchResult {
    let matched: Bool
    let matchedEvents: [DetectionEvent]
    let matchedSource: String?
    let matchedSignals: [String]
    let explanation: String
}
