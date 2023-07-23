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

struct MealCategories: MealModelProtocol, Codable, Identifiable, Hashable {
    
    var id: String
    var strMeal: String
    var strMealThumb: String
    
    var price = Double.random(in: 3...25)
    
    public func hash(into hasher: inout Hasher) {
          return hasher.combine(id)
      }
    
    static func == (lhs: MealCategories, rhs: MealCategories) -> Bool {
        return lhs.id == rhs.id
    }
    
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
