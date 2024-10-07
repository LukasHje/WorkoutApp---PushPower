//
//  SpokesView.swift
//  PushPower
//
//  Created by Lukas Hjernquist on 2024-10-07.
//

import Foundation
import SwiftUI

struct SpokesView: View {
    
    var body: some View {
        ForEach(0..<360, id: \.self) { index in
            if (Double(index).truncatingRemainder(dividingBy: 2.25) == 0) {
                
                Rectangle()
                    .trim(from: 0, to: 0.1)
                    .frame(width: 1)
                    .rotationEffect(.degrees(Double(index)))
            }
        }
    }
}
