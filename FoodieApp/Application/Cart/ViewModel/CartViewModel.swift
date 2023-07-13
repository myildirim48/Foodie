//
//  CartViewModel.swift
//  FoodieApp
//
//  Created by YILDIRIM on 6.07.2023.
//

import Foundation
class CartViewModel: ObservableObject {
    @Published var meals = Meals.mockMeals.meals
}
