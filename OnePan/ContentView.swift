import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = WorkoutViewModel()

    var body: some View {
        ExerciseListView(viewModel: viewModel)
    }
}
