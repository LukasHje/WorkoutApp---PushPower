//
//  Circle2V.swift
//  PushPower
//
//  Created by Lukas Hjernquist on 2024-10-09.
//

import Foundation
import SwiftUI

struct Circle2V: View {
    
    private let shadowOffset: CGFloat = 4
    private let shadowRadius: CGFloat = 3
    private let shadowColor: Color = Color.foregroundGray
    private let highlightColor: Color = .white
    
    var body: some View {
        Circle().fill(Color.backgroundGray)
            .shadow(color:shadowColor, radius: shadowRadius, x: shadowOffset, y: shadowOffset)
            .shadow(color:highlightColor, radius: shadowRadius, x: -shadowOffset/2, y: -shadowOffset/2)
    }
}
