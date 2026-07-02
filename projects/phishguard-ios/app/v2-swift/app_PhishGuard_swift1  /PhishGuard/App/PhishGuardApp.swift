import SwiftUI

@main
struct PhishGuardApp: App {
    private var isRunningTests: Bool {
        ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil
    }

    var body: some Scene {
        WindowGroup {
            if isRunningTests {
                TestHostView()
            } else {
                ContentView()
            }
        }
    }
}

private struct TestHostView: View {
    var body: some View {
        Color.clear
    }
}
