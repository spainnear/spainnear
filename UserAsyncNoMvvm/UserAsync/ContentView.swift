//
//  ContentView.swift
//  UserAsync
//
//  Created by Seamus O'Mahoney on 3/22/24.
//

import SwiftUI

struct ContentView: View {
    let networkManager = NetworkManager()
    @State var users: [User]?
    var body: some View {
        NavigationStack {
            List(users ?? []) { user in
                Text("Hello \(user.name ?? "")")
            }
            .padding()
            .task {
                do {
                    users = try await networkManager.fetchUsers()
                } catch {
                    print("Error")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
