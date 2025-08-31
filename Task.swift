//
//  Task.swift
//  ToDoApp
//
//  Created by Dave Cassidy on 8/30/25.
//

import Foundation

struct Task: Identifiable {
    let id = UUID()
    let name: String
    var isCompleted: Bool = false
}
