//
//  RunningCalculatorApp.swift
//  RunningCalculator WatchKit Extension
//
//  Created by Mark Volkmann on 6/10/22.
//

import SwiftUI

@main
struct RunningCalculatorApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
