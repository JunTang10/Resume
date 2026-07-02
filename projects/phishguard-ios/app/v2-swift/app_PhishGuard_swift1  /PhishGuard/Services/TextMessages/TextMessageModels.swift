import Foundation

struct TextMessageCaptureResult: Codable, Equatable, Identifiable {
    let id: UUID
    let sender: String
    let messageBody: String
    let receivedAt: Date

    init(
        id: UUID = UUID(),
        sender: String,
        messageBody: String,
        receivedAt: Date = Date()
    ) {
        self.id = id
        self.sender = sender
        self.messageBody = messageBody
        self.receivedAt = receivedAt
    }
}
