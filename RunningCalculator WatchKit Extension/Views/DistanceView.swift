import SwiftUI

struct DistanceView: View {
    @AppStorage("distanceUnit") var distanceUnit: String = "miles"
    @AppStorage("paceSeconds") var paceSeconds: Int = 6 * 60 + 45
    @AppStorage("totalSeconds") var totalSeconds: Int = (2 * 60 + 57) * 60 + 11

    var distance: Double {
        paceSeconds == 0 ?
            0 :
            Double(totalSeconds) / Double(paceSeconds)
    }

    var body: some View {
        VStack {
            TimeInput(
                label: "Time",
                includeHours: true,
                totalSeconds: $totalSeconds
            )
            TimeInput(
                label: "Pace per \(distanceUnit)",
                totalSeconds: $paceSeconds
            )
            Label(
                "\(distance.places(2)) \(distanceUnit)s",
                bold: true
            )
                .foregroundColor(.yellow)
        }
        .padding(.top, topPadding + 11)
    }
}

struct DistanceView_Previews: PreviewProvider {
    static var previews: some View {
        DistanceView()
    }
}
