//
//  HTTPClientError.swift
//  FoodieApp
//
//  Created by YILDIRIM on 2.08.2023.
//

import Foundation
enum HTTPClientError: Error {
    case decode
    case invalidURL
    case noResponse
    case unauthorized
    case unexpectedStatusCode
    case unknown
    
    var customMessage: String {
        switch self {
        case .decode:
            return "Decode error"
        case .unauthorized:
            return "Session expired"
        default:
            return "Unknown error"
        }
    }
}
