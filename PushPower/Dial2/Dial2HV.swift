//
//  Dial2HV.swift
//  PushPower
//
//  Created by Lukas Hjernquist on 2024-10-09.
//

import Foundation
import SwiftUI

struct Dial2HV: View {
    
    let name: String
    let image: String
    let flex: String = "💪"
    let waving: String = "👋"
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 20) {
                Text("Hello\n\(name) \(waving)")
                    .foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                Text("Let's get strong! \(flex)")
                    .foregroundColor(.white)
            }
            
            Spacer()
            
            Image(image)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .frame(width: 50)
        }
        .foregroundColor(Color.OxfordBlue)
    }
}
