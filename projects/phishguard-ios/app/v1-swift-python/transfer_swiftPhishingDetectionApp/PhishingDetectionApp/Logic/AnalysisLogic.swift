import SwiftUI
import Combine

@MainActor
final class AnalysisLogic: ObservableObject {
    @Published var resultMessage: String = "No result yet"
    @Published var isLoading: Bool = false

    func uploadTextFile(fileURL: URL) async {
        isLoading = true
        defer { isLoading = false }

        let request = TextUploadRequest(
            fileURL: fileURL,
            source: "sms",
            language: "en",
            requestId: UUID().uuidString
        )

        do {
            let response = try await TextAPI.shared.uploadTextFile(request)

            resultMessage = """
            [Text Upload Result]
            success: \(response.success)
            message: \(response.message)
            file: \(response.fileName)
            text: \(response.textRequest.text)
            """
        } catch {
            resultMessage = """
            [Text Upload Error]
            \(error.localizedDescription)
            """
        }
    }

    func uploadAudioFile(fileURL: URL) async {
        isLoading = true
        defer { isLoading = false }

        do {
            let response = try await AudioAPI.shared.uploadAudio(
                fileURL: fileURL,
                language: "en",
                requestId: UUID().uuidString
            )

            resultMessage = """
            [Audio Upload Result]
            success: \(response.success)
            message: \(response.message)

            file: \(response.metadata.fileName)
            path: \(response.metadata.filePath)
            request id: \(response.metadata.requestId ?? "nil")
            language: \(response.metadata.language)

            transcript: \(response.transcription.transcript)
            confidence: \(response.transcription.confidence.map { String($0) } ?? "nil")

            analysis text: \(response.analysisInput.text)
            source: \(response.analysisInput.source)
            analysis language: \(response.analysisInput.language)
            analysis request id: \(response.analysisInput.requestId ?? "nil")
            analysis file name: \(response.analysisInput.fileName ?? "nil")
            """
        } catch {
            resultMessage = """
            [Audio Upload Error]
            \(error.localizedDescription)
            """
        }
    }

    func uploadVideoFile(fileURL: URL) async {
        isLoading = true
        defer { isLoading = false }

        let request = VideoUploadRequest(
            fileURL: fileURL,
            language: "en",
            requestId: UUID().uuidString
        )

        do {
            let response = try await VideoAPI.shared.uploadVideoFile(request)

            resultMessage = """
            [Video Upload Result]
            success: \(response.success)
            message: \(response.message)
            file: \(response.metadata.fileName)
            path: \(response.metadata.filePath)
            request id: \(response.metadata.requestId ?? "nil")
            method: \(response.extractionResult.method)
            extracted text: \(response.extractionResult.extractedText)
            analysis text: \(response.analysisInput.text ?? "nil")
            source: \(response.analysisInput.source ?? "nil")
            language: \(response.analysisInput.language ?? "nil")
            """
        } catch {
            resultMessage = """
            [Video Upload Error]
            \(error.localizedDescription)
            """
        }
    }
}
