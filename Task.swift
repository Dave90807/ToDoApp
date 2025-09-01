//
//  Task.swift
//  ToDoApp
//
//  Created by Dave Cassidy on 8/30/25.
//

import Foundation

struct Task: Identifiable, Codable {
    let id : UUID
    let name: String
    var isCompleted: Bool
    
    init(id: UUID = UUID(), name: String, isCompleted: Bool = false) {
        self.id = id
        self.name = name
        self.isCompleted = isCompleted
    }
}
