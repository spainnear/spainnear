//
//  View+Extensions.swift
//  MyLoginSwiftUIRootCoor
//
//  Created by Seamus O'Mahoney on 4/21/24.
//

import Foundation
import UIKit
import SwiftUI

extension View {
    func retrieveAuthModel() -> AuthModel {
        let decoder = JSONDecoder()
        if let data = UserDefaults.standard.data(forKey: "AuthModel") {
            do {
                let authModel = try decoder.decode(AuthModel.self, from: data)
                return authModel
            } catch {
                print("Unable to Decode Note (\(error))")
            }
        }
        return AuthModel()
    }
}
