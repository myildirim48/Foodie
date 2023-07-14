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
    
    @Persisted(primaryKey: true) var _id: String
    @Persisted var name: String
//    @Persisted var areaAndCategory: String
    @Persisted var imageUrl: String
    @Persisted var price: Double
    @Persisted var offset: Double
    @Persisted var isSwiped: Bool

    convenience init(name: String, imgUrl: String, price: Double) {
        self.init()
        self.name = name
//        self.areaAndCategory = areaAndCategory
        self.imageUrl = imgUrl
        self.price = price
        self.offset = 0
        self.isSwiped = false
    }
}
