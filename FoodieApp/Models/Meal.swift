//
//  Meal.swift
//  FoodieApp
//
//  Created by YILDIRIM on 24.06.2023.
//

import Foundation
struct Meals: Codable {
    let meals: [Meal]
}
struct Meal: Codable, Identifiable, Hashable {
    
    let strMeal: String
    let strMealThumb: String
    let id: String
    let price = Double.random(in: 3...25).splitIntoParts(decimalPlaces: 2, round: true)
    
    public func hash(into hasher: inout Hasher) {
          return hasher.combine(id)
      }
    
    static func == (lhs: Meal, rhs: Meal) -> Bool {
        return lhs.id == rhs.id
    }
    
    // MARK: - Enumerations
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case strMeal, strMealThumb
    }
}
