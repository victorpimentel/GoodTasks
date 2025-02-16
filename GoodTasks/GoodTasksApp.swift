//
//  GoodTasksApp.swift
//  GoodTasks
//
//  Created by Víctor Pimentel Rodríguez on 17/2/25.
//

import SwiftUI

@main
struct GoodTasksApp: App {
    @State private var tasks: [Task] = []

    var body: some Scene {
        WindowGroup {
            ContentView(tasks: $tasks)
        }
    }
}
