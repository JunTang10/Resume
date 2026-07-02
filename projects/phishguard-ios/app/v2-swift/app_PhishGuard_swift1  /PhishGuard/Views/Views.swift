//界面布局显示
import SwiftUI
import AVFoundation
import Combine
import UniformTypeIdentifiers
import UIKit
import Contacts
import ContactsUI

// MARK: - Audio Recorder Helper

final class AudioRecorder: NSObject, ObservableObject, AVAudioRecorderDelegate {
    @Published var isRecording = false
    @Published var recordedURL: URL? = nil
    @Published var duration: TimeInterval = 0
    @Published var errorMessage: String? = nil

    private var recorder: AVAudioRecorder?
    private var timer: Timer?

    func startRecording() {
        errorMessage = nil
        let session = AVAudioSession.sharedInstance()
        requestMicrophonePermission { [weak self] granted in
            DispatchQueue.main.async {
                print("[AudioRecorder] microphone permission: \(granted ? "granted" : "denied")")
                guard let self else { return }
                guard granted else {
                    self.isRecording = false
                    self.errorMessage = "Microphone permission was denied. Enable microphone access in Settings to record audio."
                    return
                }

                do {
                    try session.setCategory(.record, mode: .default)
                    try session.setActive(true)

                    let url = FileManager.default.temporaryDirectory
                        .appendingPathComponent("pg_rec_\(Date().timeIntervalSince1970).m4a")
                    let settings: [String: Any] = [
                        AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
                        AVSampleRateKey: 12000,
                        AVNumberOfChannelsKey: 1,
                        AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
                    ]

                    let recorder = try AVAudioRecorder(url: url, settings: settings)
                    recorder.delegate = self
                    recorder.prepareToRecord()
//录音失败时释放。  AVAudioSession
                    guard recorder.record() else {
                        self.errorMessage = "Recording could not be started."
                        self.isRecording = false
                        try? session.setActive(false)  // 新增：释放 session
                        return
                    }
                    self.recorder = recorder
                    self.recordedURL = nil
                    self.isRecording = true
                    self.duration = 0
                    self.timer?.invalidate()
                    self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
                        self?.duration += 1
                    }
                    print("[AudioRecorder] recording started")
                    print("[AudioRecorder] audio file url: \(url.path)")
                } catch {
                    self.isRecording = false
                    self.errorMessage = "Recording setup failed: \(error.localizedDescription)"
                }
            }
        }
    }

    private func requestMicrophonePermission(completion: @escaping (Bool) -> Void) {
        if #available(iOS 17.0, *) {
            AVAudioApplication.requestRecordPermission(completionHandler: completion)
        } else {
            AVAudioSession.sharedInstance().requestRecordPermission(completion)
        }
    }

    func stopRecording() {
        recorder?.stop()
        timer?.invalidate()
        recordedURL = recorder?.url
        isRecording = false
        if let recordedURL {
            print("[AudioRecorder] recording finished")
            print("[AudioRecorder] audio file url: \(recordedURL.path)")
        }
    }

    func clearRecording() { recordedURL = nil; duration = 0; errorMessage = nil }

    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        print("[AudioRecorder] recording finished with success: \(flag)")
        if !flag {
            errorMessage = "Recording finished unsuccessfully."
        }
    }

    func audioRecorderEncodeErrorDidOccur(_ recorder: AVAudioRecorder, error: Error?) {
        if let error {
            print("[AudioRecorder] recording encode error: \(error.localizedDescription)")
            errorMessage = "Recording failed: \(error.localizedDescription)"
        }
    }

    var durationLabel: String {
        String(format: "%02d:%02d", Int(duration) / 60, Int(duration) % 60)
    }
}

// MARK: - Root ContentView

struct ContentView: View {
    @StateObject private var vm    = DashboardViewModel()
    @StateObject private var store = PersistenceStore.shared
    @StateObject private var historyStore = HistoryStore.shared
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            DashboardView()
                .environmentObject(vm).environmentObject(store).environmentObject(historyStore)
                .tabItem { Label("Monitor",  systemImage: "shield.fill") }.tag(0)
            AnalyzeView()
                .environmentObject(vm)
                .tabItem { Label("Analyze",  systemImage: "magnifyingglass") }.tag(1)
            HistoryView()
                .environmentObject(historyStore)
                .tabItem { Label("History",  systemImage: "list.bullet.clipboard") }.tag(2)
            SettingsView()
                .environmentObject(vm).environmentObject(store)
                .tabItem { Label("Settings", systemImage: "gearshape.fill") }.tag(3)
        }
        .preferredColorScheme(.light)
        .tint(Color(hex: "#0A84FF"))
    }
}

// MARK: - Dashboard View

struct DashboardView: View {
    @EnvironmentObject var vm: DashboardViewModel
    @EnvironmentObject var store: PersistenceStore
    @EnvironmentObject var historyStore: HistoryStore

    #if DEBUG
    private var debugInjectTestSMSCaptureAction: (() -> Void)? {
        { vm.injectTestSMSCaptureForDebug() }
    }
    #else
    private var debugInjectTestSMSCaptureAction: (() -> Void)? { nil }
    #endif

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    RiskScoreCard(score: vm.currentRiskScore)
                    if let alert = vm.activeAlert {
                        AlertBannerView(event: alert) { vm.dismissAlert() }
                    }
                    ModalitySectionView(
                        statuses: $vm.monitorChannelStatuses,
                        onToggle: { vm.toggleMonitoringChannel($0) },
                        onInjectTestSMSCapture: debugInjectTestSMSCaptureAction
                    )
                    TierStatusSectionView(tiers: vm.tierStatuses)
                    if !historyStore.historyEvents.isEmpty { QuickStatsView(events: historyStore.historyEvents) }
                }
                .padding(.horizontal, 16).padding(.bottom, 24)
            }
            .background(Color(hex: "#F2F2F7").ignoresSafeArea())
            .navigationTitle("PhishGuard")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Circle()
                        .fill(vm.currentRiskScore.level == .safe
                              ? Color(hex: "#30D158") : Color(hex: "#FF453A"))
                        .frame(width: 10, height: 10)
                }
            }
        }
    }
}

// MARK: - Risk Score Card

struct RiskScoreCard: View {
    let score: RiskScore
    @State private var animatedScore: Double = 0

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("CURRENT RISK SCORE")
                .font(.caption).fontWeight(.semibold).foregroundColor(.secondary).tracking(1)

            HStack(alignment: .firstTextBaseline) {
                Text(String(format: "%.1f", animatedScore))
                    .font(.system(size: 56, weight: .bold, design: .rounded))
                    .foregroundColor(score.level.color)
                Text("/ 10").font(.title3).foregroundColor(.secondary)
                Spacer()
                VStack(alignment: .trailing, spacing: 4) {
                    Text(score.level.label)
                        .font(.caption).fontWeight(.bold)
                        .padding(.horizontal, 10).padding(.vertical, 4)
                        .background(score.level.color.opacity(0.15))
                        .foregroundColor(score.level.color).clipShape(Capsule())
                    Text(String(format: "%.0f%% confidence", score.confidence * 100))
                        .font(.caption2).foregroundColor(.secondary)
                }
            }

            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 3).fill(Color(hex: "#E5E5EA")).frame(height: 6)
                    RoundedRectangle(cornerRadius: 3)
                        .fill(LinearGradient(
                            gradient: Gradient(colors: [
                                Color(hex: "#30D158"), Color(hex: "#FFD60A"),
                                Color(hex: "#FF9F0A"), Color(hex: "#FF453A")]),
                            startPoint: .leading, endPoint: .trailing))
                        .frame(width: geo.size.width * (animatedScore / 10), height: 6)
                        .animation(.easeInOut(duration: 0.6), value: animatedScore)
                }
            }.frame(height: 6)

            if let r = score.reasoning {
                Text(r).font(.caption).foregroundColor(.secondary).lineLimit(2)
            }
        }
        .padding(16).background(Color.white).cornerRadius(20)
        .shadow(color: .black.opacity(0.06), radius: 8, x: 0, y: 2)
        .onAppear { withAnimation(.easeOut(duration: 0.8)) { animatedScore = score.score } }
        .onChange(of: score.score) { _, newVal in withAnimation(.easeInOut(duration: 0.4)) { animatedScore = newVal } }
    }
}

// MARK: - Alert Banner

struct AlertBannerView: View {
    let event: DetectionEvent
    let onDismiss: () -> Void
    @State private var pulsing = false

    var body: some View {
        HStack(spacing: 12) {
            Circle().fill(Color(hex: "#FF453A")).frame(width: 10, height: 10)
                .opacity(pulsing ? 0.3 : 1)
                .animation(.easeInOut(duration: 0.8).repeatForever(autoreverses: true), value: pulsing)
                .onAppear { pulsing = true }
            VStack(alignment: .leading, spacing: 2) {
                Text(event.riskLevel.label + " RISK DETECTED")
                    .font(.caption).fontWeight(.bold).foregroundColor(Color(hex: "#FF453A"))
                Text(event.summary)
                    .font(.caption).foregroundColor(Color(hex: "#FF453A").opacity(0.8)).lineLimit(2)
            }
            Spacer()
            Button(action: onDismiss) {
                Image(systemName: "xmark").font(.caption).foregroundColor(Color(hex: "#FF453A").opacity(0.6))
            }
        }
        .padding(12)
        .background(Color(hex: "#FF453A").opacity(0.08)).cornerRadius(14)
        .overlay(RoundedRectangle(cornerRadius: 14).stroke(Color(hex: "#FF453A").opacity(0.3), lineWidth: 0.5))
    }
}

// MARK: - Modality Section

struct ModalitySectionView: View {
    @Binding var statuses: [MonitorChannelStatus]
    let onToggle: (MonitorChannelType) -> Void
    #if DEBUG
    let onInjectTestSMSCapture: (() -> Void)?
    #endif

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            SectionHeaderView(title: "Monitoring Channels")
            HStack(spacing: 6) {
                ForEach($statuses) { $status in
                    ModalityCard(status: $status) { onToggle(status.type) }
                }
            }
            #if DEBUG
            if let onInjectTestSMSCapture {
                Button(action: onInjectTestSMSCapture) {
                    Text("Inject Test SMS Capture")
                        .font(.caption.weight(.semibold))
                        .foregroundColor(Color(hex: "#34C759"))
                        .frame(maxWidth: .infinity, minHeight: 40)
                        .background(Color.white)
                        .cornerRadius(14)
                        .overlay(
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(Color(hex: "#34C759").opacity(0.35), lineWidth: 0.5)
                        )
                }
                .buttonStyle(.plain)
            }
            #endif
        }
    }
}

struct ModalityCard: View {
    @Binding var status: MonitorChannelStatus
    let onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            VStack(spacing: 4) {
                Image(systemName: status.type.systemIcon)
                    .font(.system(size: 19, weight: .semibold))
                    .foregroundColor(status.isEnabled ? status.state.color : .secondary)
                Text(status.type.displayName)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)
                Text(status.state.rawValue)
                    .font(.caption2)
                    .fontWeight(.semibold)
                    .foregroundColor(status.isEnabled ? status.state.color : .secondary)
            }
            .frame(maxWidth: .infinity, minHeight: 78)
            .padding(.horizontal, 4)
            .padding(.vertical, 8)
            .background(Color.white).cornerRadius(16)
            .overlay(RoundedRectangle(cornerRadius: 16)
                .stroke(status.isEnabled ? status.state.color.opacity(0.4) : Color(hex: "#E5E5EA"), lineWidth: 0.5))
            .shadow(color: .black.opacity(0.04), radius: 4, x: 0, y: 1)
        }.buttonStyle(.plain)
    }
}

// MARK: - Tier Status Section

struct TierStatusSectionView: View {
    let tiers: [TierStatus]

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            SectionHeaderView(title: "Detection Tiers")
            VStack(spacing: 0) {
                ForEach(Array(tiers.enumerated()), id: \.element.id) { idx, tier in
                    TierRow(status: tier)
                    if idx < tiers.count - 1 { Divider().padding(.leading, 44) }
                }
            }
            .background(Color.white).cornerRadius(16)
            .shadow(color: .black.opacity(0.06), radius: 8, x: 0, y: 2)
        }
    }
}

struct TierRow: View {
    let status: TierStatus

    var body: some View {
        HStack(spacing: 12) {
            Text("\(status.tier.rawValue + 1)").font(.caption2).fontWeight(.bold)
                .frame(width: 20, height: 20)
                .background(status.state.color.opacity(0.15))
                .foregroundColor(status.state.color).clipShape(Circle())
            Circle().fill(status.state.color).frame(width: 7, height: 7)
            VStack(alignment: .leading, spacing: 2) {
                Text(status.tier.displayName).font(.subheadline).fontWeight(.medium).foregroundColor(.primary)
                if status.state.label != "Standby" && status.state.label != "Active" {
                    Text(status.state.label).font(.caption).foregroundColor(.secondary)
                }
            }
            Spacer()
            VStack(alignment: .trailing, spacing: 2) {
                Text(status.latencyLabel).font(.caption)
                    .foregroundColor(status.latencyMs != nil ? status.state.color : .secondary)

            }
        }
        .padding(.horizontal, 14).padding(.vertical, 12)
    }
}

// MARK: - Quick Stats

struct QuickStatsView: View {
    let events: [DetectionEvent]
    private var blockedCount: Int { events.filter { $0.wasBlocked }.count }
    private var flaggedCount: Int { events.filter { $0.riskLevel.isFlagged }.count }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            SectionHeaderView(title: "This Session")
            HStack(spacing: 10) {
                StatCard(value: "\(events.count)", label: "Scanned",  color: Color(hex: "#0A84FF"))
                StatCard(value: "\(flaggedCount)", label: "Flagged",  color: Color(hex: "#FF9F0A"))
                StatCard(value: "\(blockedCount)", label: "Blocked",  color: Color(hex: "#FF453A"))
            }
        }
    }
}

struct StatCard: View {
    let value: String; let label: String; let color: Color

    var body: some View {
        VStack(spacing: 4) {
            Text(value).font(.title2).fontWeight(.bold).foregroundColor(color)
            Text(label).font(.caption2).foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity).padding(.vertical, 12)
        .background(Color.white).cornerRadius(14)
        .shadow(color: .black.opacity(0.04), radius: 4, x: 0, y: 1)
    }
}

// MARK: - Analyze View

enum AnalyzeInputType: String, CaseIterable {
    case text  = "Text"
    case voice = "Voice"
    case video = "Video"

    var icon: String {
        switch self {
        case .text:  return "envelope.fill"
        case .voice: return "mic.fill"
        case .video: return "video.fill"
        }
    }
}

struct AnalyzeView: View {
    @EnvironmentObject var vm: DashboardViewModel
    @State private var inputType: AnalyzeInputType = .text
    @State private var isAnalyzing = false
    @State private var textResult: RiskScore? = nil
    @State private var voiceResult: RiskScore? = nil
    @State private var videoResult: RiskScore? = nil
    @State private var manualTextInput = ""
    @State private var importedTextFileContent = ""
    @State private var importedTextName: String? = nil
    @StateObject private var audioRecorder = AudioRecorder()
    @State private var pickedAudioName: String? = nil
    @State private var pickedAudioURL: URL? = nil
    @State private var voiceTranscript = ""
    @State private var pickedVideoName: String? = nil
    @State private var pickedVideoURL: URL? = nil
    @State private var videoExtractedText = ""
    @State private var videoOCRText = ""
    @State private var videoTextSourceSummary = ""

    private var activeResult: RiskScore? {
        switch inputType {
        case .text: return textResult
        case .voice: return voiceResult
        case .video: return videoResult
        }
    }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    // Type Picker
                    HStack(spacing: 0) {
                        ForEach(AnalyzeInputType.allCases, id: \.self) { t in
                            Button(action: { withAnimation { inputType = t } }) {
                                HStack(spacing: 6) {
                                    Image(systemName: t.icon).font(.caption)
                                    Text(t.rawValue).font(.subheadline).fontWeight(.medium)
                                }
                                .frame(maxWidth: .infinity).padding(.vertical, 10)
                                .background(inputType == t ? Color(hex: "#0A84FF") : Color.clear)
                                .foregroundColor(inputType == t ? .white : Color(hex: "#0A84FF"))
                                .cornerRadius(10)
                            }
                        }
                    }
                    .padding(3)
                    .background(Color(hex: "#0A84FF").opacity(0.1)).cornerRadius(12)
                    .padding(.top, 8)

                    Group {
                        switch inputType {
                        case .text:
                            TextInputPanel(
                                isAnalyzing: $isAnalyzing,
                                result: $textResult,
                                manualTextInput: $manualTextInput,
                                importedTextFileContent: $importedTextFileContent,
                                importedTextName: $importedTextName
                            )
                        case .voice:
                            VoiceInputPanel(
                                recorder: audioRecorder,
                                isAnalyzing: $isAnalyzing,
                                result: $voiceResult,
                                pickedAudioName: $pickedAudioName,
                                pickedAudioURL: $pickedAudioURL,
                                transcript: $voiceTranscript
                            )
                        case .video:
                            VideoInputPanel(
                                isAnalyzing: $isAnalyzing,
                                result: $videoResult,
                                pickedVideoName: $pickedVideoName,
                                pickedVideoURL: $pickedVideoURL,
                                extractedText: $videoExtractedText,
                                ocrText: $videoOCRText,
                                sourceSummary: $videoTextSourceSummary
                            )
                        }
                    }
                    .environmentObject(vm)

                    if let result = activeResult {
                        AnalyzeResultCard(
                            score: result,
                            trustedContactSuggestion: vm.trustedContactSuggestion,
                            onAddTrustedContact: { vm.addTrustedContactSuggestionToWhitelist() },
                            onDismissSuggestion: { vm.dismissTrustedContactSuggestion() }
                        )
                            .transition(.move(edge: .bottom).combined(with: .opacity))
                    }

                    Spacer(minLength: 40)
                }
                .padding(.horizontal, 16)
            }
            .background(Color(hex: "#F2F2F7").ignoresSafeArea())
            .navigationTitle("Analyze")
            .navigationBarTitleDisplayMode(.large)
            .alert(item: $vm.policySuggestion) { suggestion in
                Alert(
                    title: Text(
                        suggestion.action == .blocklist
                            ? "Add this sender to Blocklist?"
                            : "Add this sender to Whitelist?"
                    ),
                    message: Text("\(suggestion.value)\n\(suggestion.reason)"),
                    primaryButton: .default(
                        Text(suggestion.action == .blocklist ? "Add to Blocklist" : "Add to Whitelist")
                    ) {
                        vm.confirmPolicySuggestion(suggestion)
                    },
                    secondaryButton: .cancel {
                        vm.dismissPolicySuggestion()
                    }
                )
            }
        }
    }
}

// MARK: - Text Input Panel

struct TextInputPanel: View {
    struct MonitoringEnablePrompt: Identifiable {
        let source: ActiveInputSource

        var id: String {
            source.displayName
        }

        var title: String {
            switch source {
            case .email:
                return "Enable Email Monitoring?"
            case .textMessage:
                return "Enable Message Monitoring?"
            case .manual:
                return ""
            }
        }

        var message: String {
            switch source {
            case .email:
                return "Email monitoring is currently off. Do you want to turn it on and load the latest email?"
            case .textMessage:
                return "Message monitoring is currently off. Do you want to turn it on and load the latest captured text message?"
            case .manual:
                return ""
            }
        }
    }

    enum ActiveInputSource: String, CaseIterable, Identifiable, Hashable {
        case manual = "Manual"
        case email = "Email"
        case textMessage = "Message"

        var id: String { rawValue }

        var displayName: String {
            switch self {
            case .manual:
                return "Manual"
            case .email:
                return "Email"
            case .textMessage:
                return "Message"
            }
        }
    }

    @EnvironmentObject var vm: DashboardViewModel
    @Binding var isAnalyzing: Bool
    @Binding var result: RiskScore?
    @Binding var manualTextInput: String
    @State private var sourceIdentity = ""
    @Binding var importedTextFileContent: String
    @Binding var importedTextName: String?
    @State private var showTextImporter = false
    @State private var selectedSourceType: ActiveInputSource = .manual
    @State private var activeInputSource: ActiveInputSource = .manual
    @State private var pendingExplicitEmailLoad = false
    @State private var pendingExplicitTextMessageLoad = false
    @State private var suppressNextSourceTypeSelectionChange = false
    @State private var suppressNextManualTextChange = false
    @State private var suppressNextImportedTextChange = false
    @State private var suppressNextActiveInputSourceChange = false
    @State private var monitoringEnablePrompt: MonitoringEnablePrompt? = nil
    private let textService = TextService()

    private var hasManualText: Bool {
        !manualTextInput.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

    private var hasImportedText: Bool {
        !importedTextFileContent.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

    private var analysisSourceLabel: String {
        switch (hasManualText, hasImportedText) {
        case (true, true):
            return "typed text + imported file"
        case (true, false):
            return "typed text"
        case (false, true):
            return "imported file"
        case (false, false):
            return "empty input"
        }
    }

    private var isUserEditingManualContent: Bool {
        activeInputSource == .manual && (hasManualText || hasImportedText)
    }

    private var canAutoApplyIncomingDraft: Bool {
        !isUserEditingManualContent
    }

    private var canAutoApplyIncomingEmailDraft: Bool {
        pendingExplicitEmailLoad
        || activeInputSource == .email
        || (activeInputSource == .manual && !hasManualText && !hasImportedText && canAutoApplyIncomingDraft)
    }

    private var canAutoApplyIncomingTextMessageDraft: Bool {
        pendingExplicitTextMessageLoad
        || activeInputSource == .textMessage
        || (activeInputSource == .manual && !hasManualText && !hasImportedText && canAutoApplyIncomingDraft)
    }

    private var isShowingMonitoringEnablePrompt: Binding<Bool> {
        Binding(
            get: { monitoringEnablePrompt != nil },
            set: { isPresented in
                if !isPresented {
                    monitoringEnablePrompt = nil
                }
            }
        )
    }

    var body: some View {
        VStack(spacing: 12) {
            fieldLabel("SOURCE CONTEXT (OPTIONAL)")
            Text("Optional context. The system will auto-detect this in real scenarios.")
                .font(.caption)
                .foregroundColor(.secondary)
                .frame(maxWidth: .infinity, alignment: .leading)
            fieldLabel("Source Type")
            Picker("Source Type", selection: $selectedSourceType) {
                Text("Email").tag(ActiveInputSource.email)
                Text("Message").tag(ActiveInputSource.textMessage)
                Text("Manual").tag(ActiveInputSource.manual)
            }
            .pickerStyle(.segmented)

            fieldLabel("Source Identity")
            TextField(sourceIdentityPlaceholder, text: $sourceIdentity)
                .font(.subheadline).padding(12)
                .background(Color(hex: "#F2F2F7")).cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(hex: "#E5E5EA"), lineWidth: 0.5))
                .autocorrectionDisabled().textInputAutocapitalization(.never)
            if let sourceContextStatus = vm.sourceContextStatus {
                Text(sourceContextStatus)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }

            fieldLabel("TYPED CONTENT")
            textEditorField(text: $manualTextInput, placeholder: "Paste suspicious SMS, email, or message here...", minHeight: 140)

            Button(action: { showTextImporter = true }) {
                HStack(spacing: 8) {
                    Image(systemName: "doc.text")
                    Text(importedTextName ?? "Import TXT file")
                        .font(.caption)
                        .lineLimit(1)
                        .truncationMode(.middle)
                    Spacer()
                }
                .padding(10)
                .background(Color(hex: "#F2F2F7"))
                .foregroundColor(Color(hex: "#0A84FF"))
                .cornerRadius(10)
            }
            .buttonStyle(.plain)
            .fileImporter(isPresented: $showTextImporter,
                          allowedContentTypes: [.plainText],
                          allowsMultipleSelection: false) { res in
                switch res {
                case .success(let urls):
                    if let url = urls.first {
                        importTextFile(from: url)
                    }
                case .failure(let error):
                    vm.errorMessage = error.localizedDescription
                }
            }

            if let importedTextName {
                VStack(alignment: .leading, spacing: 8) {
                    HStack(spacing: 8) {
                        Image(systemName: "doc.text.fill")
                            .foregroundColor(Color(hex: "#0A84FF"))
                        VStack(alignment: .leading, spacing: 2) {
                            Text(importedTextName)
                                .font(.caption)
                                .fontWeight(.semibold)
                                .lineLimit(1)
                                .truncationMode(.middle)
                            Text("\(importedTextFileContent.count) imported characters")
                                .font(.caption2)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                        Button("Remove") {
                            importedTextFileContent = ""
                            self.importedTextName = nil
                            invalidateDraftResult()
                        }
                        .font(.caption)
                        .foregroundColor(Color(hex: "#FF453A"))
                    }

                    if !importedTextFileContent.isEmpty {
                        Text(importedTextFileContent)
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .lineLimit(3)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .padding(10)
                .background(Color(hex: "#F2F2F7"))
                .cornerRadius(10)
            }

            if let error = vm.errorMessage {
                Text(error)
                    .font(.caption)
                    .foregroundColor(Color(hex: "#FF453A"))
            }

            Text("Analyzing: \(analysisSourceLabel)")
                .font(.caption)
                .foregroundColor(.secondary)
                .frame(maxWidth: .infinity, alignment: .leading)

            AnalyzeButton(isAnalyzing: isAnalyzing, disabled: buildTextAnalysisInput().isEmpty) {
                Task { await runAnalysis() }
            }

            ExternalAnalyzeButton(isAnalyzing: isAnalyzing, disabled: buildTextAnalysisInput().isEmpty) {
                Task { await runExternalAnalysis() }
            }

        }
        .padding(16).background(Color.white).cornerRadius(16)
        .shadow(color: .black.opacity(0.06), radius: 8, x: 0, y: 2)
        .confirmationDialog(
            monitoringEnablePrompt?.title ?? "",
            isPresented: isShowingMonitoringEnablePrompt,
            titleVisibility: .visible
        ) {
            if let prompt = monitoringEnablePrompt {
                Button("Enable") {
                    monitoringEnablePrompt = nil
                    confirmMonitoringEnable(prompt.source)
                }
                Button("Cancel", role: .cancel) {
                    revertSourceTypeSelection()
                    monitoringEnablePrompt = nil
                }
            }
        } message: {
            if let prompt = monitoringEnablePrompt {
                Text(prompt.message)
            }
        }
        .onChange(of: manualTextInput) { _, _ in
            if suppressNextManualTextChange {
                suppressNextManualTextChange = false
                return
            }
            switchToManualSourceContext()
            invalidateDraftResult()
        }
        .onChange(of: importedTextFileContent) { _, _ in
            if suppressNextImportedTextChange {
                suppressNextImportedTextChange = false
                return
            }
            if !importedTextFileContent.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                switchToManualSourceContext()
            }
            invalidateDraftResult()
        }
        .onChange(of: sourceIdentity) { _, newValue in
            vm.updateSourceContextStatus(for: newValue)
        }
        .onChange(of: selectedSourceType) { oldValue, newValue in
            if suppressNextSourceTypeSelectionChange {
                suppressNextSourceTypeSelectionChange = false
                return
            }
            guard oldValue != newValue else { return }
            handleSourceTypeSelection(newValue)
        }
        .onChange(of: activeInputSource) { oldValue, newValue in
            if suppressNextActiveInputSourceChange {
                suppressNextActiveInputSourceChange = false
                return
            }
            if newValue == .manual && oldValue != .manual {
                sourceIdentity = ""
                vm.updateSourceContextStatus(for: "")
            }
        }
        .onChange(of: vm.loadedEmailDraft) { _, newValue in
            guard let email = newValue else { return }
            if canAutoApplyIncomingEmailDraft {
                applyLoadedEmailDraft(email)
            }
            pendingExplicitEmailLoad = false
        }
        .onChange(of: vm.loadedTextMessageDraft) { _, newValue in
            guard let textMessage = newValue else { return }
            if canAutoApplyIncomingTextMessageDraft {
                applyLoadedTextMessageDraft(textMessage)
            }
            pendingExplicitTextMessageLoad = false
        }
        .onAppear {
            suppressNextSourceTypeSelectionChange = true
            selectedSourceType = activeInputSource
            if let draft = vm.loadedEmailDraft {
                if canAutoApplyIncomingEmailDraft {
                    applyLoadedEmailDraft(draft)
                }
            }
        }
    }

    private func requestLatestEmailLoad() {
        pendingExplicitEmailLoad = true
        vm.loadLatestEmailIntoInput()
    }

    private func requestLatestTextMessageLoad() {
        guard TextMessageSharedStore.loadLatestCapture() != nil else {
            pendingExplicitTextMessageLoad = false
            vm.loadedTextMessageDraft = nil
            if activeInputSource == .textMessage || selectedSourceType == .textMessage {
                manualTextInput = ""
                sourceIdentity = ""
                importedTextFileContent = ""
                importedTextName = nil
                vm.updateSourceContextStatus(for: "")
                suppressNextSourceTypeSelectionChange = true
                selectedSourceType = .textMessage
                suppressNextActiveInputSourceChange = true
                activeInputSource = .textMessage
                invalidateDraftResult()
            }
            vm.errorMessage = "No captured text message found yet."
            return
        }
        pendingExplicitTextMessageLoad = true
        vm.loadLatestTextMessageIntoInput()
    }

    private func handleSourceTypeSelection(_ newValue: ActiveInputSource) {
        switch newValue {
        case .email:
            if !vm.isEmailMonitoringActive {
                vm.startEmailMonitoring()
            }
            activateEmailSource()
        case .textMessage:
            activateTextMessageSource(enableMonitoringIfNeeded: !vm.isMessageMonitoringActive)
        case .manual:
            switchToManualSourceContext()
        }
    }

    private func confirmMonitoringEnable(_ source: ActiveInputSource) {
        switch source {
        case .email:
            vm.startEmailMonitoring()
            activateEmailSource()
        case .textMessage:
            activateTextMessageSource(enableMonitoringIfNeeded: true)
        case .manual:
            break
        }
    }

    private func revertSourceTypeSelection() {
        suppressNextSourceTypeSelectionChange = true
        selectedSourceType = activeInputSource
    }

    private func activateEmailSource() {
        suppressNextSourceTypeSelectionChange = true
        selectedSourceType = .email
        suppressNextActiveInputSourceChange = true
        activeInputSource = .email
        sourceIdentity = ""
        vm.updateSourceContextStatus(for: "")
        requestLatestEmailLoad()
    }

    private func activateTextMessageSource(enableMonitoringIfNeeded: Bool = false) {
        suppressNextSourceTypeSelectionChange = true
        selectedSourceType = .textMessage
        suppressNextActiveInputSourceChange = true
        activeInputSource = .textMessage
        sourceIdentity = ""
        vm.updateSourceContextStatus(for: "")
        if vm.isMessageMonitoringActive {
            requestLatestTextMessageLoad()
        } else if enableMonitoringIfNeeded {
            pendingExplicitTextMessageLoad = true
            vm.toggleMessageMonitoring()
        } else {
            monitoringEnablePrompt = MonitoringEnablePrompt(source: .textMessage)
        }
    }

    private func importTextFile(from url: URL) {
        let didAccessSecurityScopedResource = url.startAccessingSecurityScopedResource()
        defer {
            if didAccessSecurityScopedResource {
                url.stopAccessingSecurityScopedResource()
            }
        }

        do {
            let text = try textService.readTextFile(from: url)
            suppressNextSourceTypeSelectionChange = true
            suppressNextManualTextChange = true
            suppressNextImportedTextChange = true
            suppressNextActiveInputSourceChange = true
            manualTextInput = ""
            importedTextFileContent = textService.cleanText(text)
            importedTextName = url.lastPathComponent
            selectedSourceType = .manual
            activeInputSource = .manual
            sourceIdentity = ""
            vm.updateSourceContextStatus(for: "")
            invalidateDraftResult()
            vm.errorMessage = nil
        } catch {
            vm.errorMessage = error.localizedDescription
        }
    }

    private func invalidateDraftResult() {
        result = nil
        vm.clearDebugChainResult()
    }

    private func applyLoadedEmailDraft(_ email: LoadedEmailDraft) {
        suppressNextSourceTypeSelectionChange = true
        suppressNextManualTextChange = true
        suppressNextImportedTextChange = true
        suppressNextActiveInputSourceChange = true
        selectedSourceType = .email
        manualTextInput = email.body
        sourceIdentity = email.suggestedSourceContext
        importedTextFileContent = ""
        importedTextName = nil
        activeInputSource = .email
        result = nil
        vm.clearDebugChainResult()
    }

    private func applyLoadedTextMessageDraft(_ textMessage: LoadedTextMessageDraft) {
        suppressNextSourceTypeSelectionChange = true
        suppressNextManualTextChange = true
        suppressNextImportedTextChange = true
        suppressNextActiveInputSourceChange = true
        selectedSourceType = .textMessage
        manualTextInput = textMessage.messageBody
        sourceIdentity = textMessage.sender
        importedTextFileContent = ""
        importedTextName = nil
        activeInputSource = .textMessage
        result = nil
        vm.clearDebugChainResult()
    }

    private func buildTextAnalysisInput() -> String {
        let manualText = manualTextInput.trimmingCharacters(in: .whitespacesAndNewlines)
        let importedText = importedTextFileContent.trimmingCharacters(in: .whitespacesAndNewlines)

        switch (manualText.isEmpty, importedText.isEmpty) {
        case (false, false):
            return """
            [Typed text]
            \(manualText)

            [Imported TXT: \(importedTextName ?? "unknown")]
            \(importedText)
            """
        case (false, true):
            return manualText
        case (true, false):
            return importedText
        case (true, true):
            return ""
        }
    }

    private func runAnalysis() async {
        let analysisInput = buildTextAnalysisInput()
        guard !analysisInput.isEmpty else {
            vm.errorMessage = "Enter text or import a TXT file before analyzing."
            return
        }
        isAnalyzing = true
        defer { isAnalyzing = false }
        vm.errorMessage = nil
        let r = await vm.handleIncomingText(
            text: analysisInput,
            sender: selectedSourceHint(),
            domain: nil
        )
        result = vm.errorMessage == nil ? r : nil
    }

    private func runExternalAnalysis() async {
        let analysisInput = buildTextAnalysisInput()
        guard !analysisInput.isEmpty else {
            vm.errorMessage = "Enter text or import a TXT file before testing the external API."
            result = nil
            return
        }
        isAnalyzing = true
        defer { isAnalyzing = false }
        vm.errorMessage = nil
        do {
            let r = try await vm.handleExternalTextAnalysis(
                text: analysisInput,
                sender: selectedSourceHint(),
                domain: nil
            )
            result = r
        } catch {
            result = nil
            vm.errorMessage = error.localizedDescription
        }
    }

    private func selectedSourceHint() -> String? {
        let trimmedSourceIdentity = sourceIdentity.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmedSourceIdentity.isEmpty ? nil : trimmedSourceIdentity
    }

    private var sourceIdentityPlaceholder: String {
        switch activeInputSource {
        case .email:
            return "e.g. name <user@example.com>"
        case .textMessage:
            return "e.g. +61 400 111 222"
        case .manual:
            return "Optional current sender or phone number"
        }
    }

    private func switchToManualSourceContext() {
        suppressNextSourceTypeSelectionChange = true
        selectedSourceType = .manual
        suppressNextActiveInputSourceChange = true
        activeInputSource = .manual
        sourceIdentity = ""
        vm.updateSourceContextStatus(for: "")
    }
}

// MARK: - Voice Input Panel

struct VoiceInputPanel: View {
    @EnvironmentObject var vm: DashboardViewModel
    @ObservedObject var recorder: AudioRecorder
    @Binding var isAnalyzing: Bool
    @Binding var result: RiskScore?
    @Binding var pickedAudioName: String?
    @Binding var pickedAudioURL: URL?
    @Binding var transcript: String
    @State private var showFilePicker = false
    @State private var showContactPicker = false
    @State private var selectedCallerContext = ""
    @State private var callerContextStatus: String? = nil
    private let audioService = AudioService()
    private var supportedAudioContentTypes: [UTType] {
        [
            UTType(filenameExtension: "m4a"),
            UTType(filenameExtension: "wav"),
            UTType(filenameExtension: "mp3"),
            .audio
        ].compactMap { $0 }
    }
    var body: some View {
        VStack(spacing: 14) {
            fieldLabel("RECORD AUDIO")
            Button(action: {
                if recorder.isRecording {
                    recorder.stopRecording()
                } else {
                    recorder.startRecording()
                    transcript = ""
                    vm.clearVoicePreview()
                    result = nil
                }
            }) {
                HStack(spacing: 10) {
                    Image(systemName: recorder.isRecording ? "stop.circle.fill" : "mic.circle.fill").font(.title2)
                    VStack(alignment: .leading, spacing: 2) {
                        Text(recorder.isRecording ? "Recording… tap to stop" : "Tap to record")
                            .font(.subheadline).fontWeight(.medium)
                        if recorder.isRecording {
                            Text(recorder.durationLabel).font(.caption).foregroundColor(.secondary)
                        }
                    }
                    Spacer()
                    if recorder.recordedURL != nil && !recorder.isRecording {
                        Image(systemName: "checkmark.circle.fill").foregroundColor(Color(hex: "#30D158"))
                    }
                }
                .padding(14)
                .background(recorder.isRecording ? Color(hex: "#FF453A").opacity(0.07) : Color(hex: "#F2F2F7"))
                .foregroundColor(recorder.isRecording ? Color(hex: "#FF453A") : Color(hex: "#0A84FF"))
                .cornerRadius(12)
                .overlay(RoundedRectangle(cornerRadius: 12)
                    .stroke(recorder.isRecording ? Color(hex: "#FF453A").opacity(0.3) : Color(hex: "#E5E5EA"), lineWidth: 0.5))
            }.buttonStyle(.plain)

            if recorder.recordedURL != nil {
                Button(action: {
                    recorder.clearRecording()
                    transcript = ""
                    vm.clearVoicePreview()
                    result = nil
                }) {
                    Label("Clear recording", systemImage: "trash").font(.caption).foregroundColor(Color(hex: "#FF453A"))
                }
            }

            Divider()

            fieldLabel("OR UPLOAD AUDIO FILE")
            Button(action: { showFilePicker = true }) {
                HStack(spacing: 10) {
                    Image(systemName: "square.and.arrow.up").font(.title3)
                    Text(pickedAudioName ?? "Choose .m4a / .mp3 / .wav file")
                        .font(.subheadline).lineLimit(1).truncationMode(.middle)
                    Spacer()
                    if pickedAudioName != nil {
                        Image(systemName: "checkmark.circle.fill").foregroundColor(Color(hex: "#30D158"))
                    }
                }
                .padding(14).background(Color(hex: "#F2F2F7"))
                .foregroundColor(Color(hex: "#0A84FF")).cornerRadius(12)
                .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color(hex: "#E5E5EA"), lineWidth: 0.5))
            }
            .buttonStyle(.plain)
            .fileImporter(isPresented: $showFilePicker,
                          allowedContentTypes: supportedAudioContentTypes,
                          allowsMultipleSelection: false,
                          onCompletion: { res in
                switch res {
                case .success(let urls):
                    if let url = urls.first {
                        print("[VoiceInputPanel] selected audio file: \(url.lastPathComponent)")
                        print("[VoiceInputPanel] audio url: \(url.absoluteString)")
                        pickedAudioURL = url
                        pickedAudioName = url.lastPathComponent
                        transcript = ""
                        vm.clearVoicePreview()
                        result = nil
                        vm.errorMessage = nil
                    }
                case .failure(let error):
                    print("[VoiceInputPanel] audio selection failed: \(error.localizedDescription)")
                    vm.errorMessage = error.localizedDescription
                }
            })
            if pickedAudioName != nil {
                Button(action: {
                    pickedAudioURL = nil
                    pickedAudioName = nil
                    transcript = ""
                    vm.clearVoicePreview()
                    result = nil
                    vm.errorMessage = nil
                }) {
                    Label("Remove file", systemImage: "trash").font(.caption).foregroundColor(Color(hex: "#FF453A"))
                }
            }

            if let recorderError = recorder.errorMessage {
                Text(recorderError)
                    .font(.caption)
                    .foregroundColor(Color(hex: "#FF453A"))
            }

            Button(action: loadInteractiveVoiceTestCase) {
                HStack(spacing: 8) {
                    Image(systemName: "waveform")
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Load Voice Test Case")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        Text("Autofill one transcript and seed a matching call history event.")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                }
                .padding(12)
                .background(Color(hex: "#F2F2F7"))
                .foregroundColor(Color(hex: "#0A84FF"))
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(hex: "#0A84FF").opacity(0.2), lineWidth: 0.5)
                )
            }
            .buttonStyle(.plain)

            VStack(alignment: .leading, spacing: 8) {
                fieldLabel("SENDER / SOURCE CONTEXT (OPTIONAL)")
                TextField(
                    "Optional context. The system will auto-detect this in real scenarios.",
                    text: $selectedCallerContext
                )
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .padding(12)
                .background(Color(hex: "#F2F2F7"))
                .cornerRadius(10)
                .onChange(of: selectedCallerContext) { _, newValue in
                    let trimmedValue = newValue.trimmingCharacters(in: .whitespacesAndNewlines)
                    callerContextStatus = trimmedValue.isEmpty ? nil : "Edited"
                }

                if let callerContextStatus {
                    Text(callerContextStatus)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }

                Button(action: {
                    showContactPicker = true
                }) {
                    HStack(spacing: 8) {
                        Image(systemName: "person.crop.circle.badge.plus")
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Select Caller from Contacts")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            Text("Autofill caller name and number into source context.")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                    }
                    .padding(12)
                    .background(Color(hex: "#F2F2F7"))
                    .foregroundColor(Color(hex: "#0A84FF"))
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(hex: "#0A84FF").opacity(0.2), lineWidth: 0.5)
                    )
                }
                .buttonStyle(.plain)
            }
            .sheet(isPresented: $showContactPicker) {
                ContactPickerSheet { selectedContact in
                    selectedCallerContext = formatCallerContext(from: selectedContact)
                    callerContextStatus = "Selected from Contacts"
                    result = nil
                    vm.errorMessage = nil
                }
            }

            if let error = vm.errorMessage {
                Text(error)
                    .font(.caption)
                    .foregroundColor(Color(hex: "#FF453A"))
            }

            if !vm.latestVoiceTranscript.isEmpty {
                VStack(alignment: .leading, spacing: 6) {
                    fieldLabel("LISTENED / TRANSCRIBED TEXT")
                    Text(vm.latestVoiceTranscript)
                        .font(.subheadline)
                        .foregroundColor(.primary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(12)
                        .background(Color(hex: "#F2F2F7"))
                        .cornerRadius(10)
                }
            }

            AnalyzeButton(isAnalyzing: isAnalyzing,
                          disabled: recorder.recordedURL == nil && pickedAudioURL == nil && transcript.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty) {
                Task { await runAnalysis() }
            }

            ExternalAnalyzeButton(isAnalyzing: isAnalyzing, disabled: !canRunLocalVoiceAnalysis) {
                Task { await runExternalAnalysis() }
            }
        }
        .padding(16).background(Color.white).cornerRadius(16)
        .shadow(color: .black.opacity(0.06), radius: 8, x: 0, y: 2)
        .onChange(of: pickedAudioURL) { _, _ in
            if pickedAudioURL == nil && recorder.recordedURL == nil {
                result = nil
            }
        }
    }

    private var canRunLocalVoiceAnalysis: Bool {
        recorder.recordedURL != nil || pickedAudioURL != nil || !transcript.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

    private var resolvedSourceContext: String? {
        let trimmedSelectedContext = selectedCallerContext.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedSelectedContext.isEmpty else { return nil }
        return trimmedSelectedContext
    }

    private func runAnalysis() async {
        let existingTranscript = transcript.trimmingCharacters(in: .whitespacesAndNewlines)
        if !existingTranscript.isEmpty && recorder.recordedURL == nil && pickedAudioURL == nil {
            isAnalyzing = true
            vm.errorMessage = nil
            defer { isAnalyzing = false }
            let r = await vm.handleVoiceTranscription(
                text: existingTranscript,
                sourceNumber: resolvedSourceContext ?? (vm.autoDetectedSourceContext.isEmpty ? nil : vm.autoDetectedSourceContext),
                duration: recorder.duration
            )
            result = vm.errorMessage == nil ? r : nil
            return
        }

        guard let audioURL = recorder.recordedURL ?? pickedAudioURL else {
            print("[VoiceInputPanel] runAnalysis skipped: no audio URL")
            return
        }

        print("[VoiceInputPanel] runAnalysis using audio URL: \(audioURL.path)")
        isAnalyzing = true
        vm.errorMessage = nil
        defer { isAnalyzing = false }

        let didAccessSecurityScopedResource = audioURL.startAccessingSecurityScopedResource()
        print("[VoiceInputPanel] security scoped access: \(didAccessSecurityScopedResource)")
        defer {
            if didAccessSecurityScopedResource {
                audioURL.stopAccessingSecurityScopedResource()
            }
        }

        do {
            print("[VoiceInputPanel] start transcription")
            let transcription = try await audioService.transcribeAudio(from: audioURL)
            let cleanedTranscript = transcription.text.trimmingCharacters(in: .whitespacesAndNewlines)
            transcript = cleanedTranscript
            vm.latestVoiceTranscript = cleanedTranscript
            print("[VoiceInputPanel] transcription succeeded, characters: \(cleanedTranscript.count)")

            guard !cleanedTranscript.isEmpty else {
                result = nil
                vm.errorMessage = "Transcript is empty. Record or choose an audio file with detectable speech before analyzing."
                return
            }
            print("[VoiceInputPanel] transcription result: \(cleanedTranscript)")
            print("[VoiceInputPanel] final text sent to unified analyzer: \(cleanedTranscript)")
            let r = await vm.handleVoiceTranscription(
                text: cleanedTranscript,
                sourceNumber: resolvedSourceContext,
                duration: recorder.duration
            )
            result = vm.errorMessage == nil ? r : nil
        } catch {
            print("[VoiceInputPanel] transcription or analysis failed: \(error.localizedDescription)")
            result = nil
            vm.errorMessage = error.localizedDescription
        }
    }

    private func loadInteractiveVoiceTestCase() {
        let testCase = vm.prepareInteractiveVoiceTestCase()
        transcript = testCase.transcript
        selectedCallerContext = testCase.sourceNumber
        callerContextStatus = "Auto-detected"
        pickedAudioURL = nil
        pickedAudioName = nil
        result = nil
    }

    private func runExternalAnalysis() async {
        let existingTranscript = transcript.trimmingCharacters(in: .whitespacesAndNewlines)

        if !existingTranscript.isEmpty {
            isAnalyzing = true
            vm.errorMessage = nil
            defer { isAnalyzing = false }
            do {
                let r = try await vm.handleExternalAnalysis(
                    text: existingTranscript,
                    modality: .voice,
                    sourceHint: resolvedSourceContext ?? pickedAudioName
                )
                result = vm.errorMessage == nil ? r : nil
            } catch {
                result = nil
            }
            return
        }

        guard let audioURL = recorder.recordedURL ?? pickedAudioURL else {
            vm.errorMessage = "Choose or record audio before running Test External API."
            result = nil
            return
        }

        isAnalyzing = true
        vm.errorMessage = nil
        defer { isAnalyzing = false }

        let didAccessSecurityScopedResource = audioURL.startAccessingSecurityScopedResource()
        defer {
            if didAccessSecurityScopedResource {
                audioURL.stopAccessingSecurityScopedResource()
            }
        }

        do {
            let transcription = try await audioService.transcribeAudio(from: audioURL)
            let cleanedTranscript = transcription.text.trimmingCharacters(in: .whitespacesAndNewlines)
            transcript = cleanedTranscript
            vm.latestVoiceTranscript = cleanedTranscript

            guard !cleanedTranscript.isEmpty else {
                result = nil
                vm.errorMessage = "Transcript is empty. Record or choose an audio file with detectable speech before running Test External API."
                return
            }

            print("[VoiceInputPanel] transcription result: \(cleanedTranscript)")
            print("[VoiceInputPanel] final text sent to external analyzer: \(cleanedTranscript)")
            let r = try await vm.handleExternalAnalysis(
                text: cleanedTranscript,
                modality: .voice,
                sourceHint: resolvedSourceContext
            )
            result = vm.errorMessage == nil ? r : nil
        } catch {
            result = nil
            vm.errorMessage = error.localizedDescription
        }
    }

    private func formatCallerContext(from contact: CNContact) -> String {
        let preferredName = CNContactFormatter.string(from: contact, style: .fullName)?
            .trimmingCharacters(in: .whitespacesAndNewlines)
        let organizationName = contact.organizationName.trimmingCharacters(in: .whitespacesAndNewlines)
        let name = [preferredName, organizationName]
            .compactMap { value -> String? in
                guard let value, !value.isEmpty else { return nil }
                return value
            }
            .first ?? "Unknown Contact"

        if let phone = contact.phoneNumbers.first?.value.stringValue.trimmingCharacters(in: .whitespacesAndNewlines),
           !phone.isEmpty {
            return "\(name) (\(phone))"
        }

        return name
    }
}

struct ContactPickerSheet: UIViewControllerRepresentable {
    let onSelect: (CNContact) -> Void

    func makeCoordinator() -> Coordinator {
        Coordinator(onSelect: onSelect)
    }

    func makeUIViewController(context: Context) -> CNContactPickerViewController {
        let picker = CNContactPickerViewController()
        picker.delegate = context.coordinator
        picker.displayedPropertyKeys = [CNContactPhoneNumbersKey]
        return picker
    }

    func updateUIViewController(_ uiViewController: CNContactPickerViewController, context: Context) {}

    final class Coordinator: NSObject, CNContactPickerDelegate {
        private let onSelect: (CNContact) -> Void

        init(onSelect: @escaping (CNContact) -> Void) {
            self.onSelect = onSelect
        }

        func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
            onSelect(contact)
        }
    }
}

// MARK: - Video Input Panel

struct VideoInputPanel: View {
    @EnvironmentObject var vm: DashboardViewModel
    @Binding var isAnalyzing: Bool
    @Binding var result: RiskScore?
    @Binding var pickedVideoName: String?
    @Binding var pickedVideoURL: URL?
    @Binding var extractedText: String
    @Binding var ocrText: String
    @Binding var sourceSummary: String
    @State private var showFilePicker = false
    private let videoService = VideoService()

    var body: some View {
        VStack(spacing: 14) {
            fieldLabel("UPLOAD VIDEO FILE")
            Button(action: { showFilePicker = true }) {
                HStack(spacing: 10) {
                    Image(systemName: pickedVideoName != nil ? "video.fill" : "square.and.arrow.up").font(.title3)
                    Text(pickedVideoName ?? "Choose .mp4 / .mov file")
                        .font(.subheadline).lineLimit(1).truncationMode(.middle)
                    Spacer()
                    if pickedVideoName != nil {
                        Image(systemName: "checkmark.circle.fill").foregroundColor(Color(hex: "#30D158"))
                    }
                }
                .padding(14).background(Color(hex: "#F2F2F7"))
                .foregroundColor(Color(hex: "#0A84FF")).cornerRadius(12)
                .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color(hex: "#E5E5EA"), lineWidth: 0.5))
            }
            .buttonStyle(.plain)
            .fileImporter(isPresented: $showFilePicker,
                          allowedContentTypes: [.movie, .video],
                          allowsMultipleSelection: false,
                          onCompletion: { result in
                switch result {
                case .success(let urls):
                    if let url = urls.first {
                        importVideoFile(from: url)
                    }
                case .failure(let error):
                    vm.errorMessage = error.localizedDescription
                }
            })
            if pickedVideoName != nil {
                Button(action: {
                    pickedVideoURL = nil
                    pickedVideoName = nil
                    extractedText = ""
                    ocrText = ""
                    sourceSummary = ""
                    vm.clearVideoPreview()
                    result = nil
                    vm.errorMessage = nil
                }) {
                    Label("Remove file", systemImage: "trash").font(.caption).foregroundColor(Color(hex: "#FF453A"))
                }
            }

            if let error = vm.errorMessage {
                Text(error)
                    .font(.caption)
                    .foregroundColor(Color(hex: "#FF453A"))
            }

            Button(action: loadInteractiveVideoTestCase) {
                HStack(spacing: 8) {
                    Image(systemName: "film.stack")
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Load Video Test Case")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        Text("Autofill extracted video text and seed a matching history event.")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                }
                .padding(12)
                .background(Color(hex: "#F2F2F7"))
                .foregroundColor(Color(hex: "#0A84FF"))
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(hex: "#0A84FF").opacity(0.2), lineWidth: 0.5)
                )
            }
            .buttonStyle(.plain)

            if !vm.latestVideoExtractedText.isEmpty {
                if !vm.latestVideoSourceSummary.isEmpty {
                    VStack(alignment: .leading, spacing: 6) {
                        fieldLabel("TEXT SOURCE")
                        Text(vm.latestVideoSourceSummary)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }

                VStack(alignment: .leading, spacing: 6) {
                    fieldLabel("EXTRACTED TEXT")
                    Text(vm.latestVideoExtractedText)
                        .font(.subheadline)
                        .foregroundColor(.primary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(12)
                        .background(Color(hex: "#F2F2F7"))
                        .cornerRadius(10)
                }
            }

            if !vm.latestVideoOCRText.isEmpty && vm.latestVideoOCRText != vm.latestVideoExtractedText {
                VStack(alignment: .leading, spacing: 6) {
                    fieldLabel("OCR TEXT")
                    Text(vm.latestVideoOCRText)
                        .font(.subheadline)
                        .foregroundColor(.primary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(12)
                        .background(Color(hex: "#F2F2F7"))
                        .cornerRadius(10)
                }
            }

            AnalyzeButton(
                isAnalyzing: isAnalyzing,
                disabled: pickedVideoURL == nil && extractedText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            ) {
                Task { await runAnalysis() }
            }

            ExternalAnalyzeButton(
                isAnalyzing: isAnalyzing,
                disabled: pickedVideoURL == nil && extractedText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            ) {
                Task { await runExternalAnalysis() }
            }
        }
        .padding(16).background(Color.white).cornerRadius(16)
        .shadow(color: .black.opacity(0.06), radius: 8, x: 0, y: 2)
        .onChange(of: pickedVideoURL) { _, _ in
            result = nil
        }
    }

    private func importVideoFile(from url: URL) {
        let didAccessSecurityScopedResource = url.startAccessingSecurityScopedResource()
        defer {
            if didAccessSecurityScopedResource {
                url.stopAccessingSecurityScopedResource()
            }
        }

        do {
            let tempURL = FileManager.default.temporaryDirectory
                .appendingPathComponent(UUID().uuidString)
                .appendingPathExtension(url.pathExtension)

            if FileManager.default.fileExists(atPath: tempURL.path) {
                try FileManager.default.removeItem(at: tempURL)
            }

            try FileManager.default.copyItem(at: url, to: tempURL)
            pickedVideoURL = tempURL
            pickedVideoName = url.lastPathComponent
            extractedText = ""
            ocrText = ""
            sourceSummary = ""
            vm.clearVideoPreview()
            result = nil
            vm.errorMessage = nil
        } catch {
            vm.errorMessage = error.localizedDescription
        }
    }

    private func runAnalysis() async {
        if pickedVideoURL == nil && !extractedText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            isAnalyzing = true
            vm.errorMessage = nil
            defer { isAnalyzing = false }
            let r = await vm.handleVideoContent(
                ocrText: extractedText,
                visualMetadata: pickedVideoName.map { "File: \($0)" } ?? sourceSummary,
                platform: pickedVideoName ?? "video-demo-platform"
            )
            result = vm.errorMessage == nil ? r : nil
            return
        }

        guard let videoURL = pickedVideoURL else { return }

        isAnalyzing = true
        vm.errorMessage = nil
        defer { isAnalyzing = false }

        do {
            let videoText = try await videoService.transcribeVideo(from: videoURL)
            let mergedText = videoText.mergedText.trimmingCharacters(in: .whitespacesAndNewlines)
            let extractedOCR = videoText.ocrText.trimmingCharacters(in: .whitespacesAndNewlines)
            extractedText = mergedText
            ocrText = extractedOCR
            sourceSummary = videoText.sourceSummary
            vm.updateVideoPreview(videoText)

            guard !mergedText.isEmpty else {
                result = nil
                vm.errorMessage = "Extracted text is empty. Upload a video with readable speech or on-screen content before analyzing."
                return
            }

            let r = await vm.handleVideoContent(
                ocrText: mergedText,
                visualMetadata: pickedVideoName.map { "File: \($0)" },
                platform: nil
            )
            result = vm.errorMessage == nil ? r : nil
        } catch {
            result = nil
            vm.errorMessage = error.localizedDescription
        }
    }

    private func loadInteractiveVideoTestCase() {
        let testCase = vm.prepareInteractiveVideoTestCase()
        pickedVideoName = testCase.platform
        pickedVideoURL = nil
        extractedText = testCase.extractedText
        ocrText = testCase.ocrText
        sourceSummary = testCase.sourceSummary
        result = nil
    }

    private func runExternalAnalysis() async {
        if pickedVideoURL == nil && !extractedText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            isAnalyzing = true
            vm.errorMessage = nil
            defer { isAnalyzing = false }
            do {
                let r = try await vm.handleExternalAnalysis(
                    text: extractedText.trimmingCharacters(in: .whitespacesAndNewlines),
                    modality: .video,
                    sourceHint: pickedVideoName ?? sourceSummary
                )
                result = vm.errorMessage == nil ? r : nil
            } catch {
                result = nil
            }
            return
        }

        guard let videoURL = pickedVideoURL else {
            vm.errorMessage = "Choose a video before running Test External API."
            result = nil
            return
        }

        isAnalyzing = true
        vm.errorMessage = nil
        defer { isAnalyzing = false }

        do {
            let videoText = try await videoService.transcribeVideo(from: videoURL)
            let mergedText = videoText.mergedText.trimmingCharacters(in: .whitespacesAndNewlines)
            let extractedOCR = videoText.ocrText.trimmingCharacters(in: .whitespacesAndNewlines)
            extractedText = mergedText
            ocrText = extractedOCR
            sourceSummary = videoText.sourceSummary
            vm.updateVideoPreview(videoText)

            guard !mergedText.isEmpty else {
                result = nil
                vm.errorMessage = "Extracted text is empty. Upload a video with readable speech or on-screen content before running Test External API."
                return
            }

            let r = try await vm.handleExternalAnalysis(
                text: mergedText,
                modality: .video,
                sourceHint: pickedVideoName ?? sourceSummary
            )
            result = vm.errorMessage == nil ? r : nil
        } catch {
            result = nil
            vm.errorMessage = error.localizedDescription
        }
    }
}

// MARK: - Shared Input Helpers

private func fieldLabel(_ text: String) -> some View {
    Text(text).font(.caption).fontWeight(.semibold).foregroundColor(.secondary).tracking(1)
        .frame(maxWidth: .infinity, alignment: .leading)
}

private func textEditorField(text: Binding<String>, placeholder: String, minHeight: CGFloat) -> some View {
    ZStack(alignment: .topLeading) {
        if text.wrappedValue.isEmpty {
            Text(placeholder).font(.subheadline).foregroundColor(Color(hex: "#AEAEB2")).padding(14)
        }
        TextEditor(text: text)
            .font(.subheadline).scrollContentBackground(.hidden)
            .padding(10).frame(minHeight: minHeight)
    }
    .background(Color(hex: "#F2F2F7")).cornerRadius(10)
    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(hex: "#E5E5EA"), lineWidth: 0.5))
}

// MARK: - Analyze Button

struct AnalyzeButton: View {
    let isAnalyzing: Bool; let disabled: Bool; let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 8) {
                if isAnalyzing {
                    ProgressView().progressViewStyle(.circular).scaleEffect(0.8).tint(.white)
                    Text("Analyzing...")
                } else {
                    Image(systemName: "shield.lefthalf.filled"); Text("Analyze")
                }
            }
            .font(.headline).foregroundColor(.white)
            .frame(maxWidth: .infinity).padding(.vertical, 16)
            .background(disabled ? Color(hex: "#C7C7CC") : Color(hex: "#0A84FF"))
            .cornerRadius(14)
        }.disabled(disabled || isAnalyzing)
    }
}

struct ExternalAnalyzeButton: View {
    let isAnalyzing: Bool; let disabled: Bool; let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 8) {
                if isAnalyzing {
                    ProgressView().progressViewStyle(.circular).scaleEffect(0.8)
                    Text("Testing External...")
                } else {
                    Image(systemName: "network")
                    Text("Test External API")
                }
            }
            .font(.headline)
            .foregroundColor(disabled ? Color(hex: "#8E8E93") : Color(hex: "#0A84FF"))
            .frame(maxWidth: .infinity)
            .padding(.vertical, 14)
            .background(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 14)
                    .stroke(disabled ? Color(hex: "#C7C7CC") : Color(hex: "#0A84FF"), lineWidth: 1)
            )
            .cornerRadius(14)
        }.disabled(disabled || isAnalyzing)
    }
}

struct TestLocalAnalyzeButton: View {
    let title: String
    let isAnalyzing: Bool
    let disabled: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 8) {
                Image(systemName: "cpu")
                Text(title)
            }
            .font(.subheadline.weight(.semibold))
            .foregroundColor(disabled ? Color(hex: "#8E8E93") : Color(hex: "#0A84FF"))
            .frame(maxWidth: .infinity)
            .padding(.vertical, 12)
            .background(Color(hex: "#F2F2F7"))
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(disabled ? Color(hex: "#D1D1D6") : Color(hex: "#0A84FF").opacity(0.35), lineWidth: 1)
            )
            .cornerRadius(12)
        }
        .disabled(disabled || isAnalyzing)
    }
}

// MARK: - Analyze Result Card

struct AnalyzeResultCard: View {
    let score: RiskScore
    let trustedContactSuggestion: TrustedContactSuggestion?
    let onAddTrustedContact: () -> Void
    let onDismissSuggestion: () -> Void

    private var isBlocklistMatch: Bool {
        score.indicators.contains("block rule matched")
    }

    private var isTrustedMatch: Bool {
        score.indicators.contains("trusted contact matched")
    }

    var verdict: (icon: String, text: String) {
        switch score.level {
        case .safe, .low:  return ("checkmark.shield.fill", "Looks Safe")
        case .medium:      return ("exclamationmark.shield.fill", "Suspicious — Be Careful")
        case .high:        return ("xmark.shield.fill", "High Risk — Do Not Engage")
        case .critical:    return ("xmark.shield.fill", "Critical Threat — Block Now")
        }
    }

    var body: some View {
        VStack(spacing: 14) {
            if isBlocklistMatch {
                HStack(spacing: 8) {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .foregroundColor(.white)
                    Text("⚠️ This sender is flagged as risky (Blocklist match)")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding(12)
                .background(Color(hex: "#FF453A"))
                .cornerRadius(12)
            } else if isTrustedMatch {
                HStack(spacing: 8) {
                    Image(systemName: "checkmark.seal.fill")
                        .foregroundColor(Color(hex: "#30D158"))
                    Text("✔ Trusted sender")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(hex: "#30D158"))
                    Spacer()
                }
                .padding(12)
                .background(Color(hex: "#F2F2F7"))
                .cornerRadius(12)
            }

            HStack(spacing: 10) {
                Image(systemName: verdict.icon).font(.title2).foregroundColor(score.level.color)
                Text(verdict.text).font(.headline).foregroundColor(score.level.color)
                Spacer()
                Text(String(format: "%.1f / 10", score.score))
                    .font(.title3).fontWeight(.bold).foregroundColor(score.level.color)
            }
            Divider()
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 3).fill(Color(hex: "#E5E5EA")).frame(height: 6)
                    RoundedRectangle(cornerRadius: 3)
                        .fill(LinearGradient(
                            gradient: Gradient(colors: [
                                Color(hex: "#30D158"), Color(hex: "#FFD60A"),
                                Color(hex: "#FF9F0A"), Color(hex: "#FF453A")]),
                            startPoint: .leading, endPoint: .trailing))
                        .frame(width: geo.size.width * (score.score / 10), height: 6)
                }
            }.frame(height: 6)
            HStack {
                Text(String(format: "Confidence: %.0f%%", score.confidence * 100))
                    .font(.caption).foregroundColor(.secondary)
                Spacer()
                Text(score.modality.displayName).font(.caption).foregroundColor(.secondary)
            }
            Text("Decision Path: Automated Policy + Content Analysis")
                .font(.caption)
                .foregroundColor(.secondary)
                .frame(maxWidth: .infinity, alignment: .leading)
            if let r = score.reasoning {
                Text(r).font(.subheadline).foregroundColor(.primary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(12).background(Color(hex: "#F2F2F7")).cornerRadius(10)
            }
            if !score.indicators.isEmpty {
                VStack(alignment: .leading, spacing: 6) {
                    Text("Indicators").font(.caption).fontWeight(.semibold).foregroundColor(.secondary)
                    Text(score.indicators.joined(separator: " • "))
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            if let suggestion = trustedContactSuggestion {
                VStack(alignment: .leading, spacing: 8) {
                    Text("This sender appears consistently safe. Add to Trusted Contacts?")
                        .font(.subheadline)
                        .foregroundColor(.primary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(suggestion.value)
                        .font(.caption)
                        .foregroundColor(Color(hex: "#0A84FF"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(suggestion.reason)
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    HStack(spacing: 10) {
                        Button("Add", action: onAddTrustedContact)
                            .font(.caption.weight(.semibold))
                            .foregroundColor(.white)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .background(Color(hex: "#0A84FF"))
                            .cornerRadius(10)
                        Button("Not now", action: onDismissSuggestion)
                            .font(.caption.weight(.semibold))
                            .foregroundColor(.secondary)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .background(Color(hex: "#F2F2F7"))
                            .cornerRadius(10)
                    }
                }
                .padding(12)
                .background(Color(hex: "#F2F2F7"))
                .cornerRadius(10)
            }
        }
        .padding(16).background(Color.white).cornerRadius(20)
        .shadow(color: .black.opacity(0.06), radius: 8, x: 0, y: 2)
    }
}

struct DebugChainResultCard: View {
    let result: DebugChainResult

    private var accentColor: Color {
        switch result.state {
        case .success:
            return Color(hex: "#0A84FF")
        case .failure:
            return Color(hex: "#FF453A")
        }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 10) {
                Image(systemName: result.state == .success ? "hammer.circle.fill" : "exclamationmark.triangle.fill")
                    .font(.title3)
                    .foregroundColor(accentColor)
                VStack(alignment: .leading, spacing: 2) {
                    Text(result.title)
                        .font(.headline)
                    Text(result.summary)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                Spacer()
                Text(result.state.rawValue)
                    .font(.caption.weight(.semibold))
                    .foregroundColor(accentColor)
            }

            Text(result.reasoning)
                .font(.subheadline)
                .foregroundColor(.primary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(12)
                .background(Color(hex: "#F2F2F7"))
                .cornerRadius(10)

            if !result.indicators.isEmpty {
                VStack(alignment: .leading, spacing: 6) {
                    Text("Indicators")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.secondary)
                    Text(result.indicators.joined(separator: " • "))
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }

            if !result.details.isEmpty {
                VStack(alignment: .leading, spacing: 6) {
                    Text("Debug Details")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.secondary)
                    ForEach(result.details, id: \.self) { detail in
                        Text(detail)
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }
        }
        .padding(16)
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.06), radius: 8, x: 0, y: 2)
    }
}

// MARK: - History View

struct HistoryView: View {
    @EnvironmentObject var historyStore: HistoryStore
    @State private var showClearConfirm = false
    @State private var selectedHistoryID: UUID? = nil

    var body: some View {
        NavigationView {
            Group {
                if historyStore.historyEvents.isEmpty {
                    VStack(spacing: 12) {
                        Image(systemName: "checkmark.shield.fill")
                            .font(.system(size: 48)).foregroundColor(Color(hex: "#30D158"))
                        Text("No threats detected").foregroundColor(.secondary)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color(hex: "#F2F2F7"))
                } else {
                    List {
                        ForEach(historyStore.historyEvents) { event in
                            EventRow(event: event) {
                                selectedHistoryID = event.id
                            }
                            .listRowBackground(Color.white)
                        }
                        .onDelete { historyStore.remove(at: $0) }
                    }
                    .listStyle(.insetGrouped)
                }
            }
            .navigationTitle("History")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                if !historyStore.historyEvents.isEmpty {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Clear All") { showClearConfirm = true }
                            .foregroundColor(Color(hex: "#FF453A"))
                    }
                }
            }
            .confirmationDialog("Clear all history?", isPresented: $showClearConfirm, titleVisibility: .visible) {
                Button("Clear All", role: .destructive) { historyStore.clear() }
                Button("Cancel", role: .cancel) {}
            }
            .sheet(
                isPresented: Binding(
                    get: { selectedHistoryID != nil },
                    set: { if !$0 { selectedHistoryID = nil } }
                )
            ) {
                if let historyID = selectedHistoryID {
                    HistoryDetailView(historyID: historyID)
                }
            }
        }
    }
}

struct EventRow: View {
    let event: DetectionEvent
    let onDetails: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 12) {
                Image(systemName: event.modality.systemIcon).font(.subheadline)
                    .frame(width: 34, height: 34)
                    .background(event.riskLevel.color.opacity(0.12))
                    .foregroundColor(event.riskLevel.color)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                VStack(alignment: .leading, spacing: 3) {
                    Text(event.summary).font(.subheadline).fontWeight(.medium)
                        .foregroundColor(.primary).lineLimit(2)
                    HStack(spacing: 6) {
                        Text(event.modality.displayName).font(.caption2).foregroundColor(.secondary)
                        if let src = event.sourceHint { Text(src).font(.caption2).foregroundColor(.secondary) }
                        Text(event.timestamp, style: .relative).font(.caption2).foregroundColor(.secondary)
                    }
                }
                Spacer()
                VStack(alignment: .trailing, spacing: 4) {
                    Text(String(format: "%.1f", event.riskScore))
                        .font(.headline).fontWeight(.bold).foregroundColor(event.riskLevel.color)
                    if event.wasBlocked {
                        Text("BLOCKED").font(.system(size: 9)).fontWeight(.bold)
                            .padding(.horizontal, 5).padding(.vertical, 2)
                            .background(Color(hex: "#FF453A").opacity(0.12))
                            .foregroundColor(Color(hex: "#FF453A")).clipShape(Capsule())
                    }
                }
            }
            Button("View Details", action: onDetails)
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundColor(Color(hex: "#0A84FF"))
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.vertical, 4)
    }
}

// MARK: - Settings View

struct SettingsView: View {
    @EnvironmentObject var vm: DashboardViewModel
    @EnvironmentObject var store: PersistenceStore
    @State private var showAddWhitelistSheet = false
    @State private var showAddBlocklistSheet = false

    var body: some View {
        NavigationView {
            List {
                Section("Debug Counts") {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Whitelist count: \(store.whitelist.count)")
                            .font(.subheadline)
                        Text("Blocklist count: \(store.blocklist.count)")
                            .font(.subheadline)
                    }
                    .foregroundColor(.secondary)
                }.listRowBackground(Color.white)

                Section("Detection") {
                    ForEach(MonitorChannelType.allCases, id: \.self) { type in
                        Toggle(type.displayName, isOn: Binding(
                            get: { vm.monitorChannelStatuses.first(where: { $0.type == type })?.isEnabled ?? false },
                            set: { _ in vm.toggleMonitoringChannel(type) }
                        ))
                    }
                }.listRowBackground(Color.white)

                Section {
                    ForEach(store.whitelist) { entry in
                        VStack(alignment: .leading, spacing: 4) {
                            HStack {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(Color(hex: "#30D158")).font(.caption)
                                Text(entry.value).font(.subheadline)
                            }
                            if let primaryMatchValue = entry.primaryMatchValue, !primaryMatchValue.isEmpty {
                                Text("\(entry.matchKind ?? "match"): \(primaryMatchValue)")
                                    .font(.caption2)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                    .onDelete { store.removeWhitelist(at: $0) }

                    Button(action: { showAddWhitelistSheet = true }) {
                        Label("Add Trusted Contact", systemImage: "plus.circle.fill")
                            .foregroundColor(Color(hex: "#0A84FF"))
                    }
                } header: {
                    Text("Whitelist (Trusted Contacts)")
                } footer: {
                    Text("Swipe left on any entry to delete it. Trusted contacts can also be suggested automatically after repeated safe results.")
                }.listRowBackground(Color.white)

                Section {
                    ForEach(store.blocklist) { entry in
                        VStack(alignment: .leading, spacing: 4) {
                            HStack {
                                Image(systemName: "xmark.shield.fill")
                                    .foregroundColor(Color(hex: "#FF453A")).font(.caption)
                                Text(entry.value).font(.subheadline)
                            }
                            if let primaryMatchValue = entry.primaryMatchValue, !primaryMatchValue.isEmpty {
                                Text("\(entry.matchKind ?? "match"): \(primaryMatchValue)")
                                    .font(.caption2)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                    .onDelete { store.removeBlocklist(at: $0) }

                    Button(action: { showAddBlocklistSheet = true }) {
                        Label("Add Blocked Domain", systemImage: "plus.circle.fill")
                            .foregroundColor(Color(hex: "#0A84FF"))
                    }
                } header: {
                    Text("Blocklist")
                } footer: {
                    Text("Blocked domains will immediately return a block match when detected in analyzed text. Swipe left to delete entries.")
                }.listRowBackground(Color.white)

            }
            .id("settings-\(store.whitelist.count)-\(store.blocklist.count)")
            .listStyle(.insetGrouped)
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.large)
            .sheet(isPresented: $showAddWhitelistSheet) {
                AddPolicyListSheet(
                    isPresented: $showAddWhitelistSheet,
                    title: "Add to Whitelist",
                    fieldTitle: "Contact",
                    placeholder: "Email, phone, or domain"
                ) { value, label in
                    PersistenceStore.shared.addWhitelist(value: value, label: label)
                }
            }
            .sheet(isPresented: $showAddBlocklistSheet) {
                AddPolicyListSheet(
                    isPresented: $showAddBlocklistSheet,
                    title: "Add to Blocklist",
                    fieldTitle: "Domain",
                    placeholder: "blocked-domain.example.com"
                ) { value, label in
                    PersistenceStore.shared.addBlocklist(value: value, label: label)
                }
            }
        }
    }
}

struct AddPolicyListSheet: View {
    @Binding var isPresented: Bool
    let title: String
    let fieldTitle: String
    let placeholder: String
    let onAdd: (String, String?) -> Void
    @State private var value = ""
    @State private var label = ""

    var body: some View {
        NavigationView {
            Form {
                Section(fieldTitle) {
                    TextField(placeholder, text: $value)
                        .autocorrectionDisabled().textInputAutocapitalization(.never)
                }
            }
            .navigationTitle(title).navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) { Button("Cancel") { isPresented = false } }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add") { onAdd(value, nil); isPresented = false }
                        .disabled(value.trimmingCharacters(in: .whitespaces).isEmpty)
                }
            }
        }
    }
}

// MARK: - Shared Components

struct SectionHeaderView: View {
    let title: String
    var body: some View {
        Text(title.uppercased()).font(.caption).fontWeight(.semibold)
            .foregroundColor(.secondary).tracking(1)
    }
}
