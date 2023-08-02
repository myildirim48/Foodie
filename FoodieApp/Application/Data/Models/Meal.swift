//
//  Meal.swift
//  FoodieApp
//
//  Created by YILDIRIM on 24.06.2023.
//

import Foundation
struct Meals: Codable {
    let meals: [MealModel]
}

protocol MealModelProtocol {
    var id: String { get }
    var strMeal: String { get }
    var strMealThumb: String { get }
    var price: Double { get }
    
    func convertPriceDoubleToUI() -> (leftPart: Int, rightPart: Int)
}

extension MealModelProtocol {
    func convertPriceDoubleToUI() -> (leftPart: Int, rightPart: Int) {
       return price.splitIntoParts(decimalPlaces: 2, round: true)
   }
    
}

struct MealModel: MealModelProtocol, Codable, Identifiable {
    
    var id: String
    var strMeal: String
    var strMealThumb: String
    let strCategory: String
    let strArea: String
    
    //MARK: - CustomSwipe
    var offset: CGFloat = 0
    var isSwiped: Bool = false
    
    var price: Double = Double.random(in: 3...25)
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case strMeal, strMealThumb, strArea, strCategory
    }
    
}
