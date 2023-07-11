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
    let strCategory: String?
    let strArea: String?
    let id: String
    
    //MARK: - CustomSwipe
    var offset: CGFloat = 0
    var isSwiped: Bool = false
    
    var price = Double.random(in: 3...25)
    func priceUI() -> (leftPart: Int, rightPart: Int) {
        return price.splitIntoParts(decimalPlaces: 2, round: true)
    }
    
    
    public func hash(into hasher: inout Hasher) {
          return hasher.combine(id)
      }
    
    static func == (lhs: Meal, rhs: Meal) -> Bool {
        return lhs.id == rhs.id
    }
    
    
    
    // MARK: - Enumerations
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case strMeal, strMealThumb, offset, isSwiped, strCategory, strArea
    }
}
//MARK: - Mocking
extension Meals {
    static var mockMeals: [Meal] {
        Bundle.main.decode([Meal].self, from: "MealDetailMock.json")
    }
    static var mockMeal: Meal {
        Self.mockMeals[0]
    }
}
