import SwiftUI

struct PaceView: View {
    @AppStorage("customDistance") var customDistance: Int = 1
    @AppStorage("customUnit") var customUnit: String = "kms"
    @AppStorage("distanceKey") var distanceKey: String = "Marathon"
    @AppStorage("distanceUnit") var distanceUnit: String = "miles"
    @AppStorage("isCustom") var isCustom = false
    @AppStorage("totalSeconds") var totalSeconds: Int = (2 * 60 + 57) * 60 + 11

    private var pace: String {
        var distance = 0.0
        if isCustom {
            distance = Double(customDistance)
            if customUnit != distanceUnit {
                if distanceUnit == "miles" {
                    distance *= Distance.milesPerKm
                } else {
                    distance *= Distance.kmsPerMile
                }
            }
        } else {
            let d = Distance(key: distanceKey)
            distance = distanceUnit == "miles" ? d.miles : d.kilometers
        }
        if distance == 0 { return "unknown" }

        let paceSeconds = Int((Double(totalSeconds) / distance).rounded())
        let singular = distanceUnit.prefix(distanceUnit.count - 1)
        return Time(totalSeconds: paceSeconds).string + "/\(singular)"
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
