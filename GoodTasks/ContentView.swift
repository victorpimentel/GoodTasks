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

    var body: some View {
        NavigationStack {
            List {
                ForEach($tasks) { $task in
                    HStack {
                        CheckBox(isChecked: $task.isCompleted)

                        TextField("Task title", text: $task.title)
                            .strikethrough(task.isCompleted)
                            .foregroundColor(task.isCompleted ? .secondary : .primary)
                    }
                }

                HStack {
                    CheckBox(isChecked: .constant(false))
                        .hidden()

                    TextField("Add new task", text: $newTaskTitle)
                        .onSubmit {
                            addTask()
                        }
                }
            }
            .listStyle(.plain)
            .navigationTitle("GoodTasks")
        }
    }

    func addTask() {
        guard !newTaskTitle.isEmpty else { return }
        let newTask = Task(title: newTaskTitle)
        tasks.append(newTask)
        newTaskTitle = ""
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
