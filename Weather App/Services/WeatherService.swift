//
//  WeatherService.swift
//  Weather App
//
//  Created by กิตติพศ หลำบางช้าง on 29/12/2568 BE.
//

import Foundation

protocol WeatherServiceProtocol {
    func fetchWeather(city: String) async throws -> Weather
    func fetchForecast(city: String) async throws -> Forecast
    func fetchAirPollution(lat: Double, lon: Double) async throws -> AirPollution
}

final class WeatherService: WeatherServiceProtocol {
    private let httpClient: HTTPClient
    
    init(httpClient: HTTPClient = HTTPClient()) {
        self.httpClient = httpClient
    }
    
    func fetchWeather(city: String) async throws -> Weather {
        let endpoint = WeatherEndpoint.current(city: city)
        return try await httpClient.request(endpoint)
    }
    
    func fetchForecast(city: String) async throws -> Forecast {
        let endpoint = WeatherEndpoint.forecast(city: city)
        return try await httpClient.request(endpoint)
    }
    
    func fetchAirPollution(lat: Double, lon: Double) async throws -> AirPollution {
        let endpoint = WeatherEndpoint.airPollution(lat: lat, lon: lon)
        return try await httpClient.request(endpoint)
    }
}
