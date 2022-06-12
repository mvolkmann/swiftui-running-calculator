import SwiftUI

struct DistanceView: View {
    @State var distance: Double = 0
    @State var paceSeconds = 0
    @State var timeSeconds = 0

    var body: some View {
        VStack {
            TimeInput(
                label: "Time",
                includeHours: true,
                totalSeconds: $timeSeconds
            )
            TimeInput(
                label: "Pace",
                totalSeconds: $paceSeconds
            )
            if distance == 0 {
                Button("Calculate Distance", action: calculateDistance)
            } else {
                Text("Distance is \(distance.places(2)) miles")
            }
        }
    }

    func calculateDistance() {
        distance = Double(timeSeconds) / Double(paceSeconds)
    }
}

struct DistanceView_Previews: PreviewProvider {
    static var previews: some View {
        DistanceView()
    }
}
