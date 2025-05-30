//
//  ConditionIconView.swift
//  WeatherApp
//
//  Created by Максим Назаров on 29.05.2025.
//

import SwiftUI

struct ConditionIconView: View {
    
    var imageData: Data
    let imageHeight: Double
    
    var body: some View {
        getImage()
            .resizable()
            .scaledToFit()
            .frame(height: imageHeight)
    }
    
    private func getImage() -> Image {
        guard let uiImage = UIImage(data: imageData) else { return Image(systemName: "xmark.octagon")}
        return Image(uiImage: uiImage)
    }
}

#Preview {
    ConditionIconView(imageData: Data(), imageHeight: 10)
}
