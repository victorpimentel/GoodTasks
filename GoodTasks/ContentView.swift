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
                    TextField("Task title", text: $task.title)
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
