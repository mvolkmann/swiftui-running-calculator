import SwiftUI

@main
struct RunningCalculatorApp: App {
    @StateObject private var viewModel = ViewModel()

    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                Splash()
            }
            .environmentObject(viewModel)
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
