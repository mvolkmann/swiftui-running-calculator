import Foundation

struct Distance {
    static let kmPerMile = 1.60934

    static let map = [
        "1 Mile": 1,
        "5K": 5 * kmPerMile,
        "10K": 10 * kmPerMile,
        "Half Marathon": 13.1094,
        "Marathon": 26.2188,
        "50K": 50 * kmPerMile,
        "50 Miles": 50,
        "100 Miles": 50,
        "Custom": 0
    ]

    var key: String

    // These are in the order in which they should appear in a Picker.
    static let keys = [
        "1 Mile", "5K", "10K", "Half Marathon", "Marathon",
        "50K", "50 Miles", "100 Miles", "Custom"
    ]

    var kilometers: Double { miles * Distance.kmPerMile }
    var miles: Double { Distance.map[key] ?? 0 }
}
