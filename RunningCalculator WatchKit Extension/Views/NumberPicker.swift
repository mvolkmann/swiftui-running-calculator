import SwiftUI

struct NumberPicker: View {
    var label: String?
    var min: Int = 0
    var max: Int = 10
    var onChange: (Int) -> Void = {_ in }
    @Binding var selection: Int

    var body: some View {
        VStack {
            if let label = label {
                Label(label, bold: true)
            }
            Picker("", selection: $selection) {
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
