import SwiftUI

struct SettingsView: View {
    @AppStorage("distanceUnit") var distanceUnit: String = "miles"

    var body: some View {
        UnitInput(label: "Distance Unit", selection: $distanceUnit)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
