import Foundation

// MARK: - API Request / Response types

struct AnalyzeTextRequest: Codable {
    let text: String
    let senderMetadata: SenderMetadata?
}

struct AnalyzeVoiceRequest: Codable {
    let transcription: String
    let sourceNumber: String?
    let durationSeconds: Double
    let timestamp: Date
}

struct AnalyzeVideoRequest: Codable {
    let ocrText: String?
    let visualMetadata: String?
    let platformSource: String?
}

struct SenderMetadata: Codable {
    let sender: String?
    let domain: String?
    let timestamp: Date?
}

struct AnalyzeResponse: Codable {
    let success: Bool
    let requestId: String
    let modality: ModalityType
    let inputText: String
    let score: Double
    let level: RiskLevel
    let verdict: String
    let confidence: Double
    let reasoning: String?
    let indicators: [String]
    let tierUsed: Int
    let tierName: String
    let latencyMs: Int?
    let wasEscalated: Bool

    init(
        success: Bool = true,
        requestId: String,
        modality: ModalityType,
        inputText: String,
        score: Double,
        level: RiskLevel,
        verdict: String,
        confidence: Double,
        reasoning: String?,
        indicators: [String],
        tierUsed: Int,
        tierName: String,
        latencyMs: Int?,
        wasEscalated: Bool
    ) {
        self.success = success
        self.requestId = requestId
        self.modality = modality
        self.inputText = inputText
        self.score = score
        self.level = level
        self.verdict = verdict
        self.confidence = confidence
        self.reasoning = reasoning
        self.indicators = indicators
        self.tierUsed = tierUsed
        self.tierName = tierName
        self.latencyMs = latencyMs
        self.wasEscalated = wasEscalated
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        success = try container.decodeIfPresent(Bool.self, forKey: .success) ?? true
        requestId = try container.decodeIfPresent(String.self, forKey: .requestId) ?? UUID().uuidString
        modality = try container.decodeIfPresent(ModalityType.self, forKey: .modality) ?? .text
        inputText = try container.decodeIfPresent(String.self, forKey: .inputText) ?? ""
        score = try container.decodeIfPresent(Double.self, forKey: .score) ?? 0
        verdict = try container.decodeIfPresent(String.self, forKey: .verdict) ?? "safe"
        confidence = try container.decodeIfPresent(Double.self, forKey: .confidence) ?? 0
        reasoning = try container.decodeIfPresent(String.self, forKey: .reasoning)
        indicators = try container.decodeIfPresent([String].self, forKey: .indicators) ?? []
        if let decodedTierUsed = try container.decodeIfPresent(Int.self, forKey: .tierUsed) {
            tierUsed = decodedTierUsed
            tierName = DetectionTier.rawValueToAPIName(decodedTierUsed)
        } else if let decodedTierName = try container.decodeIfPresent(String.self, forKey: .tierUsed) {
            tierName = decodedTierName
            tierUsed = DetectionTier.apiNameToRawValue(decodedTierName)
        } else if let decodedTierName = try container.decodeIfPresent(String.self, forKey: .tierName) {
            tierName = decodedTierName
            tierUsed = DetectionTier.apiNameToRawValue(decodedTierName)
        } else if let decodedTierUsed = try container.decodeIfPresent(Int.self, forKey: .tierName) {
            tierUsed = decodedTierUsed
            tierName = DetectionTier.rawValueToAPIName(decodedTierUsed)
        } else {
            tierName = DetectionTier.onDevice.apiName
            tierUsed = DetectionTier.onDevice.rawValue
        }
        latencyMs = try container.decodeIfPresent(Int.self, forKey: .latencyMs)
        wasEscalated = (try container.decodeIfPresent(Bool.self, forKey: .wasEscalated))
            ?? (tierUsed != DetectionTier.onDevice.rawValue)

        if let decodedLevel = try container.decodeIfPresent(RiskLevel.self, forKey: .level) {
            level = decodedLevel
        } else {
            level = RiskLevel(score: score, verdict: verdict)
        }
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(success, forKey: .success)
        try container.encode(requestId, forKey: .requestId)
        try container.encode(modality, forKey: .modality)
        try container.encode(inputText, forKey: .inputText)
        try container.encode(score, forKey: .score)
        try container.encode(level, forKey: .level)
        try container.encode(verdict, forKey: .verdict)
        try container.encode(confidence, forKey: .confidence)
        try container.encodeIfPresent(reasoning, forKey: .reasoning)
        try container.encode(indicators, forKey: .indicators)
        try container.encode(tierUsed, forKey: .tierUsed)
        try container.encode(tierName, forKey: .tierName)
        try container.encodeIfPresent(latencyMs, forKey: .latencyMs)
        try container.encode(wasEscalated, forKey: .wasEscalated)
    }

    enum CodingKeys: String, CodingKey {
        case success
        case requestId = "request_id"
        case modality
        case inputText = "input_text"
        case score = "risk_score"
        case level = "risk_level"
        case verdict
        case confidence
        case reasoning = "rationale"
        case indicators
        case tierUsed = "tier_used"
        case tierName = "tier_name"
        case latencyMs = "processing_time_ms"
        case wasEscalated = "was_escalated"
    }
}

struct AnalysisRequest: Codable {
    let modality: String
    let inputText: String
    let requestId: String
    let metadata: [String: String]

    enum CodingKeys: String, CodingKey {
        case modality
        case inputText = "input_text"
        case requestId = "request_id"
        case metadata
    }
}

struct WhitelistCheckRequest: Codable {
    let value: String
}

struct WhitelistCheckResponse: Codable {
    let isWhitelisted: Bool
    let matchedEntry: String?
}

enum PhishGuardAPIError: LocalizedError {
    case networkUnavailable
    case serverError(statusCode: Int, message: String?)
    case decodingError(String)
    case timeout
    case custom(String)

    var errorDescription: String? {
        switch self {
        case .networkUnavailable:
            return "Network unavailable. Make sure the FastAPI backend is running."
        case .serverError(let code, let msg):
            return "Server error \(code): \(msg ?? "Unknown")"
        case .decodingError(let detail):
            return "Response parsing failed: \(detail)"
        case .timeout:
            return "Request timed out."
        case .custom(let msg):
            return msg
        }
    }
}

protocol PhishGuardAPIProtocol {
    func analyzeText(_ request: AnalyzeTextRequest) async throws -> AnalyzeResponse
    func analyzeVoice(_ request: AnalyzeVoiceRequest) async throws -> AnalyzeResponse
    func analyzeVideo(_ request: AnalyzeVideoRequest) async throws -> AnalyzeResponse
    func checkWhitelist(_ request: WhitelistCheckRequest) async throws -> WhitelistCheckResponse
    func getTierStatus() async throws -> [TierStatusDTO]
    func getHistory(limit: Int) async throws -> [DetectionEventDTO]
    func getWhitelist() async throws -> [WhitelistEntryDTO]
    func addWhitelistEntry(value: String, label: String?) async throws
    func removeWhitelistEntry(id: String) async throws
}

struct TierStatusDTO: Codable {
    let tier: Int
    let state: String
    let latencyMs: Int?
    let errorMessage: String?

    enum CodingKeys: String, CodingKey {
        case tier
        case state
        case latencyMs = "latency_ms"
        case errorMessage = "error_message"
    }
}

struct DetectionEventDTO: Codable {
    let id: String
    let modality: String
    let riskScore: Double
    let riskLevel: String
    let summary: String
    let sourceHint: String?
    let timestamp: String
    let tiersUsed: [Int]
    let wasBlocked: Bool

    enum CodingKeys: String, CodingKey {
        case id
        case modality
        case riskScore = "risk_score"
        case riskLevel = "risk_level"
        case summary
        case sourceHint = "source_hint"
        case timestamp
        case tiersUsed = "tiers_used"
        case wasBlocked = "was_blocked"
    }
}

struct WhitelistEntryDTO: Codable {
    let id: String
    let value: String
    let label: String?
    let addedAt: String

    enum CodingKeys: String, CodingKey {
        case id
        case value
        case label
        case addedAt = "added_at"
    }
}

final class APIClient {
    static let shared = APIClient()

    private let baseURL: URL
    private let session: URLSession
    private let decoder: JSONDecoder
    private let encoder: JSONEncoder

    init(baseURL: URL = URL(string: "http://127.0.0.1:8000")!) {
        self.baseURL = baseURL

        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 15
        config.timeoutIntervalForResource = 60
        self.session = URLSession(configuration: config)

        self.decoder = JSONDecoder()

        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        encoder.dateEncodingStrategy = .iso8601
        self.encoder = encoder
    }

    func post<Body: Encodable, Response: Decodable>(path: String, body: Body) async throws -> Response {
        var request = URLRequest(url: url(for: path))
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try encoder.encode(body)
        return try await execute(request)
    }

    func get<Response: Decodable>(path: String) async throws -> Response {
        try await execute(URLRequest(url: url(for: path)))
    }

    func delete(path: String) async throws {
        var request = URLRequest(url: url(for: path))
        request.httpMethod = "DELETE"
        let _: EmptyResponse = try await execute(request)
    }

    func uploadMultipart<Response: Decodable>(
        path: String,
        fileURL: URL,
        fileFieldName: String,
        mimeType: String,
        fields: [String: String]
    ) async throws -> Response {
        var request = URLRequest(url: url(for: path))
        request.httpMethod = "POST"

        let boundary = "Boundary-\(UUID().uuidString)"
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")

        let fileData = try Data(contentsOf: fileURL)
        var body = Data()

        for (name, value) in fields {
            body.appendString("--\(boundary)\r\n")
            body.appendString("Content-Disposition: form-data; name=\"\(name)\"\r\n\r\n")
            body.appendString("\(value)\r\n")
        }

        body.appendString("--\(boundary)\r\n")
        body.appendString("Content-Disposition: form-data; name=\"\(fileFieldName)\"; filename=\"\(fileURL.lastPathComponent)\"\r\n")
        body.appendString("Content-Type: \(mimeType)\r\n\r\n")
        body.append(fileData)
        body.appendString("\r\n")
        body.appendString("--\(boundary)--\r\n")
        request.httpBody = body

        return try await execute(request)
    }

    private func execute<T: Decodable>(_ request: URLRequest) async throws -> T {
        do {
            let (data, response) = try await session.data(for: request)
            guard let http = response as? HTTPURLResponse else {
                throw PhishGuardAPIError.networkUnavailable
            }
            guard (200..<300).contains(http.statusCode) else {
                let msg = String(data: data, encoding: .utf8)
                throw PhishGuardAPIError.serverError(statusCode: http.statusCode, message: msg)
            }
            do {
                return try decoder.decode(T.self, from: data)
            } catch {
                let raw = String(data: data, encoding: .utf8) ?? ""
                throw PhishGuardAPIError.decodingError("\(error.localizedDescription)\n\(raw)")
            }
        } catch let error as PhishGuardAPIError {
            throw error
        } catch let error as URLError where error.code == .timedOut {
            throw PhishGuardAPIError.timeout
        } catch is URLError {
            throw PhishGuardAPIError.networkUnavailable
        }
    }

    private func url(for path: String) -> URL {
        let cleanPath = path.hasPrefix("/") ? String(path.dropFirst()) : path
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: false)!
        let parts = cleanPath.split(separator: "?", maxSplits: 1, omittingEmptySubsequences: false)
        components.path = "/" + String(parts.first ?? "")
        if parts.count > 1 {
            components.query = String(parts[1])
        }
        return components.url!
    }

    struct EmptyResponse: Codable {}
}

final class PhishGuardAPI: PhishGuardAPIProtocol {
    static let shared = PhishGuardAPI()

    private let client: APIClient
    private let voiceAnalyzePath: String

    private init(client: APIClient = .shared, voiceAnalyzePath: String = "/voice/analyze") {
        self.client = client
        self.voiceAnalyzePath = voiceAnalyzePath
    }

    func analyzeText(_ request: AnalyzeTextRequest) async throws -> AnalyzeResponse {
        let analysisRequest = AnalysisRequest(
            modality: ModalityType.text.rawValue,
            inputText: request.text,
            requestId: UUID().uuidString,
            metadata: [
                "sender": request.senderMetadata?.sender ?? "",
                "domain": request.senderMetadata?.domain ?? ""
            ]
        )
        return try await client.post(path: "/text/analyze", body: analysisRequest)
    }

    func analyzeVoice(_ request: AnalyzeVoiceRequest) async throws -> AnalyzeResponse {
        let analysisRequest = AnalysisRequest(
            modality: ModalityType.voice.rawValue,
            inputText: request.transcription,
            requestId: UUID().uuidString,
            metadata: [
                "source_number": request.sourceNumber ?? "",
                "duration_seconds": String(request.durationSeconds)
            ]
        )
        return try await client.post(path: voiceAnalyzePath, body: analysisRequest)
    }

    func analyzeVideo(_ request: AnalyzeVideoRequest) async throws -> AnalyzeResponse {
        let analysisRequest = AnalysisRequest(
            modality: ModalityType.video.rawValue,
            inputText: request.ocrText ?? request.visualMetadata ?? "",
            requestId: UUID().uuidString,
            metadata: [
                "visual_metadata": request.visualMetadata ?? "",
                "platform_source": request.platformSource ?? ""
            ]
        )
        return try await client.post(path: "/video/analyze", body: analysisRequest)
    }

    func checkWhitelist(_ request: WhitelistCheckRequest) async throws -> WhitelistCheckResponse {
        let entries = PersistenceStore.shared.whitelist
        let needle = request.value.lowercased()
        let matched = entries.first { entry in
            let value = entry.value.lowercased()
            return needle.contains(value) || value.contains(needle)
        }
        return WhitelistCheckResponse(isWhitelisted: matched != nil, matchedEntry: matched?.value)
    }

    func getWhitelist() async throws -> [WhitelistEntryDTO] {
        PersistenceStore.shared.whitelist.map {
            WhitelistEntryDTO(id: $0.id.uuidString, value: $0.value, label: $0.label, addedAt: $0.addedAt.ISO8601Format())
        }
    }

    func addWhitelistEntry(value: String, label: String?) async throws {
        PersistenceStore.shared.addWhitelist(value: value, label: label)
    }
//从 Settings 界面删除白名单条目
    func removeWhitelistEntry(id: String) async throws {
        guard let uuid = UUID(uuidString: id) else { return }
        if let idx = PersistenceStore.shared.whitelist.firstIndex(where: { $0.id == uuid }) {
            PersistenceStore.shared.removeWhitelist(at: IndexSet(integer: idx))
        }
    }

    func getTierStatus() async throws -> [TierStatusDTO] {
        try await client.get(path: "/tiers/status")
    }

    func getHistory(limit: Int = 50) async throws -> [DetectionEventDTO] {
        try await client.get(path: "/events?limit=\(limit)")
    }
}

extension Data {
    mutating func appendString(_ string: String) {
        if let data = string.data(using: .utf8) {
            append(data)
        }
    }
}
