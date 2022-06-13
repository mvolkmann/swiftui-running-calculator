import SwiftUI

struct PaceView: View {
    @AppStorage("distanceKey") var distanceKey: String = "Marathon"
    @AppStorage("distanceUnit") var distanceUnit: String = "mile"
    @AppStorage("totalSeconds") var totalSeconds: Int = (2 * 60 + 57) * 60 + 11
    //@EnvironmentObject var viewModel: ViewModel

    private var pace: String {
        let d = Distance(key: distanceKey)
        let distance = distanceUnit == "mile" ? d.miles : d.kilometers
        if distance == 0 { return "unknown" }
        let pace = Int((Double(totalSeconds) / distance).rounded())
        return Time(totalSeconds: pace).string + "/" + distanceUnit
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
