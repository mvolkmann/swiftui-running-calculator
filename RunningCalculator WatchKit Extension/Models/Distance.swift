import Foundation

struct Distance {
    static let map = [
        "1 Mile": 1,
        "5K": 3.10686,
        "10K": 6.21371,
        "Half Marathon": 13.1094,
        "Marathon": 26.2188,
        "Custom": 0
    ]

    var key: String

    // These are in the order in which they should appear in a Picker.
    static let keys = ["1 Mile", "5K", "10K", "Half Marathon", "Marathon", "Custom"]

    var kilometers: Double { miles * 1.60934 }
    var miles: Double { Distance.map[key] ?? 0 }
}
