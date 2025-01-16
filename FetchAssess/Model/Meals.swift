//
//  Meals.swift
//  Fetch
//
//  Created by James O'Mahoney on 8/16/24.
//

import Foundation

struct Meals: Codable {
    var meals: [Meal]?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        meals = try container.decodeIfPresent([Meal].self, forKey: .meals)
    }
}

struct Meal: Codable, Identifiable, Hashable {
    var id: String?
    var strMeal: String?
    var strMealThumb: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case strMeal
        case strMealThumb
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        strMeal = try container.decodeIfPresent(String.self, forKey: .strMeal)
        strMealThumb = try container.decodeIfPresent(String.self, forKey: .strMealThumb)
    }
}
