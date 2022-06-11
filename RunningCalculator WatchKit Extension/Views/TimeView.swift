import SwiftUI

struct TimeView: View {
    @State var distanceKey = "Marathon"
    @State var time = ""
    @State var paceMinutes = 8
    @State var paceSeconds = 0

    let distanceMap = [
        "Marathon": 26.2188,
        "Half Marathon": 13.1094,
        "10K": 6.21371,
        "5K": 3.10686
    ]
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
                Text("Pace")
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

            if time.isEmpty {
                Button("Calculate Time", action: calculateTime)
            } else {
                Text("Time is \(time)")
            }
        }
    }

    func calculateTime() {
        let miles = distanceMap[distanceKey]!
        let paceSeconds = paceMinutes * 60 + paceSeconds
        let totalSeconds = miles * Double(paceSeconds)
        let seconds = totalSeconds.truncatingRemainder(dividingBy: 60)
        var minutes = floor(totalSeconds / 60)
        let hours = floor(minutes / 60)
        minutes = minutes.truncatingRemainder(dividingBy: 60)
        time = "\(Int(hours)):\(Int(minutes)):\(Int(seconds))"
    }

}

struct TimeView_Previews: PreviewProvider {
    static var previews: some View {
        TimeView()
    }
}
