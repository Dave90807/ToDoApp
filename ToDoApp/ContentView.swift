//
//  ContentView.swift
//  ToDoApp
//
//  Created by Dave Cassidy on 8/30/25.
//
// Completed Task 5: Added toggle functionality


import SwiftUI

struct ContentView: View {
    @AppStorage("tasks") private var tasksData: Data = Data()
    @State private var tasks: [Task] = []
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
                    ForEach(tasks.indices, id: \.self){ index in
                        HStack{
                            Toggle("", isOn: $tasks[index].isCompleted)
                                .labelsHidden()
                                .onChange(of: tasks[index].isCompleted) { _, _ in
                                    saveTasks()
                                }
                            NavigationLink(tasks[index].name, destination:  {
                                Text("Details for \(tasks[index].name)")
                                    .navigationTitle("Task Details")
                            })
                            .strikethrough(tasks[index].isCompleted)
                        }
                    }
                    .onDelete(perform: { indexSet in
                        tasks.remove(atOffsets: indexSet)
                        saveTasks()
                    })
                    .onMove(perform: { indices, newOffset in
                        tasks.move(fromOffsets: indices, toOffset: newOffset)
                        saveTasks()
                    })
                }
                .navigationTitle("To-Do List")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Clear All") {
                            tasks.removeAll()
                            saveTasks()
                        }
                    }
                    ToolbarItem(placement: .topBarLeading){
                        EditButton()
                    }
                }
            }
            .onAppear {
                loadTasks()
            }
        }
    }
    
    private func saveTasks() {
        do {
            let encoded = try JSONEncoder().encode(tasks)
            tasksData = encoded
            print("Saved tasks: \(tasks)")
        } catch {
            print("Save failed: \(error)")
        }
    }
    
    private func loadTasks() {
        do {
            if !tasksData.isEmpty {
                let decoded = try JSONDecoder().decode([Task].self, from: tasksData)
                tasks = decoded
                print("Loaded tasks: \(tasks)")
            } else {
                print("No tasks data to load")
            }
        } catch {
            print("Load failed: \(error)")
            tasks = []
        }
    }
}
       
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
