class Exercise: Codable {
    var name: String
    var currentTarget: Int
    var finalTarget: Int
    var daysToIncrease: Int
    var increaseAmount: Int
    var goalDays: Int
    var currentStreak: Int
    var progressToday: Int

    init(name: String, finalTarget: Int, daysToIncrease: Int, increaseAmount: Int, goalDays: Int) {
        self.name = name
        self.currentTarget = 10
        self.finalTarget = finalTarget
        self.daysToIncrease = daysToIncrease
        self.increaseAmount = increaseAmount
        self.goalDays = goalDays
        self.currentStreak = 0
        self.progressToday = 0
    }

    func addReps(reps: Int) {
        progressToday += reps
        checkForTargetCompletion()
    }

    private func checkForTargetCompletion() {
        if progressToday >= currentTarget {
            currentStreak += 1
            progressToday = 0
            if currentStreak >= daysToIncrease {
                currentTarget = min(currentTarget + increaseAmount, finalTarget)
                currentStreak = 0
            }
        }
    }

    func isGoalReached() -> Bool {
        return currentStreak >= goalDays && currentTarget == finalTarget
    }
}
