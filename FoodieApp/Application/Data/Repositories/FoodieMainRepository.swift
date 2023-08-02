//
//  FoodieMainRepository.swift
//  FoodieApp
//
//  Created by YILDIRIM on 31.07.2023.
//

import Foundation
protocol FoodieMainRepositoryProtocol {
    func getCategories() async throws -> Category
    func getMealByCategory(category: String) async throws -> FilterMealModel
}

class FoodieMainRepository: FoodieMainRepositoryProtocol {
    
    var service: NetworkService
    typealias endpoint = FoodieEndPoints
    
    init(service: NetworkService) {
        self.service = service
    }
    
    func getCategories() async throws -> Category {
        try await service.sendRequest(endpoint: endpoint.category,
                            responseModel: Category.self)
    }
    
    func getMealByCategory(category: String) async throws -> FilterMealModel {
        try await service.sendRequest(endpoint: endpoint.mealByCategory(category: category),
                            responseModel: FilterMealModel.self)
    }
}
