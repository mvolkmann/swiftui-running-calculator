import SwiftUI

struct UnitInput: View {
    var label: String?
    @Binding var selection: String

    let units = ["km", "mile"]

    var body: some View {
        VStack {
            if let label = label { Text(label) }
            Picker("", selection: $selection) {
                ForEach(units, id: \.self) { unit in
                    Text(unit)
                }
            }
            .labelsHidden()
            .frame(height: pickerHeight)
        }
    }
}

struct UnitInput_Previews: PreviewProvider {
    struct Preview: View {
        @State var unit = "mile"

        var body: some View {
            VStack {
                UnitInput(label: "Pace Unit", selection: $unit)
                Text("You selected \(unit).")
            }
        }
    }
    static var previews: some View {
        Preview()
    }
}
