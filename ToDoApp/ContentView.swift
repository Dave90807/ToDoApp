//
//  ContentView.swift
//  ToDoApp
//
//  Created by Dave Cassidy on 8/30/25.
//
// Completed Task 5: Added toggle functionality


import SwiftUI

struct ContentView: View {
    @State private var tasks = [
        Task(name: "Make Bread"),
        Task(name: "Make Coleslaw"),
        Task(name: "Make Coffee"),
        Task(name: "Make Dessert")
    ]
    @State private var newTaskName = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    TextField("Add a task", text: $newTaskName)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                    Button(action: {
                        if !newTaskName.isEmpty{
                            tasks.append(Task(name: newTaskName))
                            newTaskName = ""
                        }
                    }) {
                        Text("Add")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
                .padding()
                
                List {
                    ForEach($tasks){ $task in
                        HStack{
                            Toggle("", isOn: $task.isCompleted)
                                .labelsHidden()
                            Text(task.name)
                                .strikethrough(task.isCompleted)
                        }
                    }
                }
                .navigationTitle("To-Do List")
            }
        }
    }
}
       
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
