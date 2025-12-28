//
//  APIClient.swift
//  Weather App
//
//  Created by กิตติพศ หลำบางช้าง on 28/12/2568 BE.
//

import Foundation

enum HTTPError: Error {
    case invalidURL
    case invalidResponse
    case serverError(statusCode: Int)
    case decodingError(Error)
}

protocol HTTPClientProtocol {
    func request<T: Decodable>(_ endpoint: Endpoint) async throws -> T
}

final class HTTPClient: HTTPClientProtocol {
    func request<T: Decodable>(_ endpoint: Endpoint) async throws -> T {
        guard let baseURL = URL(string: endpoint.baseURL) else {
            throw HTTPError.invalidURL
        }
        
        var components = URLComponents(
            url: baseURL.appendingPathComponent(endpoint.path),
            resolvingAgainstBaseURL: false
        )
        
        components?.queryItems = endpoint.requestParameters?.queryItems
        
        guard let url = components?.url else {
            throw HTTPError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        endpoint.headers?.forEach { key, value in
            request.setValue(value, forHTTPHeaderField: key)
        }
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw HTTPError.invalidResponse
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw HTTPError.serverError(statusCode: httpResponse.statusCode)
        }
        
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw HTTPError.decodingError(error)
        }
    }
}
