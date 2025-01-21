//
//  MyLoginPageSwiftUIApp.swift
//  MyLoginPageSwiftUI
//
//  Created by Seamus O'Mahoney on 4/5/24.
//

import SwiftUI

@main
struct MyLoginPageSwiftUIApp: App {
    @StateObject private var appRootManager = AppRootManager()
       
       var body: some Scene {
           WindowGroup {
               Group {
                   switch appRootManager.currentRoot {
                       
                   case .authentication:
                       LoginView()
                       
                   case .home:
                       FirstView()
                   }
               }
               .environmentObject(appRootManager)
           }
       }
}
