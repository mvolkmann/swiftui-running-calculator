import SwiftUI

struct TimeInput: View {
    var label: String
    var includeHours: Bool
    @Binding var totalSeconds: Int

    @State private var hours = 0
    @State private var minutes = 0
    @State private var seconds = 0

    let hourValues = [Int](0 ... 8)
    let minuteValues = [Int](0 ..< 60)
    let secondValues = [Int](0 ..< 60)

    init(
        label: String = "",
        includeHours: Bool = false,
        totalSeconds: Binding<Int>
    ) {
        self.label = label
        self.includeHours = includeHours
        _totalSeconds = totalSeconds // note the underscore!

        let time = Time(totalSeconds: totalSeconds.wrappedValue)

        // Setting @State properties in init is tricky!
        _seconds = State(initialValue: time.seconds)
        _hours = State(initialValue: time.hours)
        _minutes = State(initialValue: time.minutes)
    }

    var body: some View {
        if !label.isEmpty { Label(label, bold: true) }
        HStack {
            if includeHours {
                NumberPicker(
                    label: "Hours",
                    max: 59,
                    onChange: { _ in updateTotalSeconds() },
                    selection: $hours
                )
            }
            NumberPicker(
                label: "Mins",
                max: 59,
                onChange: { _ in updateTotalSeconds() },
                selection: $minutes
            )
            NumberPicker(
                label: "Secs",
                max: 59,
                onChange: { _ in updateTotalSeconds() },
                selection: $seconds
            )
        }
        .labelsHidden() // hides Picker labels
    }

    func updateTotalSeconds() {
        totalSeconds = ((hours * 60) + minutes) * 60 + seconds
    }
}

struct TimeInput_Previews: PreviewProvider {
    struct Preview: View {
        var includeHours: Bool = false
        @State var totalSeconds = 0

        var body: some View {
            VStack {
                TimeInput(
                    includeHours: includeHours,
                    totalSeconds: $totalSeconds
                )
                Text("seconds = \(totalSeconds)")
            }
        }
    }

    static var previews: some View {
        Preview()
        Preview(includeHours: true)
    }
}
