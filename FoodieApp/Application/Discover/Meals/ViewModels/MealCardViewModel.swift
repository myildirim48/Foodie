//
//  MealCardViewModel.swift
//  FoodieApp
//
//  Created by YILDIRIM on 14.07.2023.
//

import Foundation
import RealmSwift

extension MealCardView {
    class MealCardViewModel: ObservableObject {
        @ObservedResults(CartModel.self) var cart
        @Published var savedToCart: Bool = false
        
        //MARK: - Realm Funcs
        func addToCart(meal: MealCategories) {
                //TODO: - add object to realm
            
                do {
                    let realm = try! Realm()
                    print("User Realm User file location: \(realm.configuration.fileURL!.path)")
                    guard let objectToUpdate = realm.object(ofType: CartModel.self, forPrimaryKey: meal.id) else {
                        
                        let newCartItem = CartModel(id: meal.id,name: meal.strMeal, imgUrl: meal.strMealThumb, price: meal.price, quantity: 1)
                        $cart.append(newCartItem)
                        savedToCart = true
                        return
                    }
                    
                    try realm.write({
                        realm.delete(objectToUpdate)
                        savedToCart = false
                    })
                } catch {
                    print(error.localizedDescription)
                }
            }
    }
}
