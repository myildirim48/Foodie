//
//  DiscoverViewModel.swift
//  FoodieApp
//
//  Created by YILDIRIM on 23.06.2023.
//

import Foundation
import SwiftUI

extension DiscoverView {
    @MainActor
    class DiscoverViewModel: ObservableObject {
        private var service: NetworkService
        @Published var categories: [CategoryResult] = []
        @Published var meals: [Meal] = []
        
        init(service: NetworkService) {
            self.service = service
        }
        
        func getCategories() async {
            do {
                try await categories = service.getCategories().categories
            } catch {
                //                    TODO : Show error to user
            }
        }
        
        func getMealsByCategory(category: String) async {
            do {
                meals = []
                try await meals = service.getMealByCategory(category: category).meals
                print(meals)
            } catch {
                //                    TODO : Show error to user
                print(error.localizedDescription)
            }
        }
    }
}
