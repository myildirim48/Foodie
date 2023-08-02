//
//  Category.swift
//  FoodieApp
//
//  Created by YILDIRIM on 23.06.2023.
//

import Foundation
struct Category: Codable {
    let categories: [CategoryResult]
}

// MARK: - CategoryResult
struct CategoryResult: Codable, Equatable, Hashable, Identifiable{
    let id, strCategory: String
    let strCategoryThumb: String
    let strCategoryDescription: String
    
    // MARK: - Enumerations
    enum CodingKeys: String, CodingKey {
        case id = "idCategory"
        case strCategory, strCategoryThumb, strCategoryDescription
    }
}


extension Category {
    static var mockCategories: Category {
        Bundle.main.decode(Category.self, from: "Categories.json")
    }
    static var mockCategory: CategoryResult {
        Self.mockCategories.categories[0]
    }
}
