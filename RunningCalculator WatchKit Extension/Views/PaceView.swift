import SwiftUI

struct PaceView: View {
    @AppStorage("distanceKey") var distanceKey: String = "Marathon"
    @AppStorage("paceUnit") var paceUnit: String = "miles"
    @AppStorage("totalSeconds") var totalSeconds: Int = (2 * 60 + 57) * 60 + 11
    //@EnvironmentObject var viewModel: ViewModel

    private var pace: String {
        let d = Distance(key: distanceKey)
        let distance = paceUnit == "km" ? d.kilometers : d.miles
        if distance == 0 { return "unknown" }
        let pace = Int((Double(totalSeconds) / distance).rounded())
        return Time(totalSeconds: pace).string
    }

    var body: some View {
        VStack {
            DistanceInput(distanceKey: $distanceKey)
            Divider()
            TimeInput(
                label: "Time",
                includeHours: true,
                totalSeconds: $totalSeconds
            )
            Divider()
            Label("Pace is \(pace) per \(paceUnit).", bold: true)
                .foregroundColor(.yellow)
        }
    }
}

struct PaceView_Previews: PreviewProvider {
    static var previews: some View {
        PaceView()
    }
}
