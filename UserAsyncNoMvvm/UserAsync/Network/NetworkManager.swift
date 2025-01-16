//
//  NetworkManager.swift
//  UserAsync
//
//  Created by Seamus O'Mahoney on 3/22/24.
//

import Foundation

struct NetworkManager {

    func fetchUsers() async throws -> [User] {
        let url = URL(string: "http://localhost/Users/user.json")
        let request = URLRequest(url: url!)
        let (data, response) = try await URLSession.shared.data(for: request)
        var serverResponse = response as? HTTPURLResponse
        print("serverResponse \(serverResponse?.statusCode)")
        do {
            if serverResponse?.statusCode == 200 {
                let decoder = JSONDecoder()
                let users = try decoder.decode([User].self, from: data)
                return users
            }else {
                throw URLError(.badServerResponse)
            }
        } catch {
            print("data: \(String(data: data, encoding: .utf8) ?? "cannot represent as string")")
            print("response: \(String(describing: response))")
            print(error)
            throw error
        }
        
        
        //return users
    }
}
