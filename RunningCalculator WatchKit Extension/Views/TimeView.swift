import SwiftUI

struct TimeView: View {
    @AppStorage("distanceKey") var distanceKey: String = "Marathon"
    @AppStorage("paceUnit") var paceUnit: String = "miles"
    @AppStorage("paceSeconds") var paceSeconds: Int = 6 * 60 + 45
    //@EnvironmentObject var viewModel: ViewModel

    private var time: String {
        let d = Distance(key: distanceKey)
        let distance = paceUnit == "km" ? d.kilometers : d.miles
        let totalSeconds = Int((distance * Double(paceSeconds)).rounded())
        return Time(totalSeconds: totalSeconds, includeHours: true).string
    }

    var body: some View {
        VStack {
            DistanceInput(distanceKey: $distanceKey)
            Divider()
            TimeInput(
                label: "Pace (min/\(paceUnit))",
                totalSeconds: $paceSeconds
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
