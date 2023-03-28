import SwiftUI

struct ExerciseDetailView: View {
    @ObservedObject var viewModel: WorkoutViewModel
    var exercise: Workout

    @State private var repsToAdd: String = ""

    var body: some View {
        VStack {
            Text("Current Target: \(exercise.currentTarget)")
            Text("Final Target: \(exercise.finalTarget)")
            Text("Current Streak: \(exercise.currentStreak)")
            if viewModel.isGoalReachedForExercise(name: exercise.name) {
                Text("Goal Reached!")
                    .font(.largeTitle)
                    .foregroundColor(.green)
            }

            TextField("Reps to add", text: $repsToAdd)
                .keyboardType(.numberPad)

            Button(action: {
                if let reps = Int(repsToAdd) {
                    viewModel.addRepsToExercise(name: exercise.name, reps: reps)
                }
            }) {
                Text("Add Reps")
            }
        }
        .padding()
        .navigationBarTitle(exercise.name)
    }
}
