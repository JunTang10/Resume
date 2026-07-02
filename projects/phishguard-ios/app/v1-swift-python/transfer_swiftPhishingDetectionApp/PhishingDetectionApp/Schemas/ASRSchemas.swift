import Foundation

struct ASRMetadata: Decodable {
    let fileName: String
    let filePath: String
    let language: String
    let requestId: String?

    enum CodingKeys: String, CodingKey {
        case fileName = "file_name"
        case filePath = "file_path"
        case language
        case requestId = "request_id"
    }
}

struct ASRTranscription: Decodable {
    let transcript: String
    let confidence: Double?
}

struct AnalysisInput: Decodable {
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

struct AudioUploadResponse: Decodable {
    let success: Bool
    let message: String
    let metadata: ASRMetadata
    let transcription: ASRTranscription
    let analysisInput: AnalysisInput

    enum CodingKeys: String, CodingKey {
        case success
        case message
        case metadata
        case transcription
        case analysisInput = "analysis_input"
    }
}
