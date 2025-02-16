//
//  ContentView.swift
//  GoodTasks
//
//  Created by Víctor Pimentel Rodríguez on 17/2/25.
//

import SwiftUI

struct ContentView: View {
    @Binding var tasks: [Task]
    @State private var newTaskTitle: String = ""
    @FocusState private var newTaskTitleIsFocused: Bool

    var body: some View {
        NavigationStack {
            List {
                ForEach($tasks) { $task in
                    HStack {
                        CheckBox(isChecked: Binding(get: {
                            task.isCompleted
                        }, set: { newValue in
                            task.isCompleted = newValue
                            saveTasks()
                        }))

                        TextField("Task title", text: $task.title)
                            .strikethrough(task.isCompleted)
                            .foregroundColor(task.isCompleted ? .secondary : .primary)
                            .onSubmit(saveTasks)
                    }
                }
                .onDelete(perform: deleteTasks)

                HStack {
                    CheckBox(isChecked: .constant(false))
                        .hidden()

                    TextField("Add new task", text: $newTaskTitle)
                        .onSubmit {
                            addTask()
                            newTaskTitleIsFocused = true
                        }
                        .focused($newTaskTitleIsFocused)
                }
            }
            .listStyle(.plain)
            .navigationTitle("GoodTasks")
        }
        .onAppear(perform: loadTasks)
    }

    func addTask() {
        guard !newTaskTitle.isEmpty else { return }
        let newTask = Task(title: newTaskTitle)
        tasks.append(newTask)
        newTaskTitle = ""
        saveTasks()
    }

    func deleteTasks(offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
        saveTasks()
    }

    func saveTasks() {
        guard let encoded = try? JSONEncoder().encode(tasks) else { return }
        UserDefaults.standard.set(encoded, forKey: "tasks")
    }

    func loadTasks() {
        guard let data = UserDefaults.standard.data(forKey: "tasks"),
              let decoded = try? JSONDecoder().decode([Task].self, from: data) else {
            return
        }

        tasks = decoded
    }
}

#Preview {
    struct Preview: View {
        @State var tasks = [
            Task(title: "First"),
            Task(title: "Second", isCompleted: true)
        ]
        var body: some View {
            ContentView(tasks: $tasks)
        }
    }

    return Preview()
}
