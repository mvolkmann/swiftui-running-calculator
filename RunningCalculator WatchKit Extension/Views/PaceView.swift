import SwiftUI

struct PaceView: View {
    @AppStorage("customDistance") var customDistance: Int = 1
    @AppStorage("customUnit") var customUnit: String = "km"
    @AppStorage("distanceKey") var distanceKey: String = "Marathon"
    @AppStorage("distanceUnit") var distanceUnit: String = "mile"
    @AppStorage("totalSeconds") var totalSeconds: Int = (2 * 60 + 57) * 60 + 11

    private var pace: String {
        var distance = 0.0
        if distanceKey == "Custom" {
            distance = Double(customDistance)
            if customUnit == "km" { distance *= Distance.kmPerMile }
        } else {
            let d = Distance(key: distanceKey)
            distance = distanceUnit == "mile" ? d.miles : d.kilometers
        }
        if distance == 0 { return "unknown" }

        let paceSeconds = Int((Double(totalSeconds) / distance).rounded())
        return Time(totalSeconds: paceSeconds).string + "/" + distanceUnit
    }

    var body: some View {
        VStack {
            DistanceInput(distanceKey: $distanceKey)
            TimeInput(
                label: "Time",
                includeHours: true,
                totalSeconds: $totalSeconds
            )
            Label("Pace: \(pace)", bold: true)
                .foregroundColor(.yellow)
        }
        .padding(.top, topPadding)
    }
}

struct PaceView_Previews: PreviewProvider {
    static var previews: some View {
        PaceView()
    }
}
