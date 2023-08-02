//
//  MealDetailViewModel.swift
//  FoodieApp
//
//  Created by YILDIRIM on 3.07.2023.
//

import Foundation
import RealmSwift

extension MealDetailView {
    @MainActor
    class MealDetailViewModel: ObservableObject {
        private var repository: FoodieDetailRepository
        
        @Published var meal = MealDetailData(meal: ["String" : "String"])
        @ObservedResults(CartModel.self) private var cartItems
        @ObservedResults(RealmModel.self) private var favorites
        
        init(repository: FoodieDetailRepository) {
            self.repository = repository
        }

//MARK: - Realm
        func addToFavorites(price:Double) {
            do {
                let realm = try! Realm()
                print("User Realm User file location: \(realm.configuration.fileURL!.path)")
                guard let objectToUpdate = realm.object(ofType: RealmModel.self, forPrimaryKey: meal.id) else {
                    
                    let newCartItem = RealmModel(id: meal.id,
                                                 name: meal.name,
                                                 imgUrl: meal.imgUrl,
                                                 price: price)
                    $favorites.append(newCartItem)
                    return
                }
                
                try realm.write({
                    realm.delete(objectToUpdate)
                })
                
                print("Saved")
            } catch {
                print(error.localizedDescription)
            }
        }
                    
        func addToCart(price: Double) {
                do {
                    let realm = try! Realm()
                    print("User Realm User file location: \(realm.configuration.fileURL!.path)")
                    guard let objectToUpdate = realm.object(ofType: CartModel.self, forPrimaryKey: meal.id) else {
                        
                        let newCartItem = CartModel(id: meal.id,
                                                    name: meal.name,
                                                    imgUrl: meal.imgUrl, price: price, quantity: 1)
                        $cartItems.append(newCartItem)
                        return
                    }
                    
                    try realm.write({
                        realm.delete(objectToUpdate)
                    })
                    
                    print("Saved")
                } catch {
                    print(error.localizedDescription)
                }
            }
        
        
//MARK: - Fetch data
        func getMaealDetail(id: String) async {
            do {
                try await meal = repository.getMealByID(id: id).convertToUIModel()
            } catch {
                //TODO: - Show error to user
                print(error.localizedDescription)
            }
        }
        
        //MARK: - Data to ui

    }
    
}
