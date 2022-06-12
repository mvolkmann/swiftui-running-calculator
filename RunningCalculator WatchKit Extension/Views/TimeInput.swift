import SwiftUI

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

        let time = Time(totalSeconds: totalSeconds.wrappedValue)

        // Setting @State properties in init is tricky!
        _seconds = State(initialValue: time.seconds)
        _hours = State(initialValue: time.hours)
        _minutes = State(initialValue: time.minutes)
    }

    var body: some View {
        if !label.isEmpty {
            Text(label).font(.system(size: 16)).fontWeight(.bold)
        }
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
