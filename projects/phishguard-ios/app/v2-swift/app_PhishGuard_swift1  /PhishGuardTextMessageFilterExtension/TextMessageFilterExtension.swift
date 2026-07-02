import Foundation
import IdentityLookup

@objc(TextMessageFilterExtension)
final class TextMessageFilterExtension: ILMessageFilterExtension {
    override init() {
        NSLog("[TextMessageFilterExtension] init reached")
        super.init()
        NSLog("[TextMessageFilterExtension] initialized")
    }
}

extension TextMessageFilterExtension: ILMessageFilterQueryHandling {
    func handle(
        _ queryRequest: ILMessageFilterQueryRequest,
        context: ILMessageFilterExtensionContext,
        completion: @escaping (ILMessageFilterQueryResponse) -> Void
    ) {
        NSLog("[TextMessageFilterExtension] handle called")

        let sender = queryRequest.sender ?? ""
        let messageBody = queryRequest.messageBody ?? ""

        NSLog("[TextMessageFilterExtension] received message from: %@", sender)
        NSLog("[TextMessageFilterExtension] sender length: %ld", sender.count)
        NSLog("[TextMessageFilterExtension] body length: %ld", messageBody.count)

        if !sender.isEmpty || !messageBody.isEmpty {
            NSLog("[TextMessageFilterExtension] preparing to save capture to shared store")
            let result = TextMessageCaptureResult(
                sender: sender,
                messageBody: messageBody,
                receivedAt: Date()
            )
            TextMessageSharedStore.saveLatestCapture(result)
            NSLog("[TextMessageFilterExtension] saved to shared store")
        } else {
            NSLog("[TextMessageFilterExtension] empty sender and body, skipped saving")
        }

        let response = ILMessageFilterQueryResponse()
        response.action = .allow
        NSLog("[TextMessageFilterExtension] completing response with action allow")
        completion(response)
    }
}
