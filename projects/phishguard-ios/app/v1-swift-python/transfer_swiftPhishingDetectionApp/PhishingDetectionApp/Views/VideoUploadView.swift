
import SwiftUI
import UniformTypeIdentifiers

struct VideoUploadView: View {
    @StateObject private var logic = AnalysisLogic()
    @State private var isImporterPresented = false

    var body: some View {
        VStack(spacing: 20) {
            Text("Video Upload Test")
                .font(.title)

            Button("Choose video file") {
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
            allowedContentTypes: [.movie, .video, .item],
            allowsMultipleSelection: false
        ) { result in
            handleVideoSelection(result: result)
        }
    }

    private func handleVideoSelection(result: Result<[URL], Error>) {
        switch result {
        case .success(let urls):
            guard let selectedURL = urls.first else {
                logic.resultMessage = "No video selected"
                return
            }

            let didAccess = selectedURL.startAccessingSecurityScopedResource()

            Task {
                defer {
                    if didAccess {
                        selectedURL.stopAccessingSecurityScopedResource()
                    }
                }
                await logic.uploadVideoFile(fileURL: selectedURL)
            }

        case .failure(let error):
            logic.resultMessage = "Video selection failed: \(error.localizedDescription)"
        }
    }
}
