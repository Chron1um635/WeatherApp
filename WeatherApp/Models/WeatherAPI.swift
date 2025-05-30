//
//  WeatherAPI.swift
//  WeatherApp
//
//  Created by Максим Назаров on 29.05.2025.
//

struct Condition: Decodable {
    let text: String
    let icon: String
}

struct Day: Decodable {
    let avgtemp_c: Double
    let maxwind_kph: Double
    let avghumidity: Double
    let condition: Condition
}

struct ForecastDay: Decodable {
    let date: String
    let day: Day
}

struct Forecast: Decodable {
    let forecastday: [ForecastDay]
}

struct WeatherAPI: Decodable {
    let forecast: Forecast
}
