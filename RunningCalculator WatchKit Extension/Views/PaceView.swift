import SwiftUI

struct PaceView: View {
    @State var distanceKey = "Marathon"
    @State var timeHours = 2
    @State var timeMinutes = 57
    @State var pace = ""
    @State var timeSeconds = 11

    let distanceMap = [
        "Marathon": 26.2188,
        "Half Marathon": 13.1094,
        "10K": 6.21371,
        "5K": 3.10686
    ]
    let hourValues = [Int](0...8)
    let minuteValues = [Int](0..<60)
    let secondValues = [Int](0..<60)

    var body: some View {
        VStack {
            Picker("Distance", selection: $distanceKey) {
                ForEach(Array(distanceMap.keys), id: \.self) { value in
                    Text(value)
                }
            }
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

            if pace.isEmpty {
                Button("Calculate Pace", action: calculatePace)
            } else {
                Text("Pace is \(pace) per mile")
            }
        }
    }

    func calculatePace() {
        let miles = distanceMap[distanceKey]!
        let totalSeconds = (timeHours * 60 + timeMinutes) * 60 + timeSeconds
        let secondsPerMile = Double(totalSeconds) / miles
        let minutes = floor(secondsPerMile / 60)
        let seconds = secondsPerMile.truncatingRemainder(dividingBy: 60)
        pace = "\(Int(minutes)):\(Int(seconds))"
    }
}

struct PaceView_Previews: PreviewProvider {
    static var previews: some View {
        PaceView()
    }
}
