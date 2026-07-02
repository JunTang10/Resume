import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            VStack {
                Text("TEXT TAB")
                    .font(.largeTitle)
                TextAnalysisView()
            }
            .tabItem {
                Label("Text", systemImage: "doc.text")
            }

            VStack {
                Text("AUDIO TAB")
                    .font(.largeTitle)
                AudioUploadView()
            }
            .tabItem {
                Label("Audio", systemImage: "waveform")
            }

            VStack {
                Text("VIDEO TAB")
                    .font(.largeTitle)
                VideoUploadView()
            }
            .tabItem {
                Label("Video", systemImage: "video")
            }
        }
    }
}
