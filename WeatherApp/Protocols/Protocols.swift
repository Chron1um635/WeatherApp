//
//  Protocols.swift
//  WeatherApp
//
//  Created by Максим Назаров on 29.05.2025.
//

import Foundation
import Alamofire

// NetworkManager
protocol Network {
    func fetchWeatherForecast(for city: String, within daysCount: Int, completion: @escaping(Result<WeatherAPI, AFError>) -> Void)
    func fetchImageData(from url: String, completion: @escaping(Data) -> Void)
}
