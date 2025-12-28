//
//  Pollution.swift
//  Weather App
//
//  Created by กิตติพศ หลำบางช้าง on 28/12/2568 BE.
//

import Foundation

// Reference: https://openweathermap.org/api/air-pollution

struct AirPollutionMain: Codable {
    let aqi: Int
}

struct AirPollutionComponents: Codable {
    let co: Double
    let no: Double
    let no2: Double
    let o3: Double
    let so2: Double
    let pm2_5: Double
    let pm10: Double
    let nh3: Double
}

struct AirPollutionItem: Codable {
    let main: AirPollutionMain
    let components: AirPollutionComponents
    let dt: Int
}

struct AirPollution: Codable {
    let coord: Coordinates
    let list: [AirPollutionItem]
}
