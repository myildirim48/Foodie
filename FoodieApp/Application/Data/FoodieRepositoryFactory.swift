//
//  FoodieRepositoryFactory.swift
//  FoodieApp
//
//  Created by YILDIRIM on 2.08.2023.
//

import Foundation
enum FoodieRepositoryFactory {
    static func makeMainRepository() -> FoodieMainRepository {
        let service = NetworkService()
        return FoodieMainRepository(service: service)
    }
    
    static func makeDetailRepository() -> FoodieDetailRepository {
        let service = NetworkService()
        return FoodieDetailRepository(service: service)
    }
}
