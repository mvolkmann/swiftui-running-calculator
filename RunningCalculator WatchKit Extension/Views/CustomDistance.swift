import SwiftUI

struct CustomDistance: View {
    @AppStorage("customDistance") var customDistance: String = ""
    @AppStorage("customUnit") var customUnit: String = "km"

    var body: some View {
        VStack {
            UnitInput(label: "Distance Unit", selection: $customUnit)
            TextField("Distance", text: $customDistance)
            Text("Your custom distance is \(customDistance) \(customUnit)s")
        }
    }
}

struct CustomDistance_Previews: PreviewProvider {
    static var previews: some View {
        CustomDistance()
    }
}
