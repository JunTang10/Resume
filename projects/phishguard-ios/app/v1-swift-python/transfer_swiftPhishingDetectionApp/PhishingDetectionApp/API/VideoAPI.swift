//
//  VideoAPI.swift
//  PhishingDetectionApp
//
//  Created by tangjun on 6/4/2026.
//

import Foundation

final class VideoAPI {
    static let shared = VideoAPI()
    private init() {}

    private let baseURL = "http://127.0.0.1:8000"

    func uploadVideoFile(_ requestModel: VideoUploadRequest) async throws -> VideoUploadResponse {
        guard let url = URL(string: "\(baseURL)/video/upload") else {
            throw URLError(.badURL)
        }

        let boundary = UUID().uuidString

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")

        let fileData = try Data(contentsOf: requestModel.fileURL)
        let filename = requestModel.fileURL.lastPathComponent
        let mimeType = mimeTypeForVideo(filename: filename)

        var body = Data()

        // language
        body.appendString("--\(boundary)\r\n")
        body.appendString("Content-Disposition: form-data; name=\"language\"\r\n\r\n")
        body.appendString("\(requestModel.language)\r\n")

        // request_id
        if let requestId = requestModel.requestId, !requestId.isEmpty {
            body.appendString("--\(boundary)\r\n")
            body.appendString("Content-Disposition: form-data; name=\"request_id\"\r\n\r\n")
            body.appendString("\(requestId)\r\n")
        }

        // file
        body.appendString("--\(boundary)\r\n")
        body.appendString("Content-Disposition: form-data; name=\"file\"; filename=\"\(filename)\"\r\n")
        body.appendString("Content-Type: \(mimeType)\r\n\r\n")
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
                throw NSError(
                    domain: "VideoUploadError",
                    code: httpResponse.statusCode,
                    userInfo: [NSLocalizedDescriptionKey: apiError.detail]
                )
            } else {
                let raw = String(data: data, encoding: .utf8) ?? "Unknown server error"
                throw NSError(
                    domain: "VideoUploadError",
                    code: httpResponse.statusCode,
                    userInfo: [NSLocalizedDescriptionKey: raw]
                )
            }
        }

        do {
            return try JSONDecoder().decode(VideoUploadResponse.self, from: data)
        } catch {
            let raw = String(data: data, encoding: .utf8) ?? "Unable to decode response"
            throw NSError(
                domain: "VideoDecodeError",
                code: -1,
                userInfo: [NSLocalizedDescriptionKey: "Response decode failed: \(raw)"]
            )
        }
    }

    private func mimeTypeForVideo(filename: String) -> String {
        let lower = filename.lowercased()

        if lower.hasSuffix(".mp4") {
            return "video/mp4"
        } else if lower.hasSuffix(".mov") {
            return "video/quicktime"
        } else if lower.hasSuffix(".avi") {
            return "video/x-msvideo"
        } else if lower.hasSuffix(".mkv") {
            return "video/x-matroska"
        } else {
            return "application/octet-stream"
        }
    }
}
