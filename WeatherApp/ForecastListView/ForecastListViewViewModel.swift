//
//  ForecastListViewViewModel.swift
//  WeatherApp
//
//  Created by Максим Назаров on 29.05.2025.
//

import Foundation

final class ForecastListViewViewModel: ObservableObject {
    
    @Published var forecastDay: [WeatherCellViewViewModel] = []
    @Published var city = "Syzran"
    @Published var daysCount = 5
    
    private let networkManager: Network = NetworkManager()
    
    func fetchData() {
        networkManager.fetchWeatherForecast(for: city, within: daysCount) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                forecastDay = data.forecast.forecastday.map { WeatherCellViewViewModel(forecastDay: $0) }
            case .failure(let error):
                print(error)
            }
        }
    }
}
