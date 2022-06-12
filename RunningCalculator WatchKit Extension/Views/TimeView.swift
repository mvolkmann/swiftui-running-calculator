import SwiftUI

struct TimeView: View {
    @EnvironmentObject var viewModel: ViewModel

    private var time: String {
        let d = Distance(key: viewModel.distanceKey)
        let distance = viewModel.paceUnit == "km" ? d.kilometers : d.miles
        let totalSeconds = Int((distance * Double(viewModel.paceSeconds)).rounded())
        return Time(totalSeconds: totalSeconds, includeHours: true).string
    }

    var body: some View {
        VStack {
            DistanceInput(distanceKey: $viewModel.distanceKey)
            Divider()
            TimeInput(
                label: "Pace (min/\(viewModel.paceUnit))",
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
