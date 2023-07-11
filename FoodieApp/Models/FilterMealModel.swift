//
//  FilterMealModel.swift
//  FoodieApp
//
//  Created by YILDIRIM on 9.07.2023.
//

import Foundation

struct FilterMealModel: Codable {
        let meals: [MealCategories]
    }

struct MealCategories: Codable, Identifiable, Hashable {
    
    let strMeal: String
    let strMealThumb: String
    let id: String
    
    var price = Double.random(in: 3...25)
    
    func priceUI() -> (leftPart: Int, rightPart: Int) {
        return price.splitIntoParts(decimalPlaces: 2, round: true)
    }
    
    
    public func hash(into hasher: inout Hasher) {
          return hasher.combine(id)
      }
    
    static func == (lhs: MealCategories, rhs: MealCategories) -> Bool {
        return lhs.id == rhs.id
    }
    
    
    
    // MARK: - Enumerations
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case strMeal, strMealThumb
    }
}
//MARK: - Mocking
extension FilterMealModel {
    static var mockMeals: [MealCategories] {
        Bundle.main.decode([MealCategories].self, from: "Categories.json")
    }
    static var mockMeal: MealCategories {
        Self.mockMeals[0]
    }
}
