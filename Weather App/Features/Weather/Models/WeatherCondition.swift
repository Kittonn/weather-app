//
//  WeatherCondition.swift
//  Weather App
//
//  Created by กิตติพศ หลำบางช้าง on 28/12/2568 BE.
//

import Foundation

struct WeatherCondition: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}
