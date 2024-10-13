//
//  StatTiles.swift
//  PushPower
//
//  Created by Lukas Hjernquist on 2024-10-07.
//

import Foundation
import SwiftUI

struct StatTileCalBurnt: View {
    
    let image: String
    let value: String
    let measurment: String
    
    var body: some View {
        VStack {
            Image(systemName: image)
            Text(value)
                .font(.title)
                .lineLimit(1) // Ensure the text doesn't overflow
                .minimumScaleFactor(0.5) // Allow text to scale down if needed
                .truncationMode(.tail) // Truncate text with "..." if it overflows
                .frame(maxWidth: .infinity) // Ensure text fills available space but doesn’t exceed it
            Text(measurment)
        }
        .foregroundColor(Color.foregroundDeepBlue)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15).fill(Color.backgroundGray)
                .shadow(color: .foregroundGray, radius: 3, x: 4, y: 4)
                .shadow(color: .white, radius: 3, x: -2, y: -2)
                .frame(width: 100, height: 80)
        )
    }
}

struct StatTileTimeElapsed: View {
    
    let image: String
    let value: String
    let measurment: String
    
    var body: some View {
        VStack {
            Image(systemName: image)
            Text(value)
                .font(.title)
                .lineLimit(1) // Ensure the text doesn't overflow
                .minimumScaleFactor(0.5) // Allow text to scale down if needed
                .truncationMode(.tail) // Truncate text with "..." if it overflows
                .frame(maxWidth: .infinity) // Ensure text fills available space but doesn’t exceed it
            Text(measurment)
        }
        .foregroundColor(Color.foregroundDeepBlue)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15).fill(Color.backgroundGray)
                .shadow(color: .foregroundGray, radius: 3, x: 4, y: 4)
                .shadow(color: .white, radius: 3, x: -2, y: -2)
                .frame(width: 100, height: 80)
        )
    }
}
