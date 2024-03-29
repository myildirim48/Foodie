//
//  FoodieEndPoints.swift
//  FoodieApp
//
//  Created by YILDIRIM on 22.06.2023.
//

import Foundation
enum FoodieEndPoints {
    case category
    case mealByCategory(category: String)
    case mealByID(ID: String)
    
}
//I didn't want to write here again and again
private var basePath = "/api/json/v1/1/"

extension FoodieEndPoints: Endpoint {
    
    
    var path: String {
        switch self {
        case .category:
            return basePath + "categories.php"
        case .mealByCategory:
            return basePath + "filter.php"
        case .mealByID:
            return basePath + "lookup.php"
        }
    }
    
    var params: URLQueryItem? {
        switch self {
        case .category:
            return nil
        case .mealByCategory(let category):
            return URLQueryItem(name: "c", value: category)
        case .mealByID(let id):
            return URLQueryItem(name: "i", value: id)
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .category, .mealByCategory, .mealByID:
            return .get
        }
    }
    
    
    var header: [String : String]? {
//        Here is for access token or API_KEY
        return nil
    }
    
    var body: [String : String]? {
        return nil
    }
    
    
}
