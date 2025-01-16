//
//  MealDetail.swift
//  Fetch
//
//  Created by James O'Mahoney on 8/18/24.
//

import Foundation

struct MealsDetail: Codable {
    var mealsDetail: [MealDetail]?
    
    enum CodingKeys: String, CodingKey {
        case mealsDetail = "meals"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        mealsDetail = try container.decodeIfPresent([MealDetail].self, forKey: .mealsDetail)
    }
}

struct MealDetail: Codable, Identifiable, Hashable {
    var id: String?
    var strMeal: String?
    var strMealThumb: String?
    
    var strInstructions: String?
    var strIngredient1: String?
    var strIngredient2: String?
    var strIngredient3: String?
    var strIngredient4: String?
    var strIngredient5: String?
    
    var strIngredient6: String?
    var strIngredient7: String?
    var strIngredient8: String?
    var strIngredient9: String?
    var strIngredient10: String?
    
    var strIngredient11: String?
    var strIngredient12: String?
    var strIngredient13: String?
    var strIngredient14: String?
    var strIngredient15: String?
    
    var strIngredient16: String?
    var strIngredient17: String?
    var strIngredient18: String?
    var strIngredient19: String?
    var strIngredient20: String?
    
    var strMeasure1: String?
    var strMeasure2: String?
    var strMeasure3: String?
    var strMeasure4: String?
    var strMeasure5: String?
    
    var strMeasure6: String?
    var strMeasure7: String?
    var strMeasure8: String?
    var strMeasure9: String?
    var strMeasure10: String?
    
    var strMeasure11: String?
    var strMeasure12: String?
    var strMeasure13: String?
    var strMeasure14: String?
    var strMeasure15: String?
    
    var strMeasure16: String?
    var strMeasure17: String?
    var strMeasure18: String?
    var strMeasure19: String?
    var strMeasure20: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case strMeal
        case strMealThumb
        case strInstructions
        
        case strIngredient1
        case strIngredient2
        case strIngredient3
        case strIngredient4
        case strIngredient5
        
        case strIngredient6
        case strIngredient7
        case strIngredient8
        case strIngredient9
        case strIngredient10
        
        case strIngredient11
        case strIngredient12
        case strIngredient13
        case strIngredient14
        case strIngredient15
        
        case strIngredient16
        case strIngredient17
        case strIngredient18
        case strIngredient19
        case strIngredient20
        
        case strMeasure1
        case strMeasure2
        case strMeasure3
        case strMeasure4
        case strMeasure5
        
        case strMeasure6
        case strMeasure7
        case strMeasure8
        case strMeasure9
        case strMeasure10
        
        case strMeasure11
        case strMeasure12
        case strMeasure13
        case strMeasure14
        case strMeasure15
        
        case strMeasure16
        case strMeasure17
        case strMeasure18
        case strMeasure19
        case strMeasure20
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        strMeal = try container.decodeIfPresent(String.self, forKey: .strMeal)
        strMealThumb = try container.decodeIfPresent(String.self, forKey: .strMealThumb)
        strInstructions = try container.decodeIfPresent(String.self, forKey: .strInstructions)
        
        strIngredient1 = try container.decodeIfPresent(String.self, forKey: .strIngredient1)
        strIngredient2 = try container.decodeIfPresent(String.self, forKey: .strIngredient2)
        strIngredient3 = try container.decodeIfPresent(String.self, forKey: .strIngredient3)
        strIngredient4 = try container.decodeIfPresent(String.self, forKey: .strIngredient4)
        strIngredient5 = try container.decodeIfPresent(String.self, forKey: .strIngredient5)
        
        strIngredient6 = try container.decodeIfPresent(String.self, forKey: .strIngredient6)
        strIngredient7 = try container.decodeIfPresent(String.self, forKey: .strIngredient7)
        strIngredient8 = try container.decodeIfPresent(String.self, forKey: .strIngredient8)
        strIngredient9 = try container.decodeIfPresent(String.self, forKey: .strIngredient9)
        strIngredient10 = try container.decodeIfPresent(String.self, forKey: .strIngredient10)
        
        strIngredient11 = try container.decodeIfPresent(String.self, forKey: .strIngredient11)
        strIngredient12 = try container.decodeIfPresent(String.self, forKey: .strIngredient12)
        strIngredient13 = try container.decodeIfPresent(String.self, forKey: .strIngredient13)
        strIngredient14 = try container.decodeIfPresent(String.self, forKey: .strIngredient14)
        strIngredient15 = try container.decodeIfPresent(String.self, forKey: .strIngredient15)
        
        strIngredient16 = try container.decodeIfPresent(String.self, forKey: .strIngredient16)
        strIngredient17 = try container.decodeIfPresent(String.self, forKey: .strIngredient17)
        strIngredient18 = try container.decodeIfPresent(String.self, forKey: .strIngredient18)
        strIngredient19 = try container.decodeIfPresent(String.self, forKey: .strIngredient19)
        strIngredient20 = try container.decodeIfPresent(String.self, forKey: .strIngredient20)
        
        strMeasure1 = try container.decodeIfPresent(String.self, forKey: .strMeasure1)
        strMeasure2 = try container.decodeIfPresent(String.self, forKey: .strMeasure2)
        strMeasure3 = try container.decodeIfPresent(String.self, forKey: .strMeasure3)
        strMeasure4 = try container.decodeIfPresent(String.self, forKey: .strMeasure4)
        strMeasure5 = try container.decodeIfPresent(String.self, forKey: .strMeasure5)
        
        strMeasure6 = try container.decodeIfPresent(String.self, forKey: .strMeasure6)
        strMeasure7 = try container.decodeIfPresent(String.self, forKey: .strMeasure7)
        strMeasure8 = try container.decodeIfPresent(String.self, forKey: .strMeasure8)
        strMeasure9 = try container.decodeIfPresent(String.self, forKey: .strMeasure9)
        strMeasure10 = try container.decodeIfPresent(String.self, forKey: .strMeasure10)
        
        strMeasure11 = try container.decodeIfPresent(String.self, forKey: .strMeasure11)
        strMeasure12 = try container.decodeIfPresent(String.self, forKey: .strMeasure12)
        strMeasure13 = try container.decodeIfPresent(String.self, forKey: .strMeasure13)
        strMeasure14 = try container.decodeIfPresent(String.self, forKey: .strMeasure14)
        strMeasure15 = try container.decodeIfPresent(String.self, forKey: .strMeasure15)
        
        strMeasure16 = try container.decodeIfPresent(String.self, forKey: .strMeasure16)
        strMeasure17 = try container.decodeIfPresent(String.self, forKey: .strMeasure17)
        strMeasure18 = try container.decodeIfPresent(String.self, forKey: .strMeasure18)
        strMeasure19 = try container.decodeIfPresent(String.self, forKey: .strMeasure19)
        strMeasure20 = try container.decodeIfPresent(String.self, forKey: .strMeasure20)
    }
}
