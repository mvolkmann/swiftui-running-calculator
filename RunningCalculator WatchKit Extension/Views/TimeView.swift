import SwiftUI

struct TimeView: View {
    @State var distanceKey = "Marathon"
    @State var time = ""
    @State var paceSeconds = 0

    var body: some View {
        VStack {
            DistanceInput(distanceKey: $distanceKey)
            TimeInput(
                label: "Pace",
                totalSeconds: $paceSeconds
            )
            if time.isEmpty {
                Button("Calculate Time", action: calculateTime)
            } else {
                Text("Time is \(time)")
            }
        }
    }

    func calculateTime() {
        let miles = distanceMap[distanceKey]!
        let totalSeconds = Int((miles * Double(paceSeconds)).rounded())
        time = timeString(for: totalSeconds)
    }

}

struct TimeView_Previews: PreviewProvider {
    static var previews: some View {
        TimeView()
    }
}
