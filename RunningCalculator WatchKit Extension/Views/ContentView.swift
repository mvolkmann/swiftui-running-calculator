import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: PaceView()) {
                    Text("Calculate Pace")
                }
                NavigationLink(destination: TimeView()) {
                    Text("Calculate Time")
                }
                NavigationLink(destination: DistanceView()) {
                    Text("Calculate Distance")
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
