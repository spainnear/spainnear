//
//  ContentView.swift
//  InsertUpdate
//
//  Created by Seamus O'Mahoney on 12/26/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var directors: [Director]
    @State private var path = [Director]()
    @State private var newDirector: Director?

    var body: some View {
        NavigationStack {
            List {
                ForEach(directors) { director in
                    NavigationLink {
                        EditDirectorView(director: director, isNew: false)
                    }
                    label: {
                        Text(director.name)
                    }
                }
                .onDelete(perform: deleteDirector)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addDirector) {
                        Label("Add Director", systemImage: "plus")
                    }
                    
                }
            }
            .sheet(item: $newDirector) { dir in
                NavigationStack {
                    EditDirectorView(director: dir, isNew: true)
                }
                .interactiveDismissDisabled()
            }
        }
        
    }

    private func addDirector() {
        withAnimation {
            let dir = Director()
            modelContext.insert(dir)
            self.newDirector = dir
        }
    }

    private func deleteDirector(indexes: IndexSet) {
        for index in indexes {
            modelContext.delete(directors[index])
            do {
                try modelContext.save()
            } catch {
                "Context error"
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Director.self, inMemory: true)
}
