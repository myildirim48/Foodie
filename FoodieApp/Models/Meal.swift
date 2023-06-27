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
struct Meal: Codable, Identifiable {
    let strMeal: String
    let strMealThumb: String
    let id: String
    
    // MARK: - Enumerations
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case strMeal, strMealThumb
    }
}
