//
//  CartModel.swift
//  FoodieApp
//
//  Created by YILDIRIM on 14.07.2023.
//

import Foundation
import SwiftUI
import RealmSwift

class CartModel: Object, ObjectKeyIdentifiable {
    
    @Persisted(primaryKey: true) var id: String
    @Persisted var name: String
//    @Persisted var areaAndCategory: String
    @Persisted var imageUrl: String
    @Persisted var price: Double
    @Persisted var quantity: Int
    

    convenience init(id: String,name: String, imgUrl: String, price: Double, quantity: Int) {
        self.init()
        self.id = id
        self.name = name
//        self.areaAndCategory = areaAndCategory
        self.imageUrl = imgUrl
        self.price = price
        self.quantity = quantity
    }
}
