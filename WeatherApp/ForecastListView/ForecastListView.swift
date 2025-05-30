//
//  ForecastListView.swift
//  WeatherApp
//
//  Created by Максим Назаров on 29.05.2025.
//

import SwiftUI

struct ForecastListView: View {
    
    @StateObject private var viewModel = ForecastListViewViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    ScrollView {
                        ForEach(viewModel.forecastDay, id: \.date) { weatherCellViewViewModel in
                            WeatherCellView(viewModel: weatherCellViewViewModel)
                        }
                    }
                    .frame(height: UIScreen.main.bounds.height / 1.3)
                    Spacer()
                }
            }
            .onAppear {
                viewModel.fetchData()
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    
                    HStack {
                        Image(systemName: "cloud")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 40)
                            .foregroundStyle(.white)
                        Text(viewModel.city)
                            .foregroundStyle(.white)
                            .font(.custom("SF Pro Display", size: 40))
                    }
                }
            }
            
        }
        
    }
}

#Preview {
    ForecastListView()
}
