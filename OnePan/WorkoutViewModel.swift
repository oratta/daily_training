import SwiftUI

class WorkoutViewModel: ObservableObject {
    @Published private var workoutManager = WorkoutManager()

    var exercises: [Workout] {
        workoutManager.exercises
    }

    func addExercise(name: String, finalTarget: Int, daysToIncrease: Int, increaseAmount: Int, goalDays: Int) {
        workoutManager.addExercise(name: name, finalTarget: finalTarget, daysToIncrease: daysToIncrease, increaseAmount: increaseAmount, goalDays: goalDays)
    }

    func addRepsToExercise(name: String, reps: Int) {
        workoutManager.addRepsToExercise(name: name, reps: reps)
        if let exercise = exercises.first(where: { $0.name == name }), exercise.repsDone >= exercise.currentTarget {
            workoutManager.updateExercise(name: name)
        }
    }

    func isGoalReachedForExercise(name: String) -> Bool {
        workoutManager.isGoalReachedForExercise(name: name)
    }
}
