import SwiftUI

struct DistanceView: View {
    @State var distance: Double = 0
    @State var paceMinutes = 8
    @State var paceSeconds = 0
    @State var timeHours = 3
    @State var timeMinutes = 45
    @State var timeSeconds = 0

    let hourValues = [Int](0...8)
    let minuteValues = [Int](0..<60)
    let secondValues = [Int](0..<60)

    var body: some View {
        VStack {
            Text("Time")
            HStack {
                Picker("Hours", selection: $timeHours) {
                    ForEach(hourValues, id: \.self) { value in
                        Text(String(value))
                    }
                }
                Picker("Mins", selection: $timeMinutes) {
                    ForEach(minuteValues, id: \.self) { value in
                        Text(String(value))
                    }
                }
                Picker("Secs", selection: $timeSeconds) {
                    ForEach(secondValues, id: \.self) { value in
                        Text(String(value))
                    }
                }
            }

            Text("Pace")
            HStack {
                Picker("Mins", selection: $paceMinutes) {
                    ForEach(minuteValues, id: \.self) { value in
                        Text(String(value))
                    }
                }
                Picker("Secs", selection: $paceSeconds) {
                    ForEach(secondValues, id: \.self) { value in
                        Text(String(value))
                    }
                }
            }

            if distance == 0 {
                Button("Calculate Distance", action: calculateDistance)
            } else {
                Text("Distance is \(distance.places(2)) miles")
            }
        }
    }

    func calculateDistance() {
        let timeSeconds = (timeHours * 60 + timeMinutes) * 60 + timeSeconds
        let paceSeconds = paceMinutes * 60 + paceSeconds
        distance = Double(timeSeconds) / Double(paceSeconds)
    }
}

struct DistanceView_Previews: PreviewProvider {
    static var previews: some View {
        DistanceView()
    }
}
