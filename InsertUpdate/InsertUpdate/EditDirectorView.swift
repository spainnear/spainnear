//
//  EditDirectorView.swift
//  InsertUpdate
//
//  Created by Seamus O'Mahoney on 12/27/24.
//

import SwiftUI

struct EditDirectorView: View {
    @Bindable var director: Director
    let isNew: Bool
    @State private var newMovieName = ""

    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext

    init(director: Director, isNew: Bool = false) {
        self.director = director
        self.isNew = isNew
    }
    
    var body: some View {
        Form {
            Section("Director") {
                TextField("Name", text: $director.name)
            }
            
            Section("Movies") {
                ForEach(director.movies) { movie in
                    Text(movie.name)
                }

                HStack {
                    TextField("Add a new movie in \(director.name)", text: $newMovieName)

                    Button("Add", action: addMovie)
                }
            }
        }
        .navigationTitle(isNew ? "New Friend" : "Friend")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            if isNew {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        do {
                            try modelContext.save()
                        } catch {
                            "Context error"
                        }
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        modelContext.delete(director)
                        dismiss()
                    }
                }
            }
        }
    }
    
    func addMovie() {
        guard newMovieName.isEmpty == false else { return }

        withAnimation {
            let movie = Movie(name: newMovieName, director: director)
            director.movies.append(movie)
            do {
                try modelContext.save()
            } catch {
                "Context error"
            }
            newMovieName = ""
        }
    }
}

#Preview {
    EditDirectorView(director: Director(name: "John Doe"))
}
