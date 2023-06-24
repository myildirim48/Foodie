//
//  FoodieEndPoints.swift
//  FoodieApp
//
//  Created by YILDIRIM on 22.06.2023.
//

import Foundation
enum FoodieEndPoints {
    case category
}

extension FoodieEndPoints: Endpoint {
    var path: String {
        switch self {
        case .category:
            return "/api/json/v1/1/categories.php"
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .category:
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
