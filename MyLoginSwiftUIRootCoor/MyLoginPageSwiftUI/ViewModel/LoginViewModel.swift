//
//  LoginViewModel.swift
//  MyLoginPageSwiftUI
//
//  Created by Seamus O'Mahoney on 4/10/24.
//

import Foundation
import LocalAuthentication
import SwiftUI


@Observable
public class LoginViewModel: ObservableObject {
    var isUnlocked = false
    var username: String?
    var password: String?
    let session: URLSession = .shared
    var didLogin = UserDefaults.standard.bool(forKey: "DidLogin")
    var shouldNavigate = false
    var userModel: AuthModel?
    
    func loginToServer() async throws -> AuthModel {
        // You can use the bundled JSON file and place it on localhost; otherwise, use the JSON in the bundle
//        let url = URL(string: "http://localhost/Auth/auth.json")
//        let request = URLRequest(url: url!)
//        let (data, response) = try await URLSession.shared.data(for: request)
//        let serverResponse = response as? HTTPURLResponse
        
//        do {
//            if serverResponse?.statusCode == 200 {
//                shouldNavigate = true
//
//                UserDefaults.standard.set(true, forKey: "DidLogin")
//
//                let decoder = JSONDecoder()
//                userModel = try decoder.decode(AuthModel.self, from: data)
//                //print("AuthName \(userModel?.name)")
//                let encoder = JSONEncoder()
//                let userData = try encoder.encode(userModel)
//                UserDefaults.standard.set(userData, forKey: "AuthModel")
//                return userModel ?? AuthModel()
//            }else {
//                throw URLError(.badServerResponse)
//            }
//        } catch {
//            print("data: \(String(data: data, encoding: .utf8) ?? "cannot represent as string")")
//            print("response: \(String(describing: response))")
//            print(error)
//            throw error
//        }
        
        var libraryData = Data()
        var returnedLibrary = AuthModel()
        if let path = Bundle.main.path(forResource: "auth", ofType: "json") {
            do {
                shouldNavigate = true
                UserDefaults.standard.set(true, forKey: "DidLogin")
                libraryData = try Data(contentsOf: URL(fileURLWithPath: path))
                let decoder = JSONDecoder()
                returnedLibrary = try decoder.decode(AuthModel.self, from: libraryData)
                UserDefaults.standard.set(libraryData, forKey: "AuthModel")
                return returnedLibrary

            } catch {
                print("Error \(error.localizedDescription)")
                let response = String(data: libraryData, encoding: .utf8)
                print("RESPONSE \(String(describing: response!))")
            }
        }
        
        return AuthModel()
    }
}
