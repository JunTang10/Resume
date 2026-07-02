import Foundation
import Network

struct EmailMessage: Equatable {
    let sender: String
    let subject: String
    let body: String
}

enum EmailServiceError: LocalizedError {
    case connectionFailed
    case serverGreetingMissing
    case authenticationFailed(String)
    case inboxSelectionFailed(String)
    case searchFailed(String)
    case noEmailsFound
    case fetchFailed(String)
    case malformedFetchResponse
    case messageParsingFailed

    var errorDescription: String? {
        switch self {
        case .connectionFailed:
            return "Unable to connect to Gmail IMAP."
        case .serverGreetingMissing:
            return "Gmail IMAP greeting was not received."
        case .authenticationFailed(let details):
            return "Gmail authentication failed: \(details)"
        case .inboxSelectionFailed(let details):
            return "Unable to open the Gmail inbox: \(details)"
        case .searchFailed(let details):
            return "Unable to search the inbox: \(details)"
        case .noEmailsFound:
            return "No emails were found in the inbox."
        case .fetchFailed(let details):
            return "Unable to fetch the latest email: \(details)"
        case .malformedFetchResponse:
            return "The IMAP fetch response could not be parsed."
        case .messageParsingFailed:
            return "The fetched email could not be parsed."
        }
    }
}

protocol EmailFetching {
    func fetchLatestEmail() async throws -> EmailMessage
}

final class EmailService: EmailFetching {
    static let shared = EmailService()

    private let host = "imap.gmail.com"
    private let port: UInt16 = 993
    private let emailAddress: String
    private let appPassword: String
    private let parser = EmailMessageParser()

    init(
        emailAddress: String? = nil,
        appPassword: String? = nil
    ) {
        self.emailAddress = emailAddress ?? "phishguard.analysis@gmail.com"
        self.appPassword = (appPassword ?? "wshzzjcscqfjrbuc")
            .replacingOccurrences(of: " ", with: "")
    }

    func fetchLatestEmail() async throws -> EmailMessage {
        let client = SimpleIMAPClient(
            host: host,
            port: port,
            username: emailAddress,
            password: appPassword
        )

        do {
            try await client.connect()
            defer { client.cancel() }

            try await client.login()
            try await client.selectInbox()
            let latestID = try await client.fetchLatestMessageID()
            let rawMessage = try await client.fetchRawMessage(messageID: latestID)

            guard let message = parser.parse(rawMessage: rawMessage) else {
                throw EmailServiceError.messageParsingFailed
            }

            print("[EmailService] latest Gmail message loaded from sender: \(message.sender)")
            print("[EmailService] latest Gmail subject: \(message.subject)")
            return message
        } catch let error as EmailServiceError {
            print("[EmailService] fetch failed: \(error.localizedDescription)")
            throw error
        } catch {
            print("[EmailService] unexpected error: \(error.localizedDescription)")
            throw error
        }
    }
}

private final class SimpleIMAPClient {
    private let connection: NWConnection
    private let username: String
    private let password: String
    private var nextTagIndex: Int = 1
    private var receiveBuffer = Data()

    init(host: String, port: UInt16, username: String, password: String) {
        let parameters = NWParameters.tls
        parameters.allowLocalEndpointReuse = true
        self.connection = NWConnection(
            host: NWEndpoint.Host(host),
            port: NWEndpoint.Port(rawValue: port)!,
            using: parameters
        )
        self.username = username
        self.password = password
    }

    func connect() async throws {
        let stateBox = ConnectionStateBox()
        try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<Void, Error>) in
            connection.stateUpdateHandler = { state in
                switch state {
                case .ready:
                    guard stateBox.beginResume() else { return }
                    self.connection.stateUpdateHandler = nil
                    continuation.resume()
                case .failed(let error):
                    guard stateBox.beginResume() else { return }
                    self.connection.stateUpdateHandler = nil
                    continuation.resume(throwing: error)
                default:
                    break
                }
            }
            connection.start(queue: .global(qos: .userInitiated))
        }

        let greeting = try await readLine()
        guard greeting.hasPrefix("* OK") else {
            throw EmailServiceError.serverGreetingMissing
        }
    }

    func cancel() {
        connection.cancel()
    }

    func login() async throws {
        let tag = nextTag()
        let response = try await sendSimpleCommand(
            tag: tag,
            command: "LOGIN \(imapQuoted(username)) \(imapQuoted(password))"
        )
        guard response.contains(where: { $0.hasPrefix("\(tag) OK") }) else {
            throw EmailServiceError.authenticationFailed(response.joined(separator: " "))
        }
    }

    func selectInbox() async throws {
        let tag = nextTag()
        let response = try await sendSimpleCommand(tag: tag, command: "SELECT INBOX")
        guard response.contains(where: { $0.hasPrefix("\(tag) OK") }) else {
            throw EmailServiceError.inboxSelectionFailed(response.joined(separator: " "))
        }
    }

    func fetchLatestMessageID() async throws -> String {
        let tag = nextTag()
        let response = try await sendSimpleCommand(tag: tag, command: "SEARCH ALL")
        guard response.contains(where: { $0.hasPrefix("\(tag) OK") }) else {
            throw EmailServiceError.searchFailed(response.joined(separator: " "))
        }

        guard let searchLine = response.first(where: { $0.hasPrefix("* SEARCH") }) else {
            throw EmailServiceError.noEmailsFound
        }

        let ids = searchLine
            .replacingOccurrences(of: "* SEARCH", with: "")
            .split(separator: " ")
            .map(String.init)

        guard let latestID = ids.last, !latestID.isEmpty else {
            throw EmailServiceError.noEmailsFound
        }

        return latestID
    }

    func fetchRawMessage(messageID: String) async throws -> String {
        let tag = nextTag()
        try await send("\(tag) FETCH \(messageID) BODY.PEEK[]\r\n")

        var literalSize: Int?
        while literalSize == nil {
            let line = try await readLine()
            if let size = parseLiteralLength(from: line) {
                literalSize = size
                break
            }
            if line.hasPrefix("\(tag) ") {
                throw EmailServiceError.fetchFailed(line)
            }
        }

        guard let expectedBytes = literalSize else {
            throw EmailServiceError.malformedFetchResponse
        }

        let literalData = try await readExact(count: expectedBytes)
        let trailingResponse = try await readTaggedCompletion(tag: tag)
        guard trailingResponse.contains(where: { $0.hasPrefix("\(tag) OK") }) else {
            throw EmailServiceError.fetchFailed(trailingResponse.joined(separator: " "))
        }

        return String(data: literalData, encoding: .utf8)
            ?? String(data: literalData, encoding: .isoLatin1)
            ?? ""
    }

    private func sendSimpleCommand(tag: String, command: String) async throws -> [String] {
        try await send("\(tag) \(command)\r\n")
        return try await readTaggedCompletion(tag: tag)
    }

    private func send(_ command: String) async throws {
        let data = Data(command.utf8)
        try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<Void, Error>) in
            connection.send(content: data, completion: .contentProcessed { error in
                if let error {
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume()
                }
            })
        }
    }

    private func readTaggedCompletion(tag: String) async throws -> [String] {
        var lines: [String] = []
        while true {
            let line = try await readLine()
            lines.append(line)
            if line.hasPrefix("\(tag) ") {
                return lines
            }
        }
    }

    private func readLine() async throws -> String {
        let delimiter = Data("\r\n".utf8)
        while true {
            if let range = receiveBuffer.range(of: delimiter) {
                let lineData = receiveBuffer.subdata(in: receiveBuffer.startIndex..<range.lowerBound)
                receiveBuffer.removeSubrange(receiveBuffer.startIndex..<range.upperBound)
                return String(data: lineData, encoding: .utf8)
                    ?? String(data: lineData, encoding: .isoLatin1)
                    ?? ""
            }
            try await receiveMore()
        }
    }

    private func readExact(count: Int) async throws -> Data {
        while receiveBuffer.count < count {
            try await receiveMore()
        }

        let data = receiveBuffer.prefix(count)
        receiveBuffer.removeFirst(count)
        return Data(data)
    }

    private func receiveMore() async throws {
        let data = try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<Data, Error>) in
            connection.receive(minimumIncompleteLength: 1, maximumLength: 65536) { data, _, isComplete, error in
                if let error {
                    continuation.resume(throwing: error)
                    return
                }
                if let data, !data.isEmpty {
                    continuation.resume(returning: data)
                    return
                }
                if isComplete {
                    continuation.resume(throwing: EmailServiceError.connectionFailed)
                    return
                }
                continuation.resume(throwing: EmailServiceError.connectionFailed)
            }
        }
        receiveBuffer.append(data)
    }

    private func parseLiteralLength(from line: String) -> Int? {
        guard let openBrace = line.lastIndex(of: "{"),
              let closeBrace = line.lastIndex(of: "}"),
              openBrace < closeBrace else {
            return nil
        }

        let numberText = line[line.index(after: openBrace)..<closeBrace]
        return Int(numberText)
    }

    private func nextTag() -> String {
        defer { nextTagIndex += 1 }
        return String(format: "A%03d", nextTagIndex)
    }

    private func imapQuoted(_ value: String) -> String {
        let escaped = value
            .replacingOccurrences(of: "\\", with: "\\\\")
            .replacingOccurrences(of: "\"", with: "\\\"")
        return "\"\(escaped)\""
    }
}

private final class ConnectionStateBox: @unchecked Sendable {
    private let lock = NSLock()
    private var didResume = false

    nonisolated(unsafe) func beginResume() -> Bool {
        lock.lock()
        defer { lock.unlock() }
        guard !didResume else { return false }
        didResume = true
        return true
    }
}

private struct EmailMessageParser {
    func parse(rawMessage: String) -> EmailMessage? {
        let sections = splitHeaderAndBody(rawMessage)
        let headers = parseHeaders(sections.headers)
        let sender = decodeHeader(headers["From"] ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
        let subject = decodeHeader(headers["Subject"] ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
        let body = bestBody(headers: headers, body: sections.body)
            .trimmingCharacters(in: .whitespacesAndNewlines)

        guard !sender.isEmpty || !subject.isEmpty || !body.isEmpty else {
            return nil
        }

        return EmailMessage(
            sender: sender.isEmpty ? "unknown sender" : sender,
            subject: subject,
            body: body
        )
    }

    private func splitHeaderAndBody(_ raw: String) -> (headers: String, body: String) {
        if let range = raw.range(of: "\r\n\r\n") {
            return (String(raw[..<range.lowerBound]), String(raw[range.upperBound...]))
        }
        if let range = raw.range(of: "\n\n") {
            return (String(raw[..<range.lowerBound]), String(raw[range.upperBound...]))
        }
        return (raw, "")
    }

    private func parseHeaders(_ text: String) -> [String: String] {
        let unfolded = text
            .replacingOccurrences(of: "\r\n\t", with: " ")
            .replacingOccurrences(of: "\r\n ", with: " ")
            .replacingOccurrences(of: "\n\t", with: " ")
            .replacingOccurrences(of: "\n ", with: " ")

        var headers: [String: String] = [:]
        for line in unfolded.split(whereSeparator: \.isNewline) {
            guard let separator = line.firstIndex(of: ":") else { continue }
            let key = String(line[..<separator])
            let value = String(line[line.index(after: separator)...]).trimmingCharacters(in: .whitespacesAndNewlines)
            headers[key] = value
        }
        return headers
    }

    private func bestBody(headers: [String: String], body: String) -> String {
        let contentType = (headers["Content-Type"] ?? "").lowercased()
        if contentType.contains("multipart/"),
           let boundary = extractBoundary(from: headers["Content-Type"] ?? "") {
            let parts = multipartSections(body: body, boundary: boundary)
            let parsedParts = parts.compactMap(parseMultipartPart)

            if let plain = parsedParts.first(where: { $0.contentType.contains("text/plain") && !$0.content.isEmpty }) {
                return plain.content
            }
            if let html = parsedParts.first(where: { $0.contentType.contains("text/html") && !$0.content.isEmpty }) {
                return stripHTML(html.content)
            }
        }

        let decoded = decodeContent(
            body,
            transferEncoding: headers["Content-Transfer-Encoding"],
            contentType: headers["Content-Type"]
        )
        return contentType.contains("text/html") ? stripHTML(decoded) : decoded
    }

    private func extractBoundary(from contentType: String) -> String? {
        guard let boundaryRange = contentType.range(of: "boundary=", options: [.caseInsensitive]) else {
            return nil
        }
        let value = contentType[boundaryRange.upperBound...]
            .trimmingCharacters(in: .whitespacesAndNewlines)
        if let quote = value.first, quote == "\"" {
            let trimmed = value.dropFirst()
            if let end = trimmed.firstIndex(of: "\"") {
                return String(trimmed[..<end])
            }
        }
        return value.split(separator: ";").first.map(String.init)
    }

    private func multipartSections(body: String, boundary: String) -> [String] {
        let marker = "--\(boundary)"
        return body
            .components(separatedBy: marker)
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty && $0 != "--" }
    }

    private func parseMultipartPart(_ rawPart: String) -> (contentType: String, content: String)? {
        let sections = splitHeaderAndBody(rawPart)
        let headers = parseHeaders(sections.headers)
        let contentType = (headers["Content-Type"] ?? "text/plain").lowercased()
        let content = decodeContent(
            sections.body,
            transferEncoding: headers["Content-Transfer-Encoding"],
            contentType: headers["Content-Type"]
        )
        return (contentType: contentType, content: content)
    }

    private func decodeContent(_ body: String, transferEncoding: String?, contentType: String?) -> String {
        let encoding = (transferEncoding ?? "").lowercased()
        let charset = extractCharset(from: contentType)

        if encoding.contains("base64") {
            let compact = body
                .components(separatedBy: .whitespacesAndNewlines)
                .joined()
            if let data = Data(base64Encoded: compact) {
                return decodeText(data: data, charset: charset)
            }
        }

        if encoding.contains("quoted-printable") {
            let decodedBytes = decodeQuotedPrintable(body)
            return decodeText(data: Data(decodedBytes), charset: charset)
        }

        return decodeText(data: Data(body.utf8), charset: charset)
    }

    private func extractCharset(from contentType: String?) -> String? {
        guard let contentType else { return nil }
        guard let range = contentType.range(of: "charset=", options: [.caseInsensitive]) else {
            return nil
        }
        let value = contentType[range.upperBound...]
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .split(separator: ";")
            .first?
            .trimmingCharacters(in: CharacterSet(charactersIn: "\""))
        return value
    }

    private func decodeText(data: Data, charset: String?) -> String {
        let normalizedCharset = charset?.lowercased() ?? "utf-8"
        if normalizedCharset.contains("utf-8"), let string = String(data: data, encoding: .utf8) {
            return string
        }
        if normalizedCharset.contains("iso-8859-1") || normalizedCharset.contains("latin1"),
           let string = String(data: data, encoding: .isoLatin1) {
            return string
        }
        if let string = String(data: data, encoding: .utf8) {
            return string
        }
        return String(decoding: data, as: UTF8.self)
    }

    private func decodeQuotedPrintable(_ text: String) -> [UInt8] {
        let normalized = text
            .replacingOccurrences(of: "=\r\n", with: "")
            .replacingOccurrences(of: "=\n", with: "")

        var bytes: [UInt8] = []
        let scalars = Array(normalized.unicodeScalars)
        var index = 0

        while index < scalars.count {
            let scalar = scalars[index]
            if scalar == "=",
               index + 2 < scalars.count,
               let value = UInt8(String(String.UnicodeScalarView([scalars[index + 1], scalars[index + 2]])), radix: 16) {
                bytes.append(value)
                index += 3
            } else {
                bytes.append(UInt8(scalar.value))
                index += 1
            }
        }

        return bytes
    }

    private func stripHTML(_ html: String) -> String {
        let noTags = html.replacingOccurrences(
            of: "<[^>]+>",
            with: " ",
            options: .regularExpression
        )
        return noTags
            .replacingOccurrences(of: "\\s+", with: " ", options: .regularExpression)
            .trimmingCharacters(in: .whitespacesAndNewlines)
    }

    private func decodeHeader(_ value: String) -> String {
        guard value.contains("=?") else { return value }

        let pattern = #"=\?([^?]+)\?([bBqQ])\?([^?]+)\?="#
        guard let regex = try? NSRegularExpression(pattern: pattern) else {
            return value
        }

        let nsRange = NSRange(value.startIndex..<value.endIndex, in: value)
        let matches = regex.matches(in: value, range: nsRange)
        guard !matches.isEmpty else { return value }

        var decoded = value
        for match in matches.reversed() {
            guard match.numberOfRanges == 4,
                  let wholeRange = Range(match.range(at: 0), in: value),
                  let charsetRange = Range(match.range(at: 1), in: value),
                  let encodingRange = Range(match.range(at: 2), in: value),
                  let encodedTextRange = Range(match.range(at: 3), in: value) else {
                continue
            }

            let charset = String(value[charsetRange]).lowercased()
            let encoding = String(value[encodingRange]).lowercased()
            let encodedText = String(value[encodedTextRange])
            let replacement: String

            if encoding == "b",
               let data = Data(base64Encoded: encodedText) {
                replacement = decodeText(data: data, charset: charset)
            } else if encoding == "q" {
                let qpSource = encodedText.replacingOccurrences(of: "_", with: " ")
                let data = Data(decodeQuotedPrintable(qpSource))
                replacement = decodeText(data: data, charset: charset)
            } else {
                replacement = String(value[wholeRange])
            }

            decoded.replaceSubrange(wholeRange, with: replacement)
        }

        return decoded
    }
}
