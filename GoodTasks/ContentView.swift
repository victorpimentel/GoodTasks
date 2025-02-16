//
//  ContentView.swift
//  GoodTasks
//
//  Created by Víctor Pimentel Rodríguez on 17/2/25.
//

import SwiftUI

struct ContentView: View {
    @Binding var tasks: [Task]

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
            }
            .listStyle(.plain)
            .navigationTitle("GoodTasks")
        }
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
