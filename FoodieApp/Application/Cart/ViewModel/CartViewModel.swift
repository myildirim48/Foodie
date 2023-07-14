//
//  CartViewModel.swift
//  FoodieApp
//
//  Created by YILDIRIM on 6.07.2023.
//

import Foundation
import RealmSwift

class CartViewModel: ObservableObject {
    @Published var meals = Meals.mockMeals.meals
    @ObservedResults(CartModel.self) var cartItems
    
//    Realm Funcs
    func addOneMore() {
        
    }
}
