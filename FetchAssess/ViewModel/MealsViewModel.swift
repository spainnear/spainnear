//
//  Untitled.swift
//  Fetch
//
//  Created by James O'Mahoney on 8/16/24.
//

import Foundation

let mealsUrl = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")
let detailsUrlString = "https://themealdb.com/api/json/v1/1/lookup.php?i="


public class MealsViewModel: ObservableObject {
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func fetchMeals() async throws -> Meals {
        let url = mealsUrl
        let request = URLRequest(url: url!)
        let (data, response) = try await URLSession.shared.data(for: request)
        let serverResponse = response as? HTTPURLResponse
        do {
            if serverResponse?.statusCode == 200 {
                let decoder = JSONDecoder()
                let meals = try decoder.decode(Meals.self, from: data)
                return meals
            }else {
                throw URLError(.badServerResponse)
            }
        } catch {
            print(error)
            throw error
        }
    }
    
    func fetchMealsDetail(meal_id: Int) async throws -> MealsDetail {
        let detailUrlString = ("\(detailsUrlString)" + "\(meal_id)")
        let detailsUrl = URL(string: detailUrlString)
        let request = URLRequest(url: detailsUrl!)
        let (data, response) = try await URLSession.shared.data(for: request)
        let serverResponse = response as? HTTPURLResponse
        do {
            if serverResponse?.statusCode == 200 {
                let decoder = JSONDecoder()
                let mealsDetail = try decoder.decode(MealsDetail.self, from: data)
                
                return mealsDetail
            }else {
                throw URLError(.badServerResponse)
            }
        } catch {
            print(error)
            throw error
        }
    }
    
    /*
     Assumption:
     we only look for a value for strIngredients since if there is no ingredient value
     the value of strMeasure is irrelevant
     */
    func makeIngredientsArray(mealDetail: [MealDetail]) async throws -> Array<String> {
        var ingredientArray: [String] = []
        // 1 - 5
        if mealDetail[0].strIngredient1 != "" {
            var textString: String = ""
            if mealDetail[0].strMeasure1 != "" {
                textString = ("\(mealDetail[0].strMeasure1 ?? "") ") + ("\(mealDetail[0].strIngredient1 ?? "") ")
            } else {
                textString = "\(mealDetail[0].strIngredient1 ?? "")"
            }
            ingredientArray.append(textString)
        }
        if mealDetail[0].strIngredient2 != "" {
            var textString: String = ""
            if mealDetail[0].strMeasure2 != "" {
                textString = ("\(mealDetail[0].strMeasure2 ?? "") ") + ("\(mealDetail[0].strIngredient2 ?? "") ")
            } else {
                textString = "\(mealDetail[0].strIngredient2 ?? "")"
            }
            ingredientArray.append(textString)
        }
        if mealDetail[0].strIngredient3 != "" {
            var textString: String = ""
            if mealDetail[0].strMeasure3 != "" {
                textString = ("\(mealDetail[0].strMeasure3 ?? "") ") + ("\(mealDetail[0].strIngredient3 ?? "") ")
            } else {
                textString = "\(mealDetail[0].strIngredient3 ?? "")"
            }
            ingredientArray.append(textString)
        }
        if mealDetail[0].strIngredient4 != "" {
            var textString: String = ""
            if mealDetail[0].strMeasure4 != "" {
                textString = ("\(mealDetail[0].strMeasure4 ?? "") ") + ("\(mealDetail[0].strIngredient4 ?? "") ")
            } else {
                textString = "\(mealDetail[0].strIngredient4 ?? "")"
            }
            ingredientArray.append(textString)
        }
        if mealDetail[0].strIngredient5 != "" {
            var textString: String = ""
            if mealDetail[0].strMeasure5 != "" {
                textString = ("\(mealDetail[0].strMeasure5 ?? "") ") + ("\(mealDetail[0].strIngredient5 ?? "") ")
            } else {
                textString = "\(mealDetail[0].strIngredient5 ?? "")"
            }
            ingredientArray.append(textString)
        }
        // 6 - 10
        if mealDetail[0].strIngredient6 != "" {
            var textString: String = ""
            if mealDetail[0].strMeasure6 != "" {
                textString = ("\(mealDetail[0].strMeasure6 ?? "") ") + ("\(mealDetail[0].strIngredient6 ?? "") ")
            } else {
                textString = "\(mealDetail[0].strIngredient6 ?? "")"
            }
            ingredientArray.append(textString)
        }
        if mealDetail[0].strIngredient7 != "" {
            var textString: String = ""
            if mealDetail[0].strMeasure7 != "" {
                textString = ("\(mealDetail[0].strMeasure7 ?? "") ") + ("\(mealDetail[0].strIngredient7 ?? "") ")
            } else {
                textString = "\(mealDetail[0].strIngredient7 ?? "")"
            }
            ingredientArray.append(textString)
        }
        if mealDetail[0].strIngredient8 != "" {
            var textString: String = ""
            if mealDetail[0].strMeasure8 != "" {
                textString = ("\(mealDetail[0].strMeasure8 ?? "") ") + ("\(mealDetail[0].strIngredient8 ?? "") ")
            } else {
                textString = "\(mealDetail[0].strIngredient8 ?? "")"
            }
            ingredientArray.append(textString)
        }
        if mealDetail[0].strIngredient9 != "" {
            var textString: String = ""
            if mealDetail[0].strMeasure9 != "" {
                textString = ("\(mealDetail[0].strMeasure9 ?? "") ") + ("\(mealDetail[0].strIngredient9 ?? "") ")
            } else {
                textString = "\(mealDetail[0].strIngredient9 ?? "")"
            }
            ingredientArray.append(textString)
        }
        if mealDetail[0].strIngredient10 != "" {
            var textString: String = ""
            if mealDetail[0].strMeasure10 != "" {
                textString = ("\(mealDetail[0].strMeasure10 ?? "") ") + ("\(mealDetail[0].strIngredient10 ?? "") ")
            } else {
                textString = "\(mealDetail[0].strIngredient10 ?? "")"
            }
            ingredientArray.append(textString)
        }
        // 11 - 15
        if mealDetail[0].strIngredient11 != "" {
            var textString: String = ""
            if mealDetail[0].strMeasure11 != "" {
                textString = ("\(mealDetail[0].strMeasure11 ?? "") ") + ("\(mealDetail[0].strIngredient11 ?? "") ")
            } else {
                textString = "\(mealDetail[0].strIngredient11 ?? "")"
            }
            ingredientArray.append(textString)
        }
        if mealDetail[0].strIngredient12 != "" {
            var textString: String = ""
            if mealDetail[0].strMeasure12 != "" {
                textString = ("\(mealDetail[0].strMeasure12 ?? "") ") + ("\(mealDetail[0].strIngredient12 ?? "") ")
            } else {
                textString = "\(mealDetail[0].strIngredient12 ?? "")"
            }
            ingredientArray.append(textString)
        }
        if mealDetail[0].strIngredient13 != "" {
            var textString: String = ""
            if mealDetail[0].strMeasure13 != "" {
                textString = ("\(mealDetail[0].strMeasure13 ?? "") ") + ("\(mealDetail[0].strIngredient13 ?? "") ")
            } else {
                textString = "\(mealDetail[0].strIngredient13 ?? "")"
            }
            ingredientArray.append(textString)
        }
        if mealDetail[0].strIngredient14 != "" {
            var textString: String = ""
            if mealDetail[0].strMeasure14 != "" {
                textString = ("\(mealDetail[0].strMeasure14 ?? "") ") + ("\(mealDetail[0].strIngredient14 ?? "") ")
            } else {
                textString = "\(mealDetail[0].strIngredient14 ?? "")"
            }
            ingredientArray.append(textString)
        }
        if mealDetail[0].strIngredient15 != "" {
            var textString: String = ""
            if mealDetail[0].strMeasure15 != "" {
                textString = ("\(mealDetail[0].strMeasure15 ?? "") ") + ("\(mealDetail[0].strIngredient15 ?? "") ")
            } else {
                textString = "\(mealDetail[0].strIngredient15 ?? "")"
            }
            ingredientArray.append(textString)
        }
        // 16 - 20
        if mealDetail[0].strIngredient16 != "" {
            var textString: String = ""
            if mealDetail[0].strMeasure16 != "" {
                textString = ("\(mealDetail[0].strMeasure16 ?? "") ") + ("\(mealDetail[0].strIngredient16 ?? "") ")
            } else {
                textString = "\(mealDetail[0].strIngredient16 ?? "")"
            }
            ingredientArray.append(textString)
        }
        if mealDetail[0].strIngredient17 != "" {
            var textString: String = ""
            if mealDetail[0].strMeasure17 != "" {
                textString = ("\(mealDetail[0].strMeasure17 ?? "") ") + ("\(mealDetail[0].strIngredient17 ?? "") ")
            } else {
                textString = "\(mealDetail[0].strIngredient17 ?? "")"
            }
            ingredientArray.append(textString)
        }
        if mealDetail[0].strIngredient18 != "" {
            var textString: String = ""
            if mealDetail[0].strMeasure18 != "" {
                textString = ("\(mealDetail[0].strMeasure18 ?? "") ") + ("\(mealDetail[0].strIngredient18 ?? "") ")
            } else {
                textString = "\(mealDetail[0].strIngredient18 ?? "")"
            }
            ingredientArray.append(textString)
        }
        if mealDetail[0].strIngredient19 != "" {
            var textString: String = ""
            if mealDetail[0].strMeasure19 != "" {
                textString = ("\(mealDetail[0].strMeasure19 ?? "") ") + ("\(mealDetail[0].strIngredient19 ?? "") ")
            } else {
                textString = "\(mealDetail[0].strIngredient19 ?? "")"
            }
            ingredientArray.append(textString)
        }
        if mealDetail[0].strIngredient20 != "" {
            var textString: String = ""
            if mealDetail[0].strMeasure20 != "" {
                textString = ("\(mealDetail[0].strMeasure20 ?? "") ") + ("\(mealDetail[0].strIngredient20 ?? "") ")
            } else {
                textString = "\(mealDetail[0].strIngredient20 ?? "")"
            }
            ingredientArray.append(textString)
        }
        
        return ingredientArray
    }
    
}
