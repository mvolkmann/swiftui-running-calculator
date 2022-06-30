import SwiftUI

struct DistanceInput: View {
    @Binding var distanceKey: String

    @State private var showCustom = false

    var body: some View {
        ZStack {
            LogicLink(isActive: $showCustom) {
                CustomDistance()
            }
            VStack {
                Label("Distance", bold: true)
                Picker("Distance", selection: $distanceKey) {
                    ForEach(Array(Distance.keys), id: \.self) { value in
                        Text(value)
                    }
                }
                .onChange(of: distanceKey) { _ in
                    print("distanceKey = \(distanceKey)")
                    showCustom = distanceKey == "Custom"
                }
                .labelsHidden()
                .frame(height: pickerHeight)
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
