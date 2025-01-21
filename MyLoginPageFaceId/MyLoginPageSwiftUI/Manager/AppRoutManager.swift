//
//  Untitled.swift
//  LoginAndForm
//
//  Created by Seamus O'Mahoney on 10/5/24.
//
import Foundation

final class AppRootManager: ObservableObject {
    
    @Published var currentRoot: eAppRoots = .authentication
    
    enum eAppRoots {
        case authentication
        case home
    }
}

