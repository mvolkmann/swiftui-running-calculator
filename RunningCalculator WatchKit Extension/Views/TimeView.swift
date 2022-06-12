import SwiftUI

struct TimeView: View {
    @EnvironmentObject var viewModel: ViewModel

    private var time: String {
        let miles = Distance(key: viewModel.distanceKey).miles
        let totalSeconds = Int((miles * Double(viewModel.paceSeconds)).rounded())
        return Time(totalSeconds: totalSeconds, includeHours: true).string
    }

    var body: some View {
        VStack {
            DistanceInput(distanceKey: $viewModel.distanceKey)
            Divider()
            TimeInput(
                label: "Pace",
                totalSeconds: $viewModel.paceSeconds
            )
            Divider()
            Label("Time is \(time).", bold: true)
                .foregroundColor(.yellow)
        }
    }
}

struct TimeView_Previews: PreviewProvider {
    static var previews: some View {
        TimeView()
    }
}