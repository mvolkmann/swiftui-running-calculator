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
                    Text("Pace").fontWeight(.bold).foregroundColor(.red)
                }
                NavigationLink(destination: TimeView()) {
                    Text("Time").fontWeight(.bold).foregroundColor(.green)
                }
                NavigationLink(destination: DistanceView()) {
                    Text("Distance").fontWeight(.bold).foregroundColor(.blue)
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
