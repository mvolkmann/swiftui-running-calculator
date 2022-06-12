import SwiftUI

struct DistanceView: View {
    @AppStorage("paceSeconds") var paceSeconds: Int = 6 * 60 + 45
    @AppStorage("paceUnit") var paceUnit: String = "miles"
    @AppStorage("totalSeconds") var totalSeconds: Int = (2 * 60 + 57) * 60 + 11
    //@EnvironmentObject var viewModel: ViewModel

    var distance: Double {
        //viewModel.paceSeconds == 0 ?
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
            Divider()
            TimeInput(
                label: "Pace (min/\(paceUnit))",
                totalSeconds: $paceSeconds
            )
            Divider()
            Label(
                "Distance is \(distance.places(2)) \(paceUnit)s.",
                bold: true
            )
                .foregroundColor(.yellow)
        }
    }
}

struct DistanceView_Previews: PreviewProvider {
    static var previews: some View {
        DistanceView()
    }
}
