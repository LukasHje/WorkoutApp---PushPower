//
//  SettingsView.swift
//  PushPower
//
//  Created by Lukas Hjernquist on 2024-10-18.
//

import Foundation
import SwiftUI

// Example SettingsView
struct SettingsView: View {
    var body: some View {
        ZStack {
            // Background color for the whole screen
            Color.backgroundGray
                .edgesIgnoringSafeArea(.all) // Extend the background to cover the entire screen
            
            VStack {
                Text("Settings View")
                    .font(.largeTitle)
                    .padding()
                Text("Swipe right to go back to Main View")
                    .padding()
            }
        }
    }
}
