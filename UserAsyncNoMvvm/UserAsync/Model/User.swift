//
//  User.swift
//  UserAsync
//
//  Created by Seamus O'Mahoney on 3/22/24.
//

import Foundation

struct User: Codable, Identifiable {
    var id: Int?
    var name: String?
    var email: String?
    var phone: String?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(Int.self, forKey: .id)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        email = try container.decodeIfPresent(String.self, forKey: .email)
        phone = try container.decodeIfPresent(String.self, forKey: .phone)
    }
}
