//
//  Forecast.swift
//  Weather App
//
//  Created by กิตติพศ หลำบางช้าง on 28/12/2568 BE.
//

import Foundation

// Reference: https://openweathermap.org/forecast5

struct Forecast: Codable {
    let cod: String
    let message : Int
    let cnt: Int
    let city: City
    let list: [ForecastItem]
}

struct ForecastItem: Codable {
    let dt: Int
    let main: ForecastMain
    let weather: [WeatherCondition]
    let clouds: Clouds
    let visibility: Int
    let pop: Double
    let sys: ForecastSys
    let dtTxt: String
    let wind: Wind
    let snow: Snow?
    let rain: Rain?
    
    enum CodingKeys: String, CodingKey  {
        case dt, main, weather, clouds, visibility, pop, sys, wind, snow, rain
        case dtTxt = "dt_txt"
    }
}

struct ForecastMain: Codable {
    let temp: Double
    let feelsLike: Double
    let pressure: Int
    let tempMin: Double
    let tempMax: Double
    let seaLevel: Int
    let grndLevel: Int
    let humidity: Int
    let tempKf: Double
    
    enum CodingKeys: String, CodingKey  {
        case temp, pressure, humidity
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case grndLevel = "grnd_level"
        case tempKf = "temp_kf"
        case feelsLike = "feels_like"
        case seaLevel = "sea_level"
    }
}

struct ForecastSys: Codable {
    let pod: String
}

struct City: Codable {
    let id: Int
    let name: String
    let coord: Coordinates
    let country: String
    let population: Int
    let timezone: Int
    let sunrise: Int
    let sunset: Int
}
