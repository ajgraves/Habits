//
//  DetailView.swift
//  Habits
//
//  Created by Aaron Graves on 7/31/24.
//
//  This view will be used to show details of the habit
//

import SwiftUI

struct BlueButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(.blue)
            .foregroundStyle(.white)
            .clipShape(Capsule())
            .fontWeight(.bold)
    }
}

struct DetailView: View {
    var habit: HabitItem
    var habits: Habits
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                Text("You have completed this habit \(habit.timesCompleted) " + (habit.timesCompleted == 1 ? "time" : "times"))
                
                Spacer()
                
                Button("Complete Habit") {
                    // Add to the completion count
                    if let index = habits.items.firstIndex(of: habit) {
                        print(index)
                        habits.items[index] = habit
                        dismiss()
                    }
                    
                    // Dismiss the view
                    //dismiss()
                }
                .buttonStyle(BlueButton())

                Spacer()
                Spacer()
                Spacer()
            }
            .navigationTitle(habit.name)
        }
    }
}

#Preview {
    DetailView(habit: HabitItem(name: "test", timesCompleted: 13), habits: Habits())
}
