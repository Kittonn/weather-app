//
//  Weather.swift
//  Weather App
//
//  Created by กิตติพศ หลำบางช้าง on 28/12/2568 BE.
//

import Foundation

// Reference: https://openweathermap.org/current

struct Weather: Codable {
    let coord: Coordinates
    let weather: [WeatherCondition]
    let base: String
    let main: WeatherMain
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let dt: Int
    let sys: WeatherSys
    let timezone: Int
    let id: Int
    let cod: Int
    let name: String
    let snow: Snow?
    let rain: Rain?
}

struct WeatherSys: Codable {
    let type: Int
    let id: Int
    let country: String
    let sunrise: Int
    let sunset: Int
}

struct WeatherMain: Codable {
    let temp: Double
    let feelsLike: Double
    let tempMax: Double
    let tempMin: Double
    let pressure: Double
    let seaLevel: Double
    let humidity: Double
    let grndLevel: Double
    
    enum CodingKeys: String, CodingKey {
        case temp, pressure, humidity
        case feelsLike = "feels_like"
        case tempMax = "temp_max"
        case tempMin = "temp_min"
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
    }
}
