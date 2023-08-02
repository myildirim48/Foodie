//
//  MealDetail.swift
//  FoodieApp
//
//  Created by YILDIRIM on 3.07.2023.
//

import Foundation
struct MealDetail: Codable {
    let meals: [[String: String?]]
    
    func convertToUIModel() -> MealDetailData {
        .init(meal: meals.first!)
    }
}

struct MealDetailData {
    private var meal: [String: String?]
    
    init(meal: [String : String?]) {
        self.meal = meal
    }
    
    //        Data
    private func dicToData(type: String) -> String {
        return (meal[type] ?? "") ?? ""
    }
    
    var id: String {
        return dicToData(type: "idMeal")
    }
    
    var name: String {
        return dicToData(type: "strMeal")
    }
    
    var imgUrl: String {
        return dicToData(type: "strMealThumb")
    }
    
    var category: String {
        return dicToData(type: "strCategory")
    }
    
    var area: String {
        return dicToData(type: "strArea")
    }
    
    var about: String {
        return dicToData(type: "strInstructions")
    }
    
    var ingreddients: [String] {
        var data = [String]()
        
        for i in 1...20 {
            let ing = dicToData(type: "strIngredient\(i)")
            
            if !ing.isEmpty {
                data.append(ing)
            }
        }
        return data
    }
    
}
