//
//  HTTPClient.swift
//  FoodieApp
//
//  Created by YILDIRIM on 22.06.2023.
//

import Foundation

protocol HTTPClient {
    func sendRequest<T: Decodable>(endpoint: Endpoint, responseModel: T.Type) async throws -> T
}

class NetworkService: HTTPClient {

    func sendRequest<T: Decodable>(
        endpoint: Endpoint,
        responseModel: T.Type
    ) async throws -> T{
        var urlComponents = URLComponents()
        urlComponents.scheme = endpoint.scheme
        urlComponents.host = endpoint.host
        urlComponents.path = endpoint.path
        
//        Adding params like search
        if let params = endpoint.params {
            urlComponents.queryItems = [params]
        }
                
        guard let url = urlComponents.url else {
            throw HTTPClientError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
//        request.allHTTPHeaderFields = endpoint.header

        if let body = endpoint.body {
            do {
                request.httpBody = try JSONEncoder().encode(body)
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            } catch {
                throw HTTPClientError.unknown
            }
            }
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request, delegate: nil)
                   guard let httpResponse = response as? HTTPURLResponse else {
                       throw HTTPClientError.noResponse
                   }
            
            switch httpResponse.statusCode {
            case 200...299:
                do {
                    let decodedResponse = try JSONDecoder().decode(responseModel, from: data)
                    return decodedResponse
                    
                } catch {
                    throw HTTPClientError.decode
                }
            case 401:
                throw HTTPClientError.unauthorized
            default:
                throw HTTPClientError.unexpectedStatusCode
            }
        } catch {
            throw HTTPClientError.unknown
        }
    }
}
