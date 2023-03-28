import SwiftUI

struct ExerciseListView: View {
    @ObservedObject var viewModel: WorkoutViewModel
    @State private var showingAddExerciseView = false

    var body: some View {
        NavigationView {
            List(viewModel.exercises) { exercise in
                NavigationLink(destination: ExerciseDetailView(viewModel: viewModel, exercise: exercise)) {
                    Text(exercise.name)
                }
            }
            .navigationBarTitle("Exercises")
            .navigationBarItems(trailing: Button(action: {
                showingAddExerciseView.toggle()
            }) {
                Image(systemName: "plus")
            })
            .sheet(isPresented: $showingAddExerciseView) {
                AddExerciseView(viewModel: viewModel)
            }
        }
    }
}
