import SwiftUI

struct NumberPicker: View {
    typealias OnChange = (Int) -> Void

    var label: String
    var min: Int = 0
    var max: Int = 10
    var onChange: OnChange = {_ in }
    @Binding var selection: Int

    var body: some View {
        VStack {
            Label(label, bold: true)
            Picker(label, selection: $selection) {
                ForEach(min...max, id: \.self) { value in
                    Text("\(value)")
                }
            }
            .onChange(of: selection, perform: onChange)
            .labelsHidden()
            .frame(height: pickerHeight)
        }
    }
}

struct NumberPicker_Previews: PreviewProvider {
    struct Preview: View {
        @State private var value = 1

        var body: some View {
            VStack {
            NumberPicker(
                label: "Test",
                min: 1,
                max: 5,
                onChange: { value in print("changed to \(value)") },
                selection: $value
            )
                Text("You selected \(value).")
            }
        }
    }

    static var previews: some View {
        Preview()
    }
}
