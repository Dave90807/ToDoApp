//
//  Task.swift
//  ToDoApp
//
//  Created by Dave Cassidy on 8/30/25.
//

import Foundation

enum Priority: String, Codable, CaseIterable {
    case high = "High"
    case medium = "Medium"
    case low = "Low"
}
struct Task: Identifiable, Codable {
    let id : UUID
    let name: String
    var isCompleted: Bool
    var priority: Priority
    var dueDate: Date?
    
    init(id: UUID = UUID(), name: String, isCompleted: Bool = false, priority: Priority = .medium, dueDate: Date? = nil) {
        self.id = id
        self.name = name
        self.isCompleted = isCompleted
        self.priority = priority
        self.dueDate = dueDate
    }
}
