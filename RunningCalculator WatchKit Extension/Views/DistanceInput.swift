import SwiftUI

struct DistanceInput: View {
    var distanceKey: Binding<String>

    var body: some View {
        Picker("Distance", selection: distanceKey) {
            ForEach(Array(Distance.keys), id: \.self) { value in
                Text(value)
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
