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
    let statusCode: Int // New parameter to handle different text
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 20) {
                Text("Hello\n\(name) 👋")
                    .foregroundColor(Color.foregroundDeepBlue)
                    .font(.title)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                
                // Conditional text based on statusCode
                Text(getStatusText(statusCode))
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
    
    // Function to return different text based on the statusCode
    func getStatusText(_ statusCode: Int) -> String {
        print("Current statusCode: \(statusCode)") // Debugging
        switch statusCode {
                case 2..<50:
                    return "Keep going! You're \(statusCode)% there! 💪"
                case 50..<75:
                    return "Great work! You're halfway there! \(statusCode)% done! 🎯"
                case 75..<100:
                    return "Keep working! You're almost there! \(statusCode)% done! 😤"
                case 100:
                    return "Awesome! You reached your goal! 🎉 💪"
                default:
                    print("DialHeaderView - completionPercentage tracker: \(statusCode)")
                    return "Let's get strong! 💪"
        }
    }
}


