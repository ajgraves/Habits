//
//  AddView.swift
//  Habits
//
//  Created by Aaron Graves on 7/31/24.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    @State private var name = "New Habit"
    @State private var timesCompleted: Int = 0
    var habits: Habits
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
            }
            .navigationTitle("New Habit")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel", role: .cancel) {
                        dismiss()
                    }
                    .foregroundColor(.red)
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let item = HabitItem(name: name, timesCompleted: timesCompleted)
                        habits.items.append(item)
                        dismiss()
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    AddView(habits: Habits())
}
