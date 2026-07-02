import Foundation
import Speech

final class AudioService {
    func transcribeAudio(from url: URL) async throws -> TranscriptionResult {
        guard FileManager.default.fileExists(atPath: url.path) else {
            throw NSError(
                domain: "AudioService",
                code: 1001,
                userInfo: [NSLocalizedDescriptionKey: "Audio file does not exist at path: \(url.path)"]
            )
        }

        print("[AudioService] audio file url: \(url.path)")
        let authorizationStatus = await requestSpeechRecognitionAuthorization()
        print("[AudioService] speech recognition permission: \(authorizationStatus.logLabel)")

        guard authorizationStatus == .authorized else {
            throw NSError(
                domain: "AudioService",
                code: 1002,
                userInfo: [NSLocalizedDescriptionKey: speechPermissionMessage(for: authorizationStatus)]
            )
        }

        let recognizer = SFSpeechRecognizer(locale: Locale.current) ?? SFSpeechRecognizer(locale: Locale(identifier: "en_US"))
        guard let recognizer else {
            throw NSError(
                domain: "AudioService",
                code: 1003,
                userInfo: [NSLocalizedDescriptionKey: "Speech recognizer is unavailable for the current locale."]
            )
        }

        guard recognizer.isAvailable else {
            throw NSError(
                domain: "AudioService",
                code: 1004,
                userInfo: [NSLocalizedDescriptionKey: "Speech recognizer is currently unavailable."]
            )
        }

        let start = Date()
        let request = SFSpeechURLRecognitionRequest(url: url)
        request.shouldReportPartialResults = false

        let result = try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<SFSpeechRecognitionResult, Error>) in
            var didResume = false
            let task = recognizer.recognitionTask(with: request) { recognitionResult, error in
                if let error, !didResume {
                    didResume = true
                    continuation.resume(throwing: error)
                    return
                }

                guard let recognitionResult else { return }
                guard recognitionResult.isFinal, !didResume else { return }

                didResume = true
                continuation.resume(returning: recognitionResult)
            }

            if Task.isCancelled, !didResume {
                didResume = true
                task.cancel()
                continuation.resume(throwing: CancellationError())
            }
        }

        let transcript = result.bestTranscription.formattedString.trimmingCharacters(in: .whitespacesAndNewlines)
        print("[AudioService] transcription result: \(transcript)")

        return TranscriptionResult(
            text: transcript,
            source: "speech_framework_asr",
            success: !transcript.isEmpty,
            message: transcript.isEmpty ? "Speech recognition completed but returned empty text." : "Speech recognition completed successfully.",
            requestId: UUID().uuidString,
            confidence: nil,
            processingTimeMs: max(1, Int(Date().timeIntervalSince(start) * 1000))
        )
    }

    private func requestSpeechRecognitionAuthorization() async -> SFSpeechRecognizerAuthorizationStatus {
        let currentStatus = SFSpeechRecognizer.authorizationStatus()
        if currentStatus != .notDetermined {
            return currentStatus
        }

        return await withCheckedContinuation { continuation in
            SFSpeechRecognizer.requestAuthorization { status in
                continuation.resume(returning: status)
            }
        }
    }

    private func speechPermissionMessage(for status: SFSpeechRecognizerAuthorizationStatus) -> String {
        switch status {
        case .denied:
            return "Speech recognition permission was denied."
        case .restricted:
            return "Speech recognition is restricted on this device."
        case .notDetermined:
            return "Speech recognition permission has not been granted yet."
        case .authorized:
            return "Speech recognition permission granted."
        @unknown default:
            return "Speech recognition permission is unavailable."
        }
    }
}

private extension SFSpeechRecognizerAuthorizationStatus {
    var logLabel: String {
        switch self {
        case .authorized:
            return "granted"
        case .denied:
            return "denied"
        case .restricted:
            return "restricted"
        case .notDetermined:
            return "not_determined"
        @unknown default:
            return "unknown"
        }
    }
}
