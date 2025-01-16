//
//  AuthModel.swift
//  MyLoginSwiftUIRootCoor
//
//  Created by Seamus O'Mahoney on 4/21/24.
//

import Foundation

struct AuthModel: Codable {
    var id = ""
    var token = ""
    var name = ""
    
    public init() {}
    
    public init(from decoder: Decoder) throws {
        let decoder = try decoder.container(keyedBy: CodingKeys.self)
        id = try decoder.decodeIfPresent(String.self, forKey: .id)!
        token = try decoder.decodeIfPresent(String.self, forKey: .token)!
        name = try decoder.decodeIfPresent(String.self, forKey: .name)!
    }
}
