//
//  ContentView.swift
//  Habits
//
//  Created by Aaron Graves on 7/31/24.
//

import SwiftUI

struct ContentView: View {
    // Class with all our habits
    @State private var habits = Habits()
    // Are we showing the add view sheet?
    @State private var showingAddHabit = false
    @State private var isEditing = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(habits.items, id: \.self) { item in
                    NavigationLink(destination: DetailView(habit: item)) {
                        //HStack {
                        VStack {
                            Text("\(item.name)")
                                .font(.title2)
                            
                            //Spacer()
                            
                            Text("Completed \(item.timesCompleted) " + (item.timesCompleted == 1 ? "time" : "times"))
                                .font(.caption)
                        }
                    }
                    /*.navigationDestination(for: HabitItem.self) { item in
                        DetailView(habit: item)
                    }*/
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("Habits")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    //EditButton()
                    Button(action: {
                        self.isEditing.toggle()
                    }) {
                        if self.isEditing {
                            Text("Done")
                        } else {
                            Image(systemName: "pencil")
                        }
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add Habit", systemImage: "plus") {
                        showingAddHabit = true
                    }
                }
            }
            .environment(\.editMode, .constant(self.isEditing ? EditMode.active : EditMode.inactive))
            .sheet(isPresented: $showingAddHabit) {
                AddView(habits: habits)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        habits.items.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
