import Foundation

class WorkoutManager: ObservableObject {
    @Published private(set) var exercises: [Workout]

    init() {
        exercises = [
            Workout(id: UUID(), name: "Push-ups", repsDone: 0, currentTarget: 10, finalTarget: 100, daysToIncrease: 3, increaseAmount: 5, goalDays: 5, currentStreak: 0)
        ]
    }

    func addExercise(name: String, finalTarget: Int, daysToIncrease: Int, increaseAmount: Int, goalDays: Int) {
        exercises.append(Workout(id: UUID(), name: name, repsDone: 0, currentTarget: 10, finalTarget: finalTarget, daysToIncrease: daysToIncrease, increaseAmount: increaseAmount, goalDays: goalDays, currentStreak: 0))
    }

    func addRepsToExercise(name: String, reps: Int) {
        guard let index = exercises.firstIndex(where: { $0.name == name }) else { return }
        exercises[index].repsDone += reps
    }

    func updateExercise(name: String) {
        guard let index = exercises.firstIndex(where: { $0.name == name }) else { return }
        exercises[index].repsDone = 0
        exercises[index].currentStreak += 1

        if exercises[index].currentStreak % exercises[index].daysToIncrease == 0 {
            exercises[index].currentTarget += exercises[index].increaseAmount
        }
    }

    func isGoalReachedForExercise(name: String) -> Bool {
        guard let exercise = exercises.first(where: { $0.name == name }) else { return false }
        return exercise.currentStreak >= exercise.goalDays
    }
}
