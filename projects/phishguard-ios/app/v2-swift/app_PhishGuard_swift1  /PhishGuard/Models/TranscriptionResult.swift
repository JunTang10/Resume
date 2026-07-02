import Foundation

struct TranscriptionResult {
    let text: String
    let source: String
    let success: Bool
    let message: String
    let requestId: String?
    let confidence: Double?
    let processingTimeMs: Int?

    init(
        text: String,
        source: String,
        success: Bool,
        message: String,
        requestId: String? = nil,
        confidence: Double? = nil,
        processingTimeMs: Int? = nil
    ) {
        self.text = text
        self.source = source
        self.success = success
        self.message = message
        self.requestId = requestId
        self.confidence = confidence
        self.processingTimeMs = processingTimeMs
    }
}
