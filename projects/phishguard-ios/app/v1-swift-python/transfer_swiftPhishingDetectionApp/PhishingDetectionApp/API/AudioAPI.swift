import Foundation

final class AudioAPI {
    static let shared = AudioAPI()

    private init() {}

    // Replace with your actual backend address when needed
    private let baseURL = "http://127.0.0.1:8000/asr"

    func uploadAudio(
        fileURL: URL,
        language: String = "en",
        requestId: String? = nil
    ) async throws -> AudioUploadResponse {
        guard let url = URL(string: "\(baseURL)/upload") else {
            throw URLError(.badURL)
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        let boundary = "Boundary-\(UUID().uuidString)"
        request.setValue(
            "multipart/form-data; boundary=\(boundary)",
            forHTTPHeaderField: "Content-Type"
        )

        let fileData = try Data(contentsOf: fileURL)
        let filename = fileURL.lastPathComponent
        let mimeType = mimeTypeForAudioFile(fileURL)

        request.httpBody = createMultipartBody(
            boundary: boundary,
            fileData: fileData,
            fileName: filename,
            mimeType: mimeType,
            language: language,
            requestId: requestId
        )

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }

        let decoder = JSONDecoder()

        if (200...299).contains(httpResponse.statusCode) {
            return try decoder.decode(AudioUploadResponse.self, from: data)
        } else {
            let errorResponse = try? decoder.decode(FastAPIErrorResponse.self, from: data)
            let message = errorResponse?.detail ?? "Unknown server error"

            throw NSError(
                domain: "AudioAPI",
                code: httpResponse.statusCode,
                userInfo: [NSLocalizedDescriptionKey: message]
            )
        }
    }

    private func createMultipartBody(
        boundary: String,
        fileData: Data,
        fileName: String,
        mimeType: String,
        language: String,
        requestId: String?
    ) -> Data {
        var body = Data()

        body.appendString("--\(boundary)\r\n")
        body.appendString("Content-Disposition: form-data; name=\"language\"\r\n\r\n")
        body.appendString("\(language)\r\n")

        if let requestId = requestId, !requestId.isEmpty {
            body.appendString("--\(boundary)\r\n")
            body.appendString("Content-Disposition: form-data; name=\"request_id\"\r\n\r\n")
            body.appendString("\(requestId)\r\n")
        }

        body.appendString("--\(boundary)\r\n")
        body.appendString("Content-Disposition: form-data; name=\"file\"; filename=\"\(fileName)\"\r\n")
        body.appendString("Content-Type: \(mimeType)\r\n\r\n")
        body.append(fileData)
        body.appendString("\r\n")

        body.appendString("--\(boundary)--\r\n")

        return body
    }

    private func mimeTypeForAudioFile(_ fileURL: URL) -> String {
        switch fileURL.pathExtension.lowercased() {
        case "mp3":
            return "audio/mpeg"
        case "wav":
            return "audio/wav"
        case "m4a":
            return "audio/x-m4a"
        case "mp4":
            return "audio/mp4"
        default:
            return "application/octet-stream"
        }
    }
}
