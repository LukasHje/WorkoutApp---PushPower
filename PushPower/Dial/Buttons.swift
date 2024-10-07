//
//  Buttons.swift
//  PushPower
//
//  Created by Lukas Hjernquist on 2024-10-07.
//

import Foundation
import SwiftUI

struct SubmitTile: View {
    
    var body: some View {
        VStack {
            Text("Submit")
                .font(.title)
                .foregroundColor(.white)
        }
        .foregroundColor(Color.foregroundDeepBlue)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15).fill(Color.foregroundRed)
                .shadow(color: .foregroundGray, radius: 3, x: 6, y: 6)
                .shadow(color: .white, radius: 3, x: -6, y: -6)
        )
    }
}


struct NavigationTiles: View {
    
    let image: String
    let text: String
    
    var body: some View {
        VStack {
            Image(systemName: image)
            Text(text)
        }
        .foregroundColor(.white)
        .padding()
    }
}
