class WorkoutManager {
    var exercises: [Exercise] = []

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
