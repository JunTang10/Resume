import Foundation

enum TextMessageSharedStore {
    // App Group 的唯一标识符。
    // 主 App target 和 Message Filter Extension target 必须在 Signing & Capabilities 中启用同一个 App Group。
    // 这里的字符串必须和 Xcode 里的 App Group 完全一致。
    static let appGroupIdentifier = "group.com.juntang.phishguard2026"

    private static let latestCaptureFilename = "latest_text_message_capture.json"
    private static let fileLock = NSLock()

    // 获取 App Group 共享容器中的 JSON 文件 URL。
    // 主 App 和 Extension 都通过同一个容器路径读写这份文件。
    private static func latestCaptureFileURL() -> URL? {
        guard let containerURL = FileManager.default.containerURL(
            forSecurityApplicationGroupIdentifier: appGroupIdentifier
        ) else {
            NSLog("[TextMessageSharedStore] failed to resolve App Group container URL for %@", appGroupIdentifier)
            return nil
        }

        NSLog("[TextMessageSharedStore] resolved App Group container URL: %@", containerURL.path)
        return containerURL.appendingPathComponent(latestCaptureFilename, isDirectory: false)
    }

    static func canOpenSharedStore() -> Bool {
        latestCaptureFileURL() != nil
    }

    // 保存最新捕获到的短信内容。
    // 通常由 Message Filter Extension 调用，也可以由 Debug 测试按钮调用。
    static func saveLatestCapture(_ result: TextMessageCaptureResult) {
        guard let fileURL = latestCaptureFileURL() else { return }

        fileLock.lock()
        defer { fileLock.unlock() }

        NSLog("[TextMessageSharedStore] saveLatestCapture started for sender: %@", result.sender)
        do {
            let data = try JSONEncoder().encode(result)
            try data.write(to: fileURL, options: .atomic)
            NSLog("[TextMessageSharedStore] saveLatestCapture succeeded at path: %@", fileURL.path)
        } catch {
            NSLog("[TextMessageSharedStore] saveLatestCapture failed: %@", error.localizedDescription)
        }
    }

    // 读取最新捕获到的短信内容。
    // 主 App 会调用这个方法，把短信内容填充到 Analyze 页面。
    static func loadLatestCapture() -> TextMessageCaptureResult? {
        guard let fileURL = latestCaptureFileURL() else { return nil }

        fileLock.lock()
        defer { fileLock.unlock() }

        NSLog("[TextMessageSharedStore] loadLatestCapture started")

        guard FileManager.default.fileExists(atPath: fileURL.path) else {
            NSLog("[TextMessageSharedStore] latest_text_message_capture.json does not exist")
            return nil
        }

        do {
            let data = try Data(contentsOf: fileURL)
            let result = try JSONDecoder().decode(TextMessageCaptureResult.self, from: data)
            NSLog("[TextMessageSharedStore] loadLatestCapture succeeded for sender: %@", result.sender)
            return result
        } catch {
            NSLog("[TextMessageSharedStore] loadLatestCapture failed: %@", error.localizedDescription)
            return nil
        }
    }

    // 清除当前保存的最新短信捕获结果。
    // 主要用于 Debug 测试，避免旧短信残留影响下一次测试。
    static func clearLatestCapture() {
        guard let fileURL = latestCaptureFileURL() else { return }

        fileLock.lock()
        defer { fileLock.unlock() }

        do {
            if FileManager.default.fileExists(atPath: fileURL.path) {
                try FileManager.default.removeItem(at: fileURL)
            }
            NSLog("[TextMessageSharedStore] clearLatestCapture succeeded")
        } catch {
            NSLog("[TextMessageSharedStore] clearLatestCapture failed: %@", error.localizedDescription)
        }
    }
}
