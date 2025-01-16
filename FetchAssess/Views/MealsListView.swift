//
//  ContentView.swift
//  Fetch
//
//  Created by James O'Mahoney on 8/16/24.
//

import SwiftUI

struct MealsListView: View {
    let mealsViewModel = MealsViewModel()
    @State var meals: Meals?
    @State var meal: [Meal]?
    
    var body: some View {
            VStack {
                Text("Tasty Meals")
                    .font(.largeTitle)
                
                List(meal?.sorted(by: { $0.strMeal ?? "" < $1.strMeal ?? "" }) ?? [], id: \.self) { meal in
                    HStack {
                        AsyncImage(url: URL(string:meal.strMealThumb ?? ""))
                                .frame(width: 50, height: 50)
                                .cornerRadius(10)
                        NavigationLink(
                            destination: MealsDetailView(meal_Id: Int(meal.id ?? "")),
                            label: {
                                Text(meal.strMeal ?? "Meal")
                            }
                        )
                    }
                }
            }
        .padding()
        .task {
            do {
                meals = try await mealsViewModel.fetchMeals()
                meal = meals?.meals
            } catch {
                print("Error")
            }
        }
        .navigationBarBackButtonHidden(true)
    }
        
}

#Preview {
    MealsListView()
}
