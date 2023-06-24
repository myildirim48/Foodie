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
struct CategoryResult: Codable, Equatable, Hashable{
    let idCategory, strCategory: String
    let strCategoryThumb: String
    let strCategoryDescription: String
}
