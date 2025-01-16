//
//  MyLoginPageSwiftUIApp.swift
//  MyLoginPageSwiftUI
//
//  Created by Seamus O'Mahoney on 4/5/24.
//

import SwiftUI

@main
struct MyLoginPageSwiftUIApp: App {
    @StateObject var rootManager = RootManager()
    
    var body: some Scene {

        WindowGroup {
            Group {
                switch rootManager.currentRoot {
                
                case .authentication:
                    LoginView()
                    
                case .rootMain:
                    RootMainView()
                }
            }
            .environmentObject(rootManager)
        }
    }
}
