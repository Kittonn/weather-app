//
//  Endpoint.swift
//  Weather App
//
//  Created by กิตติพศ หลำบางช้าง on 28/12/2568 BE.
//

import Foundation

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
            ])
        case .airPollution(lat: let lat, lon: let lon):
            return RequestParameters(queryItems: [
                URLQueryItem(name: "lat", value: "\(lat)"),
                URLQueryItem(name: "lon", value: "\(lon)"),
            ])
            
        }
    }
}
