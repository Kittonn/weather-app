//
//  Endpoint.swift
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

enum WeatherEndpoint: Endpoint {
    case current(city: String)
    case forecast(city: String)
    case airPollution(lat: Double, lon: Double)
    
    var baseURL: String {
        "https://api.openweathermap.org/"
    }
    
    var path: String {
        switch self {
        case .current:
            return "/data/2.5/weather"
        case .forecast:
            return "/data/2.5/forecast"
        case .airPollution:
            return "/data/2.5/air_pollution"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        default:
            return .GET
        }
    }
    
    var requestParameters: RequestParameters? {
        switch self {
        case .current(let city):
            return RequestParameters(queryItems: [
                URLQueryItem(name: "q", value: city),
                URLQueryItem(name: "app_id", value: "API_KEY")
                
            ])
        case .forecast(let city):
            return RequestParameters(queryItems: [
                URLQueryItem(name: "q", value: city),
                URLQueryItem(name: "app_id", value: "API_KEY")
            ])
        case .airPollution(lat: let lat, lon: let lon):
            return RequestParameters(queryItems: [
                URLQueryItem(name: "lat", value: "\(lat)"),
                URLQueryItem(name: "lon", value: "\(lon)"),
                URLQueryItem(name: "app_id", value: "API_KEY")
            ])
            
        }
    }
}
