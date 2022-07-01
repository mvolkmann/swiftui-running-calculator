import SwiftUI

struct TimeView: View {
    @AppStorage("customDistance") var customDistance: Int = 1
    @AppStorage("customUnit") var customUnit: String = "kms"
    @AppStorage("distanceKey") var distanceKey: String = "Marathon"
    @AppStorage("distanceUnit") var distanceUnit: String = "miles"
    @AppStorage("isCustom") var isCustom = false
    @AppStorage("paceSeconds") var paceSeconds: Int = 6 * 60 + 45

    // Same computed property is in PaceView.
    private var distance: Double {
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
        return distance
    }

    private var time: String {
        guard distance > 0 else { return "unknown" }

        let totalSeconds = Int((distance * Double(paceSeconds)).rounded())
        return Time(totalSeconds: totalSeconds, includeHours: true).string
    }

    var body: some View {
        VStack {
            DistanceInput(distanceKey: $distanceKey)
            TimeInput(
                label: "Pace per \(distanceUnit.prefix(distanceUnit.count - 1))",
                totalSeconds: $paceSeconds
            )
            Label("Time: \(time)", bold: true)
                .foregroundColor(.yellow)
        }
        .padding(.top, topPadding)
    }
}

struct TimeView_Previews: PreviewProvider {
    static var previews: some View {
        TimeView()
    }
}
