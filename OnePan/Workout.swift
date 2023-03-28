import Foundation

struct Workout: Identifiable, Codable {
    let id: UUID
    let name: String
    var repsDone: Int
    var currentTarget: Int
    let finalTarget: Int
    let daysToIncrease: Int
    let increaseAmount: Int
    let goalDays: Int
    var currentStreak: Int
}
