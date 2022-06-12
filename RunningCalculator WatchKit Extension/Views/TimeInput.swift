import SwiftUI

func timeString(for totalSeconds: Int) -> String {
    let seconds = totalSeconds % 60
    var minutes = floor(Double(totalSeconds) / 60) // a Double
    let hours = floor(minutes / 60) // a Double
    print("timeString: hours = \(hours)")
    let hoursText = hours == 0 ? "" : "\(hours):"
    //TODO: Left pad minutes and seconds with zero.
    return "\(hoursText)\(Int(minutes)):\(Int(seconds))"
}

struct TimeInput: View {
    var label: String
    var includeHours: Bool
    var totalSeconds: Binding<Int>

    @State var hours = 0
    @State var minutes = 0
    @State var seconds = 0

    let hourValues = [Int](0...8)
    let minuteValues = [Int](0..<60)
    let secondValues = [Int](0..<60)

    init(
        label: String = "",
        includeHours: Bool = false,
        totalSeconds: Binding<Int>
    ) {
        self.label = label
        self.includeHours = includeHours
        self.totalSeconds = totalSeconds

        let ts = totalSeconds.wrappedValue
        _seconds = State(initialValue: ts % 60)
        let m = ts / 60 // Int division truncates
        let h = m / 60 // Int division truncates
        _hours = State(initialValue: h)
        _minutes = State(initialValue: m % 60)
    }

    var body: some View {
        if !label.isEmpty { Text(label) }
        HStack {
            if includeHours {
                Picker("Hours", selection: $hours) {
                    ForEach(hourValues, id: \.self) { value in
                        Text(String(value))
                    }
                }
                .onChange(of: hours) { value in updateTotalSeconds() }
            }

            Picker("Mins", selection: $minutes) {
                ForEach(minuteValues, id: \.self) { value in
                    Text(String(value))
                }
            }
            .onChange(of: minutes) { value in updateTotalSeconds() }

            Picker("Secs", selection: $seconds) {
                ForEach(secondValues, id: \.self) { value in
                    Text(String(value))
                }
            }
            .onChange(of: seconds) { value in updateTotalSeconds() }
        }
    }

    func updateTotalSeconds() {
        totalSeconds.wrappedValue =
          ((hours * 60) + minutes) * 60 + seconds
    }
}

struct TimeInputDemo: View {
    var includeHours: Bool = false
    @State var totalSeconds = 0

    var body: some View {
        VStack {
            TimeInput(includeHours: includeHours, totalSeconds: $totalSeconds)
            Text("seconds = \(totalSeconds)")
        }
    }
}

struct TimeInput_Previews: PreviewProvider {
    static var previews: some View {
        TimeInputDemo()
        TimeInputDemo(includeHours: true)
    }
}
