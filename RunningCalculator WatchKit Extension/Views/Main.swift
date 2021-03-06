import SwiftUI

// After all layout changes, verify that the UI
// looks good in the Series 6 40mm Simulator.
let pickerHeight: CGFloat = 30
let topPadding: CGFloat = 20

struct MainView: View {
    var body: some View {
        VStack {
            Text("Calculate what?")
            HStack {
                NavigationLink(destination: PaceView()) {
                    Text("Pace").foregroundColor(.red).fontWeight(.bold)
                }
                NavigationLink(destination: TimeView()) {
                    Text("Time").foregroundColor(.green).fontWeight(.bold)
                }
            }
            NavigationLink(destination: DistanceView()) {
                Text("Distance").foregroundColor(.blue).fontWeight(.bold)
            }
            NavigationLink(destination: SettingsView()) {
                Text("Settings").foregroundColor(.gray)
            }
        }
        .font(.system(size: 18))
        .navigationBarHidden(true)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
