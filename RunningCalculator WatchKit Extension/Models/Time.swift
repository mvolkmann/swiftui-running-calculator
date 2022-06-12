import Foundation

struct Time {
    var totalSeconds: Int
    var includeHours: Bool = false

    var hours: Int { (totalSeconds / 60) / 60 }

    var minutes: Int { (totalSeconds / 60) % 60 }

    var seconds: Int { totalSeconds % 60 }

    var string: String {
        let useHours = includeHours || hours != 0
        let hourText = useHours ? "\(hours):" : ""
        let minText = useHours ? String(format: "%02d", minutes) : String(minutes)
        let secText = String(format: "%02d", seconds)
        return "\(hourText)\(minText):\(secText)"
    }
}
