//
//  DirectorView.swift
//  InsertUpdate
//
//  Created by Seamus O'Mahoney on 12/26/24.
//

import SwiftUI
import SwiftData

struct DirectorView: View {
    @Environment(\.modelContext) var modelContext
    @Query var directors: [Director]
    
    var body: some View {
        List {
            ForEach(directors) { director in
                NavigationLink(value: director) {
                    VStack(alignment: .leading) {
                        Text(director.name)
                            .font(.headline)
                        
                        //Text(destination.date.formatted(date: .long, time: .shortened))
                    }
                }
            }
            //.onDelete(perform: deleteDestinations)
        }
    }
}

#Preview {
    DirectorView()
}
