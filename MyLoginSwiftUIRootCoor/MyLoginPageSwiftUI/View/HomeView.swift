//
//  FirstView.swift
//  MyLoginPageSwiftUI
//
//  Created by Seamus O'Mahoney on 4/11/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @EnvironmentObject private var rootManager: RootManager
    @State var loginViewModel = LoginViewModel()
    
    var body: some View {
        let authModel = self.retrieveAuthModel()
        VStack {
            Text("Welcome \(authModel.name)")
            Button("Push 🍋") {
                coordinator.push(.secondView)
            }
        }
        .toolbar {
            Button {
                Logout()
            } label: {
                Text("Logout")
            }
        }
    }
    
    func Logout() {
        UserDefaults.standard.set(false, forKey: "DidLogin")
        rootManager.currentRoot = .authentication
    }
    
}

#Preview {
    HomeView()
}
