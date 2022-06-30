import SwiftUI

struct UnitInput: View {
    var label: String
    @Binding var selection: String

    let units = ["mile", "km"]

    var body: some View {
        VStack {
            Text(label)
            Picker(label, selection: $selection) {
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
        @State var unit = "miles"

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
