import SwiftUI
import UniformTypeIdentifiers

struct TextAnalysisView: View {
    @StateObject private var logic = AnalysisLogic()
    @State private var isImporterPresented = false

    var body: some View {
        VStack(spacing: 20) {
            Text("Text Upload Test")
                .font(.title)

            Button("Choose text file") {
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
            allowedContentTypes: [.plainText, .text, .commaSeparatedText],
            allowsMultipleSelection: false
        ) { result in
            handleFileSelection(result: result)
        }
    }

    private func handleFileSelection(result: Result<[URL], Error>) {
        switch result {
        case .success(let urls):
            guard let selectedURL = urls.first else {
                logic.resultMessage = "No file selected"
                return
            }

            let didAccess = selectedURL.startAccessingSecurityScopedResource()

            Task {
                defer {
                    if didAccess {
                        selectedURL.stopAccessingSecurityScopedResource()
                    }
                }
                await logic.uploadTextFile(fileURL: selectedURL)
            }

        case .failure(let error):
            logic.resultMessage = "File selection failed: \(error.localizedDescription)"
        }
    }
}
