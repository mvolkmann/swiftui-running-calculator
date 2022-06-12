import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    NavigationLink(destination: SettingsView()) {
                        Text("Settings").foregroundColor(.gray)
                    }
                    NavigationLink(destination: PaceView()) {
                        Text("Pace").foregroundColor(.red).fontWeight(.bold)
                    }
                }
                HStack {
                    NavigationLink(destination: TimeView()) {
                        Text("Time").foregroundColor(.green).fontWeight(.bold)
                    }
                    NavigationLink(destination: DistanceView()) {
                        Text("Distance").foregroundColor(.blue).fontWeight(.bold)
                    }
                }
            }
            .font(.system(size: 16))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
