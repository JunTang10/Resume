import Foundation
@preconcurrency import AVFoundation
import Vision

final class VideoService {
    private let audioService = AudioService()
    private let ocrFrameIntervalSeconds: Double = 2.0
    private let maxOCRFrames = 6

    func extractAudio(from videoURL: URL) async throws -> URL {
        guard FileManager.default.fileExists(atPath: videoURL.path) else {
            throw NSError(
                domain: "VideoService",
                code: 1001,
                userInfo: [NSLocalizedDescriptionKey: "Video file does not exist at path: \(videoURL.path)"]
            )
        }

        let asset = AVURLAsset(url: videoURL)

        guard let exportSession = AVAssetExportSession(
            asset: asset,
            presetName: AVAssetExportPresetAppleM4A
        ) else {
            throw NSError(
                domain: "VideoService",
                code: 1002,
                userInfo: [NSLocalizedDescriptionKey: "Failed to create export session."]
            )
        }

        let outputURL = FileManager.default.temporaryDirectory
            .appendingPathComponent(UUID().uuidString)
            .appendingPathExtension("m4a")

        if FileManager.default.fileExists(atPath: outputURL.path) {
            try FileManager.default.removeItem(at: outputURL)
        }

        exportSession.outputURL = outputURL
        exportSession.outputFileType = .m4a

        try await withCheckedThrowingContinuation { continuation in
            exportSession.exportAsynchronously {
                switch exportSession.status {
                case .completed:
                    continuation.resume()
                case .failed:
                    continuation.resume(throwing: exportSession.error ?? NSError(
                        domain: "VideoService",
                        code: 1003,
                        userInfo: [NSLocalizedDescriptionKey: "Audio export failed."]
                    ))
                case .cancelled:
                    continuation.resume(throwing: NSError(
                        domain: "VideoService",
                        code: 1004,
                        userInfo: [NSLocalizedDescriptionKey: "Audio export was cancelled."]
                    ))
                default:
                    continuation.resume(throwing: NSError(
                        domain: "VideoService",
                        code: 1005,
                        userInfo: [NSLocalizedDescriptionKey: "Audio export ended in unexpected state: \(exportSession.status.rawValue)"]
                    ))
                }
            }
        }

        guard FileManager.default.fileExists(atPath: outputURL.path) else {
            throw NSError(
                domain: "VideoService",
                code: 1006,
                userInfo: [NSLocalizedDescriptionKey: "Export completed but output audio file was not found."]
            )
        }

        return outputURL
    }

    func transcribeVideo(from videoURL: URL) async throws -> VideoTextResult {
        async let speechText = extractSpeechText(from: videoURL)
        async let ocrText = extractOCRText(from: videoURL)

        let extractedSpeechText = await speechText
        let extractedOCRText = await ocrText
        let mergedText = mergeVideoText(asrText: extractedSpeechText, ocrText: extractedOCRText)

        guard !mergedText.isEmpty else {
            throw NSError(
                domain: "VideoService",
                code: 1007,
                userInfo: [NSLocalizedDescriptionKey: "No readable ASR or OCR text was extracted from the selected video."]
            )
        }

        return VideoTextResult(
            speechText: extractedSpeechText,
            ocrText: extractedOCRText,
            mergedText: mergedText,
            sourceSummary: sourceSummary(asrText: extractedSpeechText, ocrText: extractedOCRText)
        )
    }

    private func extractSpeechText(from videoURL: URL) async -> String {
        do {
            let audioURL = try await extractAudio(from: videoURL)
            defer { try? FileManager.default.removeItem(at: audioURL) }
            let audioResult = try await audioService.transcribeAudio(from: audioURL)
            let transcript = audioResult.text.trimmingCharacters(in: .whitespacesAndNewlines)
            if transcript.isEmpty {
                print("[VideoService] ASR completed but returned empty text.")
            } else {
                print("[VideoService] ASR extracted \(transcript.count) characters from video audio.")
            }
            return transcript
        } catch {
            print("[VideoService] ASR extraction unavailable: \(error.localizedDescription)")
            return ""
        }
    }

    private func extractOCRText(from videoURL: URL) async -> String {
        let asset = AVURLAsset(url: videoURL)
        let duration: CMTime
        do {
            duration = try await asset.load(.duration)
        } catch {
            print("[VideoService] OCR skipped because video duration could not be loaded: \(error.localizedDescription)")
            return ""
        }
        let durationSeconds = CMTimeGetSeconds(duration)
        guard durationSeconds.isFinite, durationSeconds > 0 else {
            print("[VideoService] OCR skipped because video duration is unavailable.")
            return ""
        }

        let generator = AVAssetImageGenerator(asset: asset)
        generator.appliesPreferredTrackTransform = true
        generator.requestedTimeToleranceBefore = .zero
        generator.requestedTimeToleranceAfter = .zero

        let captureTimes = frameCaptureTimes(durationSeconds: durationSeconds)
        guard !captureTimes.isEmpty else {
            print("[VideoService] OCR skipped because no capture times were produced.")
            return ""
        }

        var collectedLines: [String] = []
        var seenLines = Set<String>()

        for captureTime in captureTimes {
            do {
                let cgImage = try generator.copyCGImage(at: captureTime, actualTime: nil)
                let recognizedLines = try recognizeText(in: cgImage)
                for line in recognizedLines {
                    let normalizedLine = line.trimmingCharacters(in: .whitespacesAndNewlines)
                    guard !normalizedLine.isEmpty, !seenLines.contains(normalizedLine) else { continue }
                    seenLines.insert(normalizedLine)
                    collectedLines.append(normalizedLine)
                }
            } catch {
                print("[VideoService] OCR frame extraction failed at \(CMTimeGetSeconds(captureTime))s: \(error.localizedDescription)")
            }
        }

        let text = collectedLines.joined(separator: "\n")
        if text.isEmpty {
            print("[VideoService] OCR finished with no recognized text. TODO: tune sampling and request parameters if more coverage is needed.")
        } else {
            print("[VideoService] OCR extracted \(text.count) characters from \(captureTimes.count) sampled frames.")
        }

        return text
    }

    private func frameCaptureTimes(durationSeconds: Double) -> [CMTime] {
        stride(from: 0.0, through: durationSeconds, by: ocrFrameIntervalSeconds)
            .prefix(maxOCRFrames)
            .map { CMTime(seconds: $0, preferredTimescale: 600) }
    }

    private func recognizeText(in image: CGImage) throws -> [String] {
        let request = VNRecognizeTextRequest()
        request.recognitionLevel = .accurate
        request.usesLanguageCorrection = true

        let handler = VNImageRequestHandler(cgImage: image, options: [:])
        try handler.perform([request])

        let observations = request.results ?? []
        return observations.compactMap { $0.topCandidates(1).first?.string }
    }

    private func mergeVideoText(asrText: String, ocrText: String) -> String {
        let asr = asrText.trimmingCharacters(in: .whitespacesAndNewlines)
        let ocr = ocrText.trimmingCharacters(in: .whitespacesAndNewlines)

        if !asr.isEmpty && !ocr.isEmpty {
            return "ASR:\n\(asr)\n\nOCR:\n\(ocr)"
        }

        if !asr.isEmpty {
            return asr
        }

        return ocr
    }

    private func sourceSummary(asrText: String, ocrText: String) -> String {
        let hasASR = !asrText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        let hasOCR = !ocrText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty

        switch (hasASR, hasOCR) {
        case (true, true):
            return "OCR + ASR merged"
        case (true, false):
            return "ASR"
        case (false, true):
            return "OCR"
        case (false, false):
            return "No text extracted"
        }
    }
}
