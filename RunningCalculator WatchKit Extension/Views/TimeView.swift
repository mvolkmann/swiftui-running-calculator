import SwiftUI

struct TimeView: View {
    @AppStorage("distanceKey") var distanceKey: String = "Marathon"
    @AppStorage("distanceUnit") var distanceUnit: String = "mile"
    @AppStorage("paceSeconds") var paceSeconds: Int = 6 * 60 + 45
    //@EnvironmentObject var viewModel: ViewModel

    private var time: String {
        let d = Distance(key: distanceKey)
        let distance = distanceUnit == "mile" ? d.miles : d.kilometers
        let totalSeconds = Int((distance * Double(paceSeconds)).rounded())
        return Time(totalSeconds: totalSeconds, includeHours: true).string
    }

    var body: some View {
        VStack {
            DistanceInput(distanceKey: $distanceKey)
            TimeInput(
                label: "Pace per \(distanceUnit)",
                totalSeconds: $paceSeconds
            )
            Label("Time: \(time)", bold: true)
                .foregroundColor(.yellow)
        }
        .padding(.top, topPadding)
    }
}

struct TimeView_Previews: PreviewProvider {
    static var previews: some View {
        TimeView()
    }
}
