import SwiftUI

@main
struct RunningCalculatorApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                Splash()
            }
        }

        WKNotificationScene(
            controller: NotificationController.self,
            category: "myCategory"
        )
    }
}
