import SwiftUI

struct PaceView: View {
    @EnvironmentObject var viewModel: ViewModel

    private var pace: String {
        let d = Distance(key: viewModel.distanceKey)
        let distance = viewModel.paceUnit == "km" ? d.kilometers : d.miles
        if distance == 0 { return "unknown" }
        let pace = Int((Double(viewModel.totalSeconds) / distance).rounded())
        return Time(totalSeconds: pace).string
    }

    var body: some View {
        VStack {
            DistanceInput(distanceKey: $viewModel.distanceKey)
            Divider()
            TimeInput(
                label: "Time",
                includeHours: true,
                totalSeconds: $viewModel.totalSeconds
            )
            Divider()
            Label("Pace is \(pace) per \(viewModel.paceUnit).", bold: true)
                .foregroundColor(.yellow)
        }
    }
}

struct PaceView_Previews: PreviewProvider {
    static var previews: some View {
        PaceView()
    }
}
