//
//  MealsViewModel.swift
//  FoodieApp
//
//  Created by YILDIRIM on 27.06.2023.
//

import Foundation
extension MealsView {
    @MainActor
    final class MealsViewModel: ObservableObject {
        private var service: NetworkService
        
        private var meals: [MealCategories] = []
        @Published var categories: [CategoryResult] = []
        @Published var searchtext: String = ""
        
        var mealSearchable: [MealCategories] {
            
                let query = searchtext.lowercased()
                return meals.filter { $0.strMeal.contains(query) }
        }
        
        
        init(service: NetworkService) {
            self.service = service
            Task {
                await getCategories()
            }
        }
        
        //MARK: - Networking - Fetching data funcs
        func getMealsByCategory(category: String) async {
            do {
                meals = []
                try await meals = service.getMealByCategory(category: category).meals
            } catch {
                //TODO: - Show error to user
                print(error.localizedDescription)
            }
        }
        
        func getCategories() async {
            do {
                try await categories = service.getCategories().categories
            } catch {
                //TODO: - Show error to user
            }
        }
    }
}
