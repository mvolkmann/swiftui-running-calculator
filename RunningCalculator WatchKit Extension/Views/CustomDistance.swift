import SwiftUI

struct CustomDistance: View {
    @AppStorage("customDistance") var customDistance: Int = 1
    @AppStorage("customUnit") var customUnit: String = "km"

    var body: some View {
        VStack {
            HStack {
                NumberPicker(
                    label: "Distance",
                    min: 1,
                    max: 100,
                    selection: $customDistance
                )
                UnitInput(label: "Unit", selection: $customUnit)
            }
            Text("\(customDistance) \(customUnit)s")
        }
    }
}

struct CustomDistance_Previews: PreviewProvider {
    static var previews: some View {
        CustomDistance()
    }
}
