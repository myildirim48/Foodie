//
//  FoodieDetailRepository.swift
//  FoodieApp
//
//  Created by YILDIRIM on 31.07.2023.
//

import Foundation
protocol FoodieDetailRepositoryProtocol {
    func getMealByID(id: String) async throws -> MealDetail
}

class FoodieDetailRepository: FoodieDetailRepositoryProtocol {
    
    private var service: NetworkService
    typealias endpoint = FoodieEndPoints
    
    init(service: NetworkService) {
        self.service = service
    }
    
    func getMealByID(id: String) async throws -> MealDetail {
        try await service.sendRequest(endpoint: endpoint.mealByID(ID: id),
                                      responseModel: MealDetail.self)
    }
}
