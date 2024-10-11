//
//  Dial.swift
//  PushPower
//
//  Created by Lukas Hjernquist on 2024-10-07.
//

import Foundation
import SwiftUI

struct Dial: View {
    
    let goal: Int
    let pushups: Int
    
    var body: some View {
        ZStack {
            // Make SpokesView larger than CircleView
            SpokesView()
                .padding(1)
                .frame(width: 300, height: 300) // SpokesView is larger than CircleView
                .zIndex(0) // Ensure it stays behind CircleView
            CircleView()
                .frame(width: 280, height: 280) // SpokesView is larger than CircleView
                .zIndex(0) // Ensure it stays behind CircleView
            
            // CircleView (background circle)
            CircleView()
                .frame(width: 240, height: 240) // Adjust the size so it's visible and surrounds the inner circles
                .zIndex(1) // Ensure CircleView is on top of SpokesView
            
            // Gray circular stroke (background circle stroke)
            Circle()
                .stroke(style: StrokeStyle(lineWidth: 12))
                .padding(20)
                .foregroundColor(Color.foregroundGray)
                .frame(width: 230, height: 230) // Adjust the size so CircleView is visible around this circle
                .zIndex(2) // Background circle on top of CircleView
            
            // Progress circle
            Circle()
                .trim(from: 0, to: CGFloat(pushups) / CGFloat(goal))
                .scale(x: -1) // Makes the progress bar start right-side instead of left
                .rotation(.degrees(90))
                .stroke(style: StrokeStyle(lineWidth: 12, lineCap: .butt))
                .padding(20)
                .foregroundColor(Color.foregroundYellow)
                .frame(width: 230, height: 230) // Match size with the background circle stroke
                .zIndex(3) // Progress circle on top of everything else
            
            // Text elements in the center
            VStack {
                Text("Goal: \(goal)")
                    .foregroundColor(Color.foregroundDeepBlue)
                Text("\(pushups)")
                    .foregroundColor(Color.foregroundYellow)
                    .font(.title)
                    .bold()
                    .padding()
                Text("Pushups")
                    .foregroundColor(Color.foregroundDeepBlue)
            }
            .zIndex(4) // Ensure text is on top of everything
        }
        .foregroundColor(Color.backgroundDeepGray)
    }
}


