import SwiftUI
import UniformTypeIdentifiers

struct AudioUploadView: View {
    @StateObject private var logic = AnalysisLogic()
    @State private var isImporterPresented = false

    var body: some View {
        VStack(spacing: 20) {
            Text("Audio Upload Test")
                .font(.title)

            Button("Choose audio file") {
                isImporterPresented = true
            }

            if logic.isLoading {
                ProgressView()
            }

            ScrollView {
                Text(logic.resultMessage)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
            }

            Spacer()
        }
        .padding()
        .fileImporter(
            isPresented: $isImporterPresented,
            allowedContentTypes: [.audio, .mpeg4Audio, .mp3],
            allowsMultipleSelection: false
        ) { result in
            handleAudioSelection(result: result)
        }
    }

    private func handleAudioSelection(result: Result<[URL], Error>) {
        switch result {
        case .success(let urls):
            guard let selectedURL = urls.first else {
                logic.resultMessage = "No audio selected"
                return
            }

            let didAccess = selectedURL.startAccessingSecurityScopedResource()

            Task {
                defer {
                    if didAccess {
                        selectedURL.stopAccessingSecurityScopedResource()
                    }
                }
                await logic.uploadAudioFile(fileURL: selectedURL)
            }

        case .failure(let error):
            logic.resultMessage = "Audio selection failed: \(error.localizedDescription)"
        }
    }
}
