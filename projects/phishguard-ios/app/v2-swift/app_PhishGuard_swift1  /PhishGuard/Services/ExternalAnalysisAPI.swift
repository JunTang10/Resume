import Foundation

struct ExternalExtraMeta: Codable {
    let platform: String
    let client: String
    let modality: String
    let timestamp: Date

    init(platform: String = "iOS", client: String = "PhishGuard", modality: String = "text", timestamp: Date = Date()) {
        self.platform = platform
        self.client = client
        self.modality = modality
        self.timestamp = timestamp
    }
}

struct ExternalUploadRequest: Codable {
    let text: String
    let extraMeta: ExternalExtraMeta

    enum CodingKeys: String, CodingKey {
        case text
        case extraMeta = "extra_meta"
    }
}

struct ExternalUploadResponse: Codable {
    let requestID: String
    let status: String?

    enum CodingKeys: String, CodingKey {
        case requestID = "request_id"
        case status
    }
}

struct ExternalPollResultResponse: Codable {
    let status: String
    let result: ExternalServerResultPayload?
    let message: String?
}

struct ExternalServerResultPayload: Codable {
    let label: String
    let confidence: Double
    let source: String
}

enum ExternalAnalysisAPIError: LocalizedError {
    case invalidResponse
    case serverError(statusCode: Int, message: String?)
    case failed(String?)
    case timeout
    case network(Error)

    var errorDescription: String? {
        switch self {
        case .invalidResponse:
            return "External analysis returned an invalid response."
        case .serverError(let statusCode, let message):
            return "External analysis server error \(statusCode): \(message ?? "Unknown error")"
        case .failed(let message):
            return "External analysis failed: \(message ?? "No details")"
        case .timeout:
            return "External analysis timed out."
        case .network(let error):
            return "External analysis network error: \(error.localizedDescription)"
        }
    }
}

class ExternalAnalysisAPI {
    static let shared = ExternalAnalysisAPI()

    private static let fallbackBaseURL = URL(string: "http://10.159.140.30:5000")!

    private static func makeDefaultSession() -> URLSession {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 60
        configuration.timeoutIntervalForResource = 300
        return URLSession(configuration: configuration)
    }

    private let baseURL: URL
    private let session: URLSession
    private let encoder: JSONEncoder
    private let decoder: JSONDecoder
    private let maxPollAttempts: Int
    private let pollIntervalNanoseconds: UInt64

    init(
        baseURL: URL = ExternalAnalysisAPI.resolvedBaseURL(),
        session: URLSession = ExternalAnalysisAPI.makeDefaultSession(),
        maxPollAttempts: Int = 120,
        pollIntervalNanoseconds: UInt64 = 2_000_000_000
    ) {
        self.baseURL = baseURL
        self.session = session
        self.maxPollAttempts = maxPollAttempts
        self.pollIntervalNanoseconds = pollIntervalNanoseconds

        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        self.encoder = encoder

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        self.decoder = decoder

        print("[ExternalAnalysisAPI] baseURL = \(baseURL.absoluteString)")
    }

    private static func resolvedBaseURL(bundle: Bundle = .main) -> URL {
        guard let rawValue = bundle.object(forInfoDictionaryKey: "EXTERNAL_API_BASE_URL") as? String,
              !rawValue.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            return fallbackBaseURL
        }

        guard let configuredURL = URL(string: rawValue) else {
            print("[ExternalAnalysisAPI] invalid EXTERNAL_API_BASE_URL, falling back to default: \(rawValue)")
            return fallbackBaseURL
        }

        return configuredURL
    }

    func uploadJSON(text: String, modality: ModalityType = .text) async throws -> ExternalUploadResponse {
        let requestURL = url(path: "/ios/upload_json")
        print("[ExternalAnalysisAPI] POST \(requestURL.absoluteString)")
        var request = URLRequest(url: requestURL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = try encoder.encode(
            ExternalUploadRequest(
                text: text,
                extraMeta: ExternalExtraMeta(modality: modality.rawValue)
            )
        )
        return try await execute(request)
    }

    func fetchResult(requestID: String) async throws -> ExternalPollResultResponse {
        let escapedID = requestID.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? requestID
        let requestURL = url(path: "/ios/result/\(escapedID)")
        print("[ExternalAnalysisAPI] GET \(requestURL.absoluteString)")
        return try await execute(URLRequest(url: requestURL))
    }

    func pollUntilDone(requestID: String) async throws -> ExternalPollResultResponse {
        print("[ExternalAnalysisAPI] polling started for request_id = \(requestID)")
        for attempt in 0..<maxPollAttempts {
            let attemptNumber = attempt + 1
            print("[ExternalAnalysisAPI] polling attempt \(attemptNumber)/\(maxPollAttempts)")
            let response = try await fetchResult(requestID: requestID)
            let normalizedStatus = response.status.lowercased()
            print("[ExternalAnalysisAPI] polling status = \(normalizedStatus)")
            switch normalizedStatus {
            case "done":
                guard response.result != nil else { throw ExternalAnalysisAPIError.invalidResponse }
                print("[ExternalAnalysisAPI] polling completed with status done")
                return response
            case "pending", "queued", "processing":
                if attempt < maxPollAttempts - 1 {
                    try await Task.sleep(nanoseconds: pollIntervalNanoseconds)
                }
            case "failed", "error":
                throw ExternalAnalysisAPIError.failed(response.message)
            default:
                throw ExternalAnalysisAPIError.invalidResponse
            }
        }
        print("[ExternalAnalysisAPI] polling timed out after \(maxPollAttempts) attempts")
        throw ExternalAnalysisAPIError.timeout
    }

    func analyzeText(_ text: String, modality: ModalityType = .text) async throws -> AnalyzeResponse {
        let start = Date()
        let upload = try await uploadJSON(text: text, modality: modality)
        let poll = try await pollUntilDone(requestID: upload.requestID)
        guard let result = poll.result else { throw ExternalAnalysisAPIError.invalidResponse }
        let latencyMs = max(1, Int(Date().timeIntervalSince(start) * 1000))
        return result.asAnalyzeResponse(
            requestID: upload.requestID,
            inputText: text,
            modality: modality,
            latencyMs: latencyMs
        )
    }

    private func execute<T: Decodable>(_ request: URLRequest) async throws -> T {
        do {
            let (data, response) = try await session.data(for: request)
            guard let http = response as? HTTPURLResponse else {
                throw ExternalAnalysisAPIError.invalidResponse
            }
            guard (200..<300).contains(http.statusCode) else {
                throw ExternalAnalysisAPIError.serverError(
                    statusCode: http.statusCode,
                    message: String(data: data, encoding: .utf8)
                )
            }
            do {
                return try decoder.decode(T.self, from: data)
            } catch {
                throw ExternalAnalysisAPIError.invalidResponse
            }
        } catch let error as ExternalAnalysisAPIError {
            throw error
        } catch {
            throw ExternalAnalysisAPIError.network(error)
        }
    }

    private func url(path: String) -> URL {
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: false)!
        components.path = path
        return components.url!
    }
}

private extension ExternalServerResultPayload {
    func asAnalyzeResponse(
        requestID: String,
        inputText: String,
        modality: ModalityType,
        latencyMs: Int
    ) -> AnalyzeResponse {
        let normalizedConfidence = min(1.0, max(0.0, confidence))
        let normalizedLabel = label.lowercased()
        let score: Double
        let verdict: String

        switch normalizedLabel {
        case "phishing", "malicious":
            score = 7.0 + normalizedConfidence * 3.0
            verdict = "phishing"
        case "suspicious":
            score = 3.0 + normalizedConfidence * 3.9
            verdict = "suspicious"
        case "safe", "benign", "legitimate":
            score = (1.0 - normalizedConfidence) * 2.9
            verdict = "safe"
        default:
            score = 3.0 + normalizedConfidence * 2.0
            verdict = "suspicious"
        }

        let normalizedScore = RiskLevel.normalizedScore(score)
        let sourceLabel = source.isEmpty ? "external" : source

        return AnalyzeResponse(
            requestId: requestID,
            modality: modality,
            inputText: inputText,
            score: normalizedScore,
            level: RiskLevel.level(for: normalizedScore),
            verdict: verdict,
            confidence: normalizedConfidence,
            reasoning: "\(sourceLabel.capitalized) analysis classified this \(modality.displayName.lowercased()) input as \(normalizedLabel) with \(Int((normalizedConfidence * 100).rounded()))% confidence.",
            indicators: ["external label: \(normalizedLabel)", "source: \(sourceLabel)"],
            tierUsed: DetectionTier.apiNameToRawValue(sourceLabel),
            tierName: sourceLabel,
            latencyMs: latencyMs,
            wasEscalated: sourceLabel.lowercased() != "on_device"
        )
    }
}
