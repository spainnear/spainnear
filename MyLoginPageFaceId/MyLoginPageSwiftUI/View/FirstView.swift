//
//  FirstView.swift
//  MyLoginPageSwiftUI
//
//  Created by Seamus O'Mahoney on 4/11/24.
//

import SwiftUI

struct FirstView: View {
    @EnvironmentObject private var appRootManager: AppRootManager
    var body: some View {
        VStack {
            Text("Hello FirstView!")
        }
        .padding()
        Button {
            Logout()
        } label: {
            Text("Logout")
        }
        
    }
    
    
    func Logout() {
        UserDefaults.standard.set(false, forKey: "DidLogin")
        appRootManager.currentRoot = .authentication
    }
}

#Preview {
    FirstView()
}
