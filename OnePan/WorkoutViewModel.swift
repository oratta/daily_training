import SwiftUI
import Combine

class WorkoutViewModel: ObservableObject {
    @Published private(set) var workoutManager: WorkoutManager

    init(workoutManager: WorkoutManager = WorkoutManager()) {
        self.workoutManager = workoutManager
    }

    func addExercise(name: String, finalTarget: Int, daysToIncrease: Int, increaseAmount: Int, goalDays: Int) {
        workoutManager.addExercise(name: name, finalTarget: finalTarget, daysToIncrease: daysToIncrease, increaseAmount: increaseAmount, goalDays: goalDays)
        workoutManager.save()
    }

    func addRepsToExercise(name: String, reps: Int) {
        workoutManager.addRepsToExercise(name: name, reps: reps)
        workoutManager.save()
    }

    func isGoalReachedForExercise(name: String) -> Bool {
        return workoutManager.isGoalReachedForExercise(name: name)
    }
}

