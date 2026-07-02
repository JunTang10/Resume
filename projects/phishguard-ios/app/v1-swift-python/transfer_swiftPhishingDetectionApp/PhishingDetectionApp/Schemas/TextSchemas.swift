import Foundation

struct TextUploadRequest {
    let fileURL: URL
    let source: String
    let language: String
    let requestId: String?
}

struct TextUploadResponse: Codable {
    let success: Bool
    let message: String
    let fileName: String
    let filePath: String
    let textRequest: TextRequestPayload
    let analysisInput: AnalysisInputPayload

    enum CodingKeys: String, CodingKey {
        case success
        case message
        case fileName = "file_name"
        case filePath = "file_path"
        case textRequest = "text_request"
        case analysisInput = "analysis_input"
    }
}

struct TextRequestPayload: Codable {
    let text: String
    let source: String
    let language: String
    let requestId: String?

    enum CodingKeys: String, CodingKey {
        case text
        case source
        case language
        case requestId = "request_id"
    }
}

struct AnalysisInputPayload: Codable {
    let text: String
    let source: String
    let language: String
    let requestId: String?
    let fileName: String?

    enum CodingKeys: String, CodingKey {
        case text
        case source
        case language
        case requestId = "request_id"
        case fileName = "file_name"
    }
}
