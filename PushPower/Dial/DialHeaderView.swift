//
//  DialHeaderView.swift
//  PushPower
//
//  Created by Lukas Hjernquist on 2024-10-07.
//

import Foundation
import SwiftUI

struct DialHeaderView: View {
    
    let name: String
    let image: String
    let flex: String = "💪"
    let waving: String = "👋"
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 20) {
                Text("Hello\n\(name) \(waving)")
                    .foregroundColor(Color.foregroundDeepBlue)
                    .font(.title)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                Text("Let's get strong! \(flex)")
                    .foregroundColor(Color.foregroundDeepBlue)
            }
            
            Spacer()
            
            Image(image)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .frame(width: 50)
        }
        .foregroundColor(.accentColor)
    }
}

