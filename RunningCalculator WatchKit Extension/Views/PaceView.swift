import SwiftUI

struct PaceView: View {
    @EnvironmentObject var viewModel: ViewModel

    private var pace: String {
        let miles = Distance(key: viewModel.distanceKey).miles
        if miles == 0 { return "unknown" }
        let pace = Int((Double(viewModel.totalSeconds) / miles).rounded())
        return Time(totalSeconds: pace).string
    }

    var body: some View {
        VStack {
            DistanceInput(distanceKey: $viewModel.distanceKey)
            TimeInput(
                label: "Time",
                includeHours: true,
                totalSeconds: $viewModel.totalSeconds
            )
            Text("Pace is \(pace) per mile.")
                .font(.headline)
                .foregroundColor(.yellow)
        }
    }
}

struct PaceView_Previews: PreviewProvider {
    static var previews: some View {
        PaceView()
    }
}
