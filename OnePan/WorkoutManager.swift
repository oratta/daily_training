import Foundation
import Combine
class WorkoutManager {
    @Published var exercises: [Exercise] = []
    
    private let userDefaultsKey = "WorkoutManagerData"

    init() {
        load()
    }

    func save() {
        if let encodedData = try? JSONEncoder().encode(exercises) {
            UserDefaults.standard.set(encodedData, forKey: userDefaultsKey)
        }
    }

    private func load() {
        if let savedData = UserDefaults.standard.data(forKey: userDefaultsKey) {
            if let decodedData = try? JSONDecoder().decode([Exercise].self, from: savedData) {
                exercises = decodedData
            }
        }
    }

    func addExercise(name: String, finalTarget: Int, daysToIncrease: Int, increaseAmount: Int, goalDays: Int) {
        let exercise = Exercise(name: name, finalTarget: finalTarget, daysToIncrease: daysToIncrease, increaseAmount: increaseAmount, goalDays: goalDays)
        exercises.append(exercise)
    }

    func addRepsToExercise(name: String, reps: Int) {
        if let exercise = exercises.first(where: { $0.name == name }) {
            exercise.addReps(reps: reps)
        }
    }

    func isGoalReachedForExercise(name: String) -> Bool {
        if let exercise = exercises.first(where: { $0.name == name }) {
            return exercise.isGoalReached()
        }
        return false
    }
}
