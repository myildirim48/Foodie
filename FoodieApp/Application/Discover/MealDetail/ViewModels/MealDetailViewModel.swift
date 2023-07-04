//
//  MealDetailViewModel.swift
//  FoodieApp
//
//  Created by YILDIRIM on 3.07.2023.
//

import Foundation
extension MealDetailView {
    
    
    @MainActor
    final class MealDetailViewModel: ObservableObject {
        private var service: NetworkService
        @Published var meal: [String:String?] = [:]
        
        init(service: NetworkService) {
            self.service = service
            
        }
        
        func getMaealDetail(id: String) async {
            do {
                try await meal = service.getMealByID(id: id).meals.first!
            } catch {
                //TODO: - Show error to user
                print(error.localizedDescription)
            }
        }
        
        //        Data
        private func dicToData(type: String) -> String {
            return (meal[type] ?? "") ?? ""
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
                
                if ing != "" {
                    data.append(ing)
                }
            }
            return data
        }
        
    }
}
