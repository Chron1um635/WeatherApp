//
//  WeatherCellViewViewModel.swift
//  WeatherApp
//
//  Created by Максим Назаров on 29.05.2025.
//

import Foundation

final class WeatherCellViewViewModel: ObservableObject {
    
    @Published var imageData = Data()
    
    var conditionText: String {
        forecastDay.day.condition.text
    }
    
    var averageTemperatureC: String {
        forecastDay.day.avgtemp_c.formatted()
    }
    
    var maxWind: String {
        forecastDay.day.maxwind_kph.formatted()
    }
    
    var averageHumidity: String {
        forecastDay.day.avghumidity.formatted()
    }
    
    var date: String {
        forecastDay.date
    }
    
    private let forecastDay: ForecastDay
    private let networkManager: Network = NetworkManager()
    
    init(forecastDay: ForecastDay) {
        self.forecastDay = forecastDay
    }
    
    func fetchImageData() {
        let url = "https:" + forecastDay.day.condition.icon
        networkManager.fetchImageData(from: url) { [weak self] data in
            guard let self = self else { return }
            imageData = data
        }
    }
    
}
