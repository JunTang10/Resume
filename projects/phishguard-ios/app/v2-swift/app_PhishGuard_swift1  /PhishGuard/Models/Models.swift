//负责数据长什么样
import Foundation
import SwiftUI
// MARK: - Risk Score
//风险等级:enum就是一个选项列表，相当于规定了风险,codable的意思是这个数据可以转成JSON发给后端，也可以从JSON读回来
enum RiskLevel: String, Codable {
    case safe = "SAFE"
    case low = "LOW"
    case medium = "MEDIUM"
    case high = "HIGH"
    case critical = "CRITICAL"

    var color: Color {
        switch self {
        case .safe:     return Color(hex: "#30D158")
        case .low:      return Color(hex: "#34C759")
        case .medium:   return Color(hex: "#FF9F0A")
        case .high:     return Color(hex: "#FF6B35")
        case .critical: return Color(hex: "#FF453A")
        }
    }

    var label: String { rawValue }

    var threshold: Double {
        switch self {
        case .safe:     return 0.0
        case .low:      return 1.0
        case .medium:   return 3.0
        case .high:     return 7.0
        case .critical: return 8.5
        }
    }

    var isFlagged: Bool {
        self == .medium || self == .high || self == .critical
    }

    var isBlocked: Bool {
        self == .critical
    }

    static func normalizedScore(_ score: Double) -> Double {
        min(10.0, max(0.0, score))
    }

    static func level(for score: Double) -> RiskLevel {
        let normalized = normalizedScore(score)
        if normalized >= 8.5 {
            return .critical
        }
        if normalized >= 7.0 {
            return .high
        }
        if normalized >= 3.0 {
            return .medium
        }
        if normalized >= 1.0 {
            return .low
        }
        return .safe
    }

    static func verdict(for score: Double) -> String {
        let level = level(for: score)
        switch level {
        case .safe, .low:
            return "safe"
        case .medium:
            return "suspicious"
        case .high, .critical:
            return "phishing"
        }
    }

    init(score: Double, verdict: String) {
        self = RiskLevel.level(for: score)
    }
}

struct RiskScore: Codable, Identifiable {
    let id: UUID
    var score: Double          // 0.0 – 10.0
    var level: RiskLevel
    var confidence: Double     // 0.0 – 1.0 可能性
    var reasoning: String?      //可选解释
    var indicators: [String]
    var verdict: String?
    var tierUsed: Int?
    var processingTimeMs: Int?
    var timestamp: Date         //数据模态
    var modality: ModalityType

    init(score: Double, level: RiskLevel, confidence: Double,
         reasoning: String? = nil,
         indicators: [String] = [],
         verdict: String? = nil,
         tierUsed: Int? = nil,
         processingTimeMs: Int? = nil,
         modality: ModalityType) {
        self.id = UUID()
        self.score = score
        self.level = level
        self.confidence = confidence
        self.reasoning = reasoning
        self.indicators = indicators
        self.verdict = verdict
        self.tierUsed = tierUsed
        self.processingTimeMs = processingTimeMs
        self.timestamp = Date()
        self.modality = modality
    }
//默认初始化状态
    static var safeDefault: RiskScore {
        RiskScore(score: 0.0, level: .safe, confidence: 1.0, modality: .text)
    }
}

// MARK: - Modality

enum ModalityType: String, Codable, CaseIterable {
    case text  = "text"
    case voice = "voice"
    case video = "video"

    var displayName: String {
        switch self {
        case .text:  return "Text"
        case .voice: return "Voice"
        case .video: return "Video"
        }
    }

    var systemIcon: String {
        switch self {
        case .text:  return "envelope.fill"
        case .voice: return "mic.fill"
        case .video: return "video.fill"
        }
    }
}

enum ModalityState: String {
    case active    = "Active"
    case listening = "Listening"
    case analyzing = "Analyzing"
    case inactive  = "Off"
    case error     = "Error"

    var color: Color {
        switch self {
        case .active:    return Color(hex: "#30D158")
        case .listening: return Color(hex: "#FF9F0A")
        case .analyzing: return Color(hex: "#0A84FF")
        case .inactive:  return Color(hex: "#636366")
        case .error:     return Color(hex: "#FF453A")
        }
    }
}

struct ModalityStatus: Identifiable {
    let id = UUID()
    var type: ModalityType
    var state: ModalityState
    var isEnabled: Bool
}

enum MonitorChannelType: String, Codable, CaseIterable {
    case email = "email"
    case message = "message"
    case voice = "voice"
    case video = "video"

    var displayName: String {
        switch self {
        case .email: return "Email"
        case .message: return "Message"
        case .voice: return "Voice"
        case .video: return "Video"
        }
    }

    var systemIcon: String {
        switch self {
        case .email: return "envelope.fill"
        case .message: return "message.fill"
        case .voice: return "mic.fill"
        case .video: return "video.fill"
        }
    }
}

struct MonitorChannelStatus: Identifiable {
    let id = UUID()
    var type: MonitorChannelType
    var state: ModalityState
    var isEnabled: Bool
}

// MARK: - Detection Tier

enum DetectionTier: Int, CaseIterable {
    case onDevice    = 0
    case localServer = 1
    case cloud       = 2

    var apiName: String {
        switch self {
        case .onDevice:
            return "on_device"
        case .localServer:
            return "local_server"
        case .cloud:
            return "cloud_remote"
        }
    }

    var displayName: String {
        switch self {
        case .onDevice:    return "On-Device"
        case .localServer: return "Local Server"
        case .cloud:       return "Cloud / Remote"
        }
    }

    var subtitle: String {
        switch self {
        case .onDevice:    return "SLM + RAG • Private"
        case .localServer: return "Enhanced AI Analysis"
        case .cloud:       return "Deep Analysis"
        }
    }

    var privacyNote: String {
        switch self {
        case .onDevice:    return "No data leaves device"
        case .localServer: return "Data stays on local network"
        case .cloud:       return "PII de-identified before upload"
        }
    }

    static func apiNameToRawValue(_ name: String) -> Int {
        switch name.lowercased() {
        case "on_device", "on-device", "device":
            return DetectionTier.onDevice.rawValue
        case "local_server", "local-server", "local":
            return DetectionTier.localServer.rawValue
        case "cloud", "cloud_remote", "cloud / remote", "remote":
            return DetectionTier.cloud.rawValue
        default:
            return DetectionTier.onDevice.rawValue
        }
    }

    static func rawValueToAPIName(_ rawValue: Int) -> String {
        DetectionTier(rawValue: rawValue)?.apiName ?? DetectionTier.onDevice.apiName
    }
}

enum TierState {
    case idle
    case active
    case processing
    case escalated
    case error(String)

    var color: Color {
        switch self {
        case .idle:       return Color(hex: "#636366")
        case .active:     return Color(hex: "#30D158")
        case .processing: return Color(hex: "#0A84FF")
        case .escalated:  return Color(hex: "#FF9F0A")
        case .error:      return Color(hex: "#FF453A")
        }
    }

    var label: String {
        switch self {
        case .idle:            return "Standby"
        case .active:          return "Active"
        case .processing:      return "Processing"
        case .escalated:       return "Escalated"
        case .error(let msg):  return "Error: \(msg)"
        }
    }
}

struct TierStatus: Identifiable {
    let id = UUID()
    var tier: DetectionTier
    var state: TierState
    var latencyMs: Int?
//延迟，没有就是”-“
    var latencyLabel: String {
        guard let ms = latencyMs else { return "—" }
        return ms < 1000 ? "\(ms)ms" : String(format: "%.1fs", Double(ms) / 1000)
    }
}

// MARK: - Whitelist Entry

struct WhitelistEntry: Identifiable, Codable {
    let id: UUID
    var value: String          //白名单内容
    var normalizedValues: [String]
    var matchKind: String?
    var primaryMatchValue: String?
    var label: String?
    var addedAt: Date

    init(
        value: String,
        normalizedValues: [String] = [],
        matchKind: String? = nil,
        primaryMatchValue: String? = nil,
        label: String? = nil
    ) {
        self.id = UUID()
        self.value = value
        self.normalizedValues = normalizedValues
        self.matchKind = matchKind
        self.primaryMatchValue = primaryMatchValue
        self.label = label
        self.addedAt = Date()
    }

    private enum CodingKeys: String, CodingKey {
        case id
        case value
        case normalizedValues
        case matchKind
        case primaryMatchValue
        case label
        case addedAt
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(UUID.self, forKey: .id) ?? UUID()
        value = try container.decode(String.self, forKey: .value)
        normalizedValues = try container.decodeIfPresent([String].self, forKey: .normalizedValues) ?? []
        matchKind = try container.decodeIfPresent(String.self, forKey: .matchKind)
        primaryMatchValue = try container.decodeIfPresent(String.self, forKey: .primaryMatchValue)
        label = try container.decodeIfPresent(String.self, forKey: .label)
        addedAt = try container.decodeIfPresent(Date.self, forKey: .addedAt) ?? Date()
    }
}

// MARK: - Color Extension
//颜色转换
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:(a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(.sRGB,
                  red:   Double(r) / 255,
                  green: Double(g) / 255,
                  blue:  Double(b) / 255,
                  opacity: Double(a) / 255)
    }
}
