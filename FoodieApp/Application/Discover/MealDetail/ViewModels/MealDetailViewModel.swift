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
    final class MealDetailViewModel: ObservableObject {
        private var service: NetworkService
        @Published var meal: [String:String?] = [:]
        @ObservedResults(CartModel.self) private var cartItems
        
        init(service: NetworkService) {
            self.service = service
        }
        
//MARK: - Realm
        func addToCart(price: Double) {
                do {
                    let realm = try! Realm()
                    print("User Realm User file location: \(realm.configuration.fileURL!.path)")
                    guard let objectToUpdate = realm.object(ofType: CartModel.self, forPrimaryKey: id) else {
                        
                        let newCartItem = CartModel(id: id,name: name, imgUrl: imgUrl, price: price, quantity: 1)
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
                try await meal = service.getMealByID(id: id).meals.first!
            } catch {
                //TODO: - Show error to user
                print(error.localizedDescription)
            }
        }
        
        //MARK: - Data to ui
        //        Data
        private func dicToData(type: String) -> String {
            return (meal[type] ?? "") ?? ""
        }
        private var id: String {
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
                
                if ing != "" {
                    data.append(ing)
                }
            }
            return data
        }
        
    }
}
