//
//  InsertUpdateApp.swift
//  InsertUpdate
//
//  Created by Seamus O'Mahoney on 12/26/24.
//

import SwiftUI
import SwiftData

@main
struct InsertUpdateApp: App {
    let modelContainer: ModelContainer
    init() {
        do {
            modelContainer = try ModelContainer(for: Director.self)
        } catch {
            fatalError("Could not initialize ModelContainer")
        }
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(modelContainer)
    }
}
