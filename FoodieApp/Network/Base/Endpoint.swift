//
//  Endpoint.swift
//  FoodieApp
//
//  Created by YILDIRIM on 22.06.2023.
//

import Foundation
protocol Endpoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var header: [String: String]? { get }
    var body: [String: String]? { get }
    var params: URLQueryItem? { get }
}

extension Endpoint {
    var scheme: String {
        return "https"
    }

    var host: String {
        return "themealdb.com"
    }
}
