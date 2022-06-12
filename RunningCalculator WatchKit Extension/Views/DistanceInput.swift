import SwiftUI

let distanceMap = [
    "Marathon": 26.2188,
    "Half Marathon": 13.1094,
    "10K": 6.21371,
    "5K": 3.10686,
    "1 Mile": 1
]

func miles(in distanceKey: String) -> Double {
    distanceMap[distanceKey] ?? 0
}

struct DistanceInput: View {
    var distanceKey: Binding<String>

    var body: some View {
        Picker("Distance", selection: distanceKey) {
            ForEach(Array(distanceMap.keys), id: \.self) { value in
                Text(value)
            }
        }
    }
}

struct DistanceInputDemo: View {
    @State var distanceKey = ""

    var body: some View {
        VStack {
            DistanceInput(distanceKey: $distanceKey)
            Text("name = \(distanceKey)")
            Text("miles = \(miles(in: distanceKey))")
        }
    }
}

struct DistanceInput_Previews: PreviewProvider {
    static var previews: some View {
        DistanceInputDemo()
    }
}
