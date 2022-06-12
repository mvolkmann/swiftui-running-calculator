import SwiftUI

struct PaceView: View {
    @State var distanceKey = "Marathon"
    @State var pace = ""
    @State var totalSeconds = ((2 * 60) + 57) * 60 + 11 // 0

    var body: some View {
        VStack {
            DistanceInput(distanceKey: $distanceKey)
            TimeInput(includeHours: true, totalSeconds: $totalSeconds)
            if pace.isEmpty {
                Button("Calculate Pace", action: calculatePace)
            } else {
                Text("Pace is \(pace) per mile")
            }
        }
    }

    func calculatePace() {
        let miles = distanceMap[distanceKey]!
        let secondsPerMile = Int((Double(totalSeconds) / miles).rounded())
        pace = timeString(for: secondsPerMile)
    }
}

struct PaceView_Previews: PreviewProvider {
    static var previews: some View {
        PaceView()
    }
}
