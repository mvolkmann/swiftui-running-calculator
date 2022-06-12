import SwiftUI

struct SettingsView: View {
    @AppStorage("paceUnit") var paceUnit: String = "miles"
    //@EnvironmentObject var viewModel: ViewModel

    let paceUnits = ["mile", "km"] // minutes per

    var body: some View {
        Text("Pace Units")
        Picker("Pace Units", selection: $paceUnit) {
            ForEach(paceUnits, id: \.self) { unit in
                Text("minutes per \(unit)")
            }
        }
        .labelsHidden()
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
