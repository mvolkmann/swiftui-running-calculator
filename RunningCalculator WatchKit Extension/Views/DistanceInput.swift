import SwiftUI

struct DistanceInput: View {
    @Binding var distanceKey: String

    @AppStorage("isCustom") var isCustom = false

    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("Std").onTapGesture { isCustom = false }
                    Toggle("", isOn: $isCustom).labelsHidden()
                    Text("Custom").onTapGesture { isCustom = true }
                }
                //Label("Distance", bold: true)
                if isCustom {
                    CustomDistance()
                } else {
                    Picker("Distance", selection: $distanceKey) {
                        ForEach(Array(Distance.keys), id: \.self) { value in
                            Text(value)
                        }
                    }
                    .labelsHidden()
                    .frame(height: pickerHeight)
                }
            }
        }
    }
}

struct DistanceInput_Previews: PreviewProvider {
    struct Preview: View {
        @State var distanceKey = ""

        var body: some View {
            VStack {
                DistanceInput(distanceKey: $distanceKey)
                Text("name = \(distanceKey)")
                Text("miles = \(Distance(key: distanceKey).miles)")
            }
        }
    }

    static var previews: some View {
        Preview()
    }
}
