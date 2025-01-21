//
//  LoginViewModel.swift
//  MyLoginPageSwiftUI
//
//  Created by Seamus O'Mahoney on 4/10/24.
//

import Foundation
import LocalAuthentication

@Observable
public class LoginViewModel: ObservableObject {
    var isUnlocked = false
    var username: String?
    var password: String?
    let session: URLSession = .shared
    var usesFaceId = UserDefaults.standard.bool(forKey: "UseFaceId")
    let didLogin = UserDefaults.standard.bool(forKey: "DidLogin")
    var shouldNavigate = false
    
    func biometricAuthenticate() {
        let context = LAContext()
        var error: NSError?
        
        if usesFaceId == true && didLogin == true {
            // check whether biometric authentication is possible
            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                let reason = "We need to unlock your data."
                
                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                    // authentication has now completed
                    if success {
                        self.isUnlocked = true
                        self.usesFaceId = self.isUnlocked
                        Task {
                            try await self.loginToServer()
                        }
                    } else {
                        // there was a problem
                    }
                }
            } else {
                // no biometrics
            }
            
        }
    }
    
    func loginToServer() async throws -> [User] {
        // Usually this would be a network call to authenticate
        var data = Data()
        var returnedUsers = [User]()
        let resource = "User.json"
        let path = Bundle.main.path(forResource: resource, ofType: nil)
        
        do {
            data = try Data(contentsOf: URL(fileURLWithPath: path!))
            let decoder = JSONDecoder()
            returnedUsers = try decoder.decode([User].self, from: data)
            
            shouldNavigate = true
            return returnedUsers
        } catch {
            print("Error \(error.localizedDescription)")
            let response = String(data: data, encoding: .utf8)
            print("RESPONSE \(String(describing: response!))")
        }
        return returnedUsers
    }
}
