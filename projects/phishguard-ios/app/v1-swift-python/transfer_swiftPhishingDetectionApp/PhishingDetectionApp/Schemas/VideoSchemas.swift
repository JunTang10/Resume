import Foundation

struct VideoUploadRequest {
    let fileURL: URL
    let language: String
    let requestId: String?
}

struct VideoUploadResponse: Codable {
    let success: Bool
    let message: String
    let metadata: VideoMetadata
    let extractionResult: VideoExtractionResult
    let analysisInput: VideoAnalysisInputPayload

    enum CodingKeys: String, CodingKey {
        case success
        case message
        case metadata
        case extractionResult = "extraction_result"
        case analysisInput = "analysis_input"
    }
}

struct VideoMetadata: Codable {
    let fileName: String
    let filePath: String
    let requestId: String?

    enum CodingKeys: String, CodingKey {
        case fileName = "file_name"
        case filePath = "file_path"
        case requestId = "request_id"
    }
}

struct VideoExtractionResult: Codable {
    let extractedText: String
    let method: String

    enum CodingKeys: String, CodingKey {
        case extractedText = "extracted_text"
        case method
    }
}

struct VideoAnalysisInputPayload: Codable {
    let text: String?
    let source: String?
    let language: String?
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
