
import Foundation

struct FastAPIErrorResponse: Codable {
    let detail: String
}



extension Data {
    mutating func appendString(_ string: String) {
        if let data = string.data(using: .utf8) {
            append(data)
        }
    }
}
