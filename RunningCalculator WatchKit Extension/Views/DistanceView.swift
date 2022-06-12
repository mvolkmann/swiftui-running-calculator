import SwiftUI

struct DistanceView: View {
    @EnvironmentObject var viewModel: ViewModel

    var distance: Double {
        viewModel.paceSeconds == 0 ?
            0 :
            Double(viewModel.totalSeconds) / Double(viewModel.paceSeconds)
    }

    var body: some View {
        VStack {
            TimeInput(
                label: "Time",
                includeHours: true,
                totalSeconds: $viewModel.totalSeconds
            )
            Divider()
            TimeInput(
                label: "Pace",
                totalSeconds: $viewModel.paceSeconds
            )
            Divider()
            Label("Distance is \(distance.places(2)) miles.", bold: true)
                .foregroundColor(.yellow)
        }
    }
}

struct DistanceView_Previews: PreviewProvider {
    static var previews: some View {
        DistanceView()
    }
}
