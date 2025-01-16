//
//  RootManager.swift
//  RootManager
//
//  Created by Seamus O'Mahoney on 4/13/24.
//

import Foundation

@Observable
final class RootManager: ObservableObject {
    var loginViewModel = LoginViewModel()
    var currentRoot: rootEnum = .authentication
    
    init() {
        //UserDefaults.standard.set(false, forKey: "DidLogin")
        
        if UserDefaults.standard.bool(forKey: "DidLogin") == true {
            currentRoot = .rootMain
        } else {
            currentRoot = .authentication
        }
    }
    
    enum rootEnum {
        case authentication
        case rootMain
    }
}
