//
//  NetworkService.swift
//  FoodieApp
//
//  Created by YILDIRIM on 23.06.2023.
//

import Foundation
protocol FoodieServiceable {
    func getCategories() async throws -> Category
    func getMealByCategory(category: String) async throws -> Meals
    func getMealByID(id: String) async throws -> MealDetail
}

class NetworkService: FoodieServiceable, HTTPClient {
    func getMealByCategory(category: String) async throws -> Meals {
        return try await sendRequest(endpoint: FoodieEndPoints.mealByCategory(category: category), responseModel: Meals.self)
    }
    
    func getCategories() async throws -> Category {
        return try await sendRequest(endpoint: FoodieEndPoints.category, responseModel: Category.self)
    }
    
    func getMealByID(id: String) async throws -> MealDetail {
        return try await sendRequest(endpoint: FoodieEndPoints.mealByID(ID: id), responseModel: MealDetail.self)
    }
}
