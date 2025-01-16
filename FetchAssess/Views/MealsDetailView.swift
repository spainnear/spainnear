//
//  MealsDetailView.swift
//  Fetch
//
//  Created by James O'Mahoney on 8/17/24.
//

import SwiftUI

struct MealsDetailView: View {
    let mealsViewModel = MealsViewModel()
    @State var meal_Id: Int?
    @State var mealsDetail: MealsDetail?
    @State var mealDetail: [MealDetail]?
    @State var ingredientArray:[String] = []

    var body: some View {
        ScrollView {
            LazyVStack {
                Text(String(mealDetail?[0].strMeal ?? ""))
                    .font(.largeTitle)
                Spacer()
                    .frame(height: 10)
                Text("Instructions:")
                    .font(.title3)
                Text(mealDetail?[0].strInstructions ?? "")
                    .foregroundStyle(.red)
                Spacer()
                    .frame(height: 20)
                Text("Ingredients:")
                    .font(.title3)
                Spacer()
                    .frame(height: 10)
                // Measure and ingredients when available
                ForEach(ingredientArray.indices, id: \.self) { index in
                    Text(ingredientArray[index])
                }
            }
            .padding()
            .task {
                do {
                    mealsDetail = try await mealsViewModel.fetchMealsDetail(
                        meal_id: meal_Id ?? 0)
                    mealDetail = mealsDetail?.mealsDetail
                    ingredientArray = try await mealsViewModel.makeIngredientsArray(mealDetail: mealDetail ?? [])
                } catch {
                    print("Error")
                }
            }
        }
    }
}

#Preview {
    MealsDetailView()
}
