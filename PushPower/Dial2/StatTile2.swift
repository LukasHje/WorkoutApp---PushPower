//
//  StatTile2.swift
//  PushPower
//
//  Created by Lukas Hjernquist on 2024-10-09.
//

import Foundation
import SwiftUI

struct StatTile2: View {
    
    let image: String
    let value: String
    let measurment: String
    
    var body: some View {
        VStack {
            Image(systemName: image)
            Text(value)
                .font(.title)
            Text(measurment)
        }
        .foregroundColor(Color.foregroundDeepBlue)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15).fill(Color.backgroundGray)
                .shadow(color: .foregroundGray, radius: 3, x: 4, y: 4)
                .shadow(color: .white, radius: 3, x: -2, y: -2)
        )
    }
}
