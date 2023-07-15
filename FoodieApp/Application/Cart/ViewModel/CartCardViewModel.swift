//
//  CartViewModel.swift
//  FoodieApp
//
//  Created by YILDIRIM on 6.07.2023.
//

import Foundation
import RealmSwift
import SwiftUI

class CartCardViewModel: ObservableObject {
    @ObservedResults(CartModel.self) var cartItems
    @Published var totalPrice = 0.0
    
    init() {
        calculateTotalPrice()
    }
    
    func calculateTotalPrice() {
        cartItems.forEach { item in
            totalPrice += item.price
        }
    }
    
//    Realm Funcs
    func addOneMore(meal: CartModel) {
        do {
            let realm = try! Realm()
            
            guard let mealsOnCart = realm.object(ofType: CartModel.self, forPrimaryKey: meal.id) else {
                print("Meal not found")
                return
            }
            
            try realm.write({
                mealsOnCart.quantity += 1
            })
        } catch {
            print("Error while adding one more to cart", error.localizedDescription)
        }
    }
    
    func deleteFromRealm(meal: CartModel) {
        do {
            let realm = try! Realm()
            
            guard let meal = realm.object(ofType: CartModel.self, forPrimaryKey: meal.id) else { return }
            try realm.write({
                realm.delete(meal)
            })
        } catch {
            print("Error while deleting from realm", error.localizedDescription)
        }
    }
}
