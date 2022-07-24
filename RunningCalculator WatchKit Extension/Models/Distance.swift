import Foundation

struct Distance {
    static let kmsPerMile = 1.60934
    static let milesPerKm = 0.621371

    // All values are in miles.
    static let map = [
        "1 Mile": 1,
        "5K": 5 * milesPerKm,
        "10K": 10 * milesPerKm,
        "Half Marathon": 13.1094,
        "Marathon": 26.2188,
        "50K": 50 * milesPerKm,
        "50 Miles": 50,
        "100 Miles": 50
    ]

    var key: String

    // These are in the order in which they should appear in a Picker.
    static let keys = [
        "1 Mile", "5K", "10K", "Half Marathon", "Marathon",
        "50K", "50 Miles", "100 Miles"
    ]

    var kilometers: Double { miles * Distance.kmsPerMile }
    var miles: Double { Distance.map[key] ?? 0 }
}
