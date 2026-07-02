import SwiftUI

struct HistoryDetailView: View {
    let historyID: UUID
    @Environment(\.dismiss) private var dismiss
    @State private var feedbackMessage: String?

    private let historyService = HistoryService.shared

    var body: some View {
        NavigationView {
            Group {
                if let event = historyService.getHistoryDetail(id: historyID) {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 16) {
                            detailSection(title: "Summary") {
                                Text(event.summary)
                                    .font(.body)
                                    .foregroundColor(.primary)
                            }

                            detailSection(title: "Metadata") {
                                detailRow("Time", value: event.timestamp.formatted(date: .abbreviated, time: .shortened))
                                detailRow("Modality", value: event.modality.displayName)
                                detailRow("Source", value: event.sourceHint ?? "—")
                                detailRow("Subject", value: event.metadata?["subject"] ?? "—")
                                detailRow("Risk Score", value: String(format: "%.1f", event.riskScore))
                                detailRow("Verdict", value: event.verdict ?? event.riskLevel.label)
                                detailRow("Risk Level", value: event.riskLevel.label)
                                detailRow("Match Kind", value: resolvedPolicyEntry(for: event)?.matchKind ?? event.metadata?["matchKind"] ?? "—")
                                detailRow("Primary Match Value", value: resolvedPolicyEntry(for: event)?.primaryMatchValue ?? event.metadata?["primaryMatchValue"] ?? "—")
                                detailRow("Model Used", value: event.modelUsedDescription ?? "—")
                            }

                            detailSection(title: "Actions") {
                                if let feedbackMessage {
                                    Text(feedbackMessage)
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }

                                Button("Add to Whitelist") {
                                    feedbackMessage = historyService.addHistoryEventToWhitelist(id: historyID).message
                                }
                                .buttonStyle(.borderedProminent)
                                .tint(Color(hex: "#30D158"))

                                Button("Add to Blocklist") {
                                    feedbackMessage = historyService.addHistoryEventToBlocklist(id: historyID).message
                                }
                                .buttonStyle(.borderedProminent)
                                .tint(Color(hex: "#FF453A"))
                            }

                            detailSection(title: "Original Input") {
                                Text(event.inputText.isEmpty ? "—" : event.inputText)
                                    .font(.body)
                                    .foregroundColor(.primary)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }

                            detailSection(title: "Reasoning") {
                                Text(event.reason)
                                    .font(.body)
                                    .foregroundColor(.primary)
                            }

                            detailSection(title: "Indicators") {
                                if event.indicators.isEmpty {
                                    Text("—")
                                        .foregroundColor(.secondary)
                                } else {
                                    ForEach(event.indicators, id: \.self) { indicator in
                                        Text(indicator)
                                            .font(.subheadline)
                                            .foregroundColor(.primary)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                    }
                                }
                            }

                            if let metadata = event.metadata, !metadata.isEmpty {
                                detailSection(title: "Metadata Details") {
                                    ForEach(metadata.keys.sorted(), id: \.self) { key in
                                        detailRow(key, value: metadata[key] ?? "—")
                                    }
                                }
                            }
                        }
                        .padding(16)
                    }
                    .background(Color(hex: "#F2F2F7").ignoresSafeArea())
                } else {
                    VStack(spacing: 12) {
                        Image(systemName: "exclamationmark.triangle.fill")
                            .font(.system(size: 36))
                            .foregroundColor(Color(hex: "#FF9F0A"))
                        Text("History detail unavailable")
                            .font(.headline)
                        Text("This history item could not be found.")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color(hex: "#F2F2F7").ignoresSafeArea())
                }
            }
            .navigationTitle("History Details")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }
                }
            }
        }
    }

    @ViewBuilder
    private func detailSection<Content: View>(title: String, @ViewBuilder content: () -> Content) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundColor(.secondary)
                .tracking(1)
            content()
        }
        .padding(16)
        .background(Color.white)
        .cornerRadius(16)
    }

    private func detailRow(_ title: String, value: String) -> some View {
        HStack(alignment: .top) {
            Text(title)
                .font(.subheadline)
                .foregroundColor(.secondary)
            Spacer()
            Text(value)
                .font(.subheadline)
                .foregroundColor(.primary)
                .multilineTextAlignment(.trailing)
        }
    }

    private func resolvedPolicyEntry(for event: DetectionEvent) -> WhitelistEntry? {
        historyService.resolvePolicyEntry(for: event)
    }
}
