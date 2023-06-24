//
//  NetworkService.swift
//  FoodieApp
//
//  Created by YILDIRIM on 23.06.2023.
//

import Foundation
protocol FoodieServiceable {
    func getCategories() async throws -> Category
}

class NetworkService: FoodieServiceable, HTTPClient {
    func getCategories() async throws -> Category {
        return try await sendRequest(endpoint: FoodieEndPoints.category, responseModel: Category.self)
    }
}
