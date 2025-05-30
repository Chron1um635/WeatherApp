//
//  WeatherCellView.swift
//  WeatherApp
//
//  Created by Максим Назаров on 29.05.2025.
//

import SwiftUI

struct WeatherCellView: View {
    
    @StateObject var viewModel: WeatherCellViewViewModel
    
    var body: some View {
        ZStack {
            Image("cellBG")
                .resizable()
                .scaledToFit()
                .opacity(1)
            VStack {
                HStack {
                    Text("\(viewModel.averageTemperatureC)°C")
                        .font(.custom("SF Pro Display", size: 60))
                        .foregroundStyle(.white)
                    Spacer()
                    ConditionIconView(imageData: viewModel.imageData, imageHeight: 150)
                }
                .padding()
                Spacer()
                HStack {
                    Label("\(viewModel.maxWind) km/h", systemImage: "wind")
                        .font(.custom("SF Pro Display", size: 23))
                        .foregroundStyle(.white)
                    Spacer()
                    Label("\(viewModel.averageHumidity)%", systemImage: "drop")
                        .font(.custom("SF Pro Display", size: 23))
                        .foregroundStyle(.white)
                    Spacer()
                    Text(viewModel.conditionText)
                        .font(.custom("SF Pro Display", size: 25))
                        .foregroundStyle(.white)
                        .frame(height: 60)
                }
                .padding(
                    EdgeInsets(
                        top: 0,
                        leading: 16,
                        bottom: 56,
                        trailing: 16
                    )
                )
            }
        }
        .frame(height: 223)
        .onAppear {
            viewModel.fetchImageData()
        }
    }
}

#Preview {
    WeatherCellView(viewModel: WeatherCellViewViewModel(forecastDay: ForecastDay(date: "", day: Day(avgtemp_c: 3, maxwind_kph: 3, avghumidity: 3, condition: Condition(text: "", icon: "")))))
}
