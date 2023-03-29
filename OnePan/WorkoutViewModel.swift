import SwiftUI
import Combine

class WorkoutViewModel: ObservableObject {
    private var workoutManager = WorkoutManager()
    private var cancellables = Set<AnyCancellable>()

    var exercises: [Workout] {
        workoutManager.exercises
    }

    init() {
        workoutManager.$exercises
            .sink { [weak self] _ in
                self?.objectWillChange.send()
            }
            .store(in: &cancellables)
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
