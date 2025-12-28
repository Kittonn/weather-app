//
//  APIClient.swift
//  Weather App
//
//  Created by กิตติพศ หลำบางช้าง on 28/12/2568 BE.
//

import Foundation

enum HTTPMethod: String {
    case GET
    case POST
    case DELETE
    case PUT
    case PATCH
}

struct RequestParameters {
    var body: [String: Any]?
    var queryItems: [URLQueryItem]?
}

protocol Endpoint {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var requestParameters: RequestParameters? { get }
}

extension Endpoint {
    var headers: [String: String]? {
        return nil
    }
    
    var requestParameters: RequestParameters? {
        return nil
    }
}
