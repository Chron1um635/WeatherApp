//
//  NetworkManager.swift
//  WeatherApp
//
//  Created by Максим Назаров on 29.05.2025.
//

import Foundation
import Alamofire

final class NetworkManager: Network {
    
    private let apiKey = "44c9a3f721ba4dcbab591231253005"
    
    func fetchWeatherForecast(for city: String, within daysCount: Int, completion: @escaping(Result<WeatherAPI, Alamofire.AFError>) -> Void) {
        let url = "https://api.weatherapi.com/v1/forecast.json?q=\(city)&days=\(daysCount)&key=\(apiKey)"
        AF.request(url)
            .validate()
            .responseDecodable(of: WeatherAPI.self) { dataResponse in
                switch dataResponse.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    func fetchImageData(from url: String, completion: @escaping(Data) -> Void) {
        AF.request(url)
            .validate()
            .responseData { dataResponse in
                switch dataResponse.result {
                case .success(let data):
                    completion(data)
                case .failure(let error):
                    print(error)
                }
            }
    }
}
