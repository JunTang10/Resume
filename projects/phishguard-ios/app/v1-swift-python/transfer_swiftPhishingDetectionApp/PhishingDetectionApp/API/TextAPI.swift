//
//  Untitled.swift
//  PhishingDetectionApp
//
//  Created by tangjun on 5/4/2026.
//

import Foundation

final class TextAPI {
    static let shared = TextAPI()
    private init() {}

    private let baseURL = "http://127.0.0.1:8000"

    func uploadTextFile(_ requestModel: TextUploadRequest) async throws -> TextUploadResponse {
        guard let url = URL(string: "\(baseURL)/text/upload") else {
            throw URLError(.badURL)
        }

        let boundary = UUID().uuidString

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")

        let fileData = try Data(contentsOf: requestModel.fileURL)
        let filename = requestModel.fileURL.lastPathComponent

        var body = Data()

        // source
        body.appendString("--\(boundary)\r\n")
        body.appendString("Content-Disposition: form-data; name=\"source\"\r\n\r\n")
        body.appendString("\(requestModel.source)\r\n")

        // language
        body.appendString("--\(boundary)\r\n")
        body.appendString("Content-Disposition: form-data; name=\"language\"\r\n\r\n")
        body.appendString("\(requestModel.language)\r\n")

        // request_id
        if let requestId = requestModel.requestId {
            body.appendString("--\(boundary)\r\n")
            body.appendString("Content-Disposition: form-data; name=\"request_id\"\r\n\r\n")
            body.appendString("\(requestId)\r\n")
        }

        // file
        body.appendString("--\(boundary)\r\n")
        body.appendString("Content-Disposition: form-data; name=\"file\"; filename=\"\(filename)\"\r\n")
        body.appendString("Content-Type: text/plain\r\n\r\n")
        body.append(fileData)
        body.appendString("\r\n")

        body.appendString("--\(boundary)--\r\n")

        request.httpBody = body

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }

        if !(200...299).contains(httpResponse.statusCode) {
            if let apiError = try? JSONDecoder().decode(FastAPIErrorResponse.self, from: data) {
                throw NSError(domain: "APIError", code: httpResponse.statusCode, userInfo: [
                    NSLocalizedDescriptionKey: apiError.detail
                ])
            }
            throw NSError(domain: "APIError", code: httpResponse.statusCode, userInfo: [
                NSLocalizedDescriptionKey: String(data: data, encoding: .utf8) ?? "Unknown error"
            ])
        }

        return try JSONDecoder().decode(TextUploadResponse.self, from: data)
    }
}

