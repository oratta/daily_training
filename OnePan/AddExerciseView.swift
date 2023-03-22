//
//  AddExerciseView.swift
//  OnePan
//
//  Created by Kentaro Uesugi on 2023/03/22.
//

import SwiftUI

struct AddExerciseView: View {
    @ObservedObject var viewModel: WorkoutViewModel
    @Environment(\.presentationMode) var presentationMode

    @State private var name: String = ""
    @State private var finalTarget: String = ""
    @State private var daysToIncrease: String = ""
    @State private var increaseAmount: String = ""
    @State private var goalDays: String = ""

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name", text: $name)
                    TextField("Final Target", text: $finalTarget)
                        .keyboardType(.numberPad)
                    TextField("Days to Increase", text: $daysToIncrease)
                        .keyboardType(.numberPad)
                    TextField("Increase Amount", text: $increaseAmount)
                        .keyboardType(.numberPad)
                    TextField("Goal Days", text: $goalDays)
                        .keyboardType(.numberPad)
                }
                Section {
                    Button(action: {
                        if let finalTarget = Int(finalTarget),
                            let daysToIncrease = Int(daysToIncrease),
                            let increaseAmount = Int(increaseAmount),
                            let goalDays = Int(goalDays) {
                            viewModel.addExercise(name: name, finalTarget: finalTarget, daysToIncrease: daysToIncrease, increaseAmount: increaseAmount, goalDays: goalDays)
                            presentationMode.wrappedValue.dismiss()
                        }
                    }) {
                        Text("Add Exercise")
                    }
                }
            }
            .navigationBarTitle("Add Exercise")
        }
    }
}
