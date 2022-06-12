import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                /*
                NavigationLink(destination: SettingsView()) {
                    Text("Settings")
                }
                */
                NavigationLink(destination: PaceView()) {
                    Text("Pace")
                }
                NavigationLink(destination: TimeView()) {
                    Text("Time")
                }
                NavigationLink(destination: DistanceView()) {
                    Text("Distance")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
