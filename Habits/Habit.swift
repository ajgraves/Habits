//
//  Habit.swift
//  Habits
//
//  Created by Aaron Graves on 7/31/24.
//

import Foundation
import Observation

struct HabitItem: Identifiable, Codable, Equatable, Hashable {
    var id = UUID()
    let name: String
    let timesCompleted: Int
}

@Observable
class Habits {
    var items = [HabitItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([HabitItem].self, from: savedItems) {
                items = decodedItems
                //print(items)
                return
            }
        }
        
        items = []
    }
}
