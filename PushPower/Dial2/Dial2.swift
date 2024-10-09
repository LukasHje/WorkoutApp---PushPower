//
//  Dial2.swift
//  PushPower
//
//  Created by Lukas Hjernquist on 2024-10-09.
//

import Foundation
import SwiftUI

struct Dial2: View {
    
    let goal: Int
    let pushups: Int
    
    var body: some View {
        ZStack {
            Circle2V()
            //    .padding() // spokes or no spokes...
            
            ZStack {
                Circle2V()
                
                Circle().stroke(style: StrokeStyle(lineWidth: 12))
                    .padding(20)
                    .foregroundColor(Color.foregroundGray)
                
                Circle()
                    .trim(from: 0, to: CGFloat(pushups) / CGFloat(goal))
                    .scale(x: -1) //, y:-1 //dev notes: makes the progress-bar start right-side instead of left-side
                    .rotation(.degrees(90))
                    .stroke(style: StrokeStyle(lineWidth: 12, lineCap: .butt))
                    .padding(20)
                    .foregroundColor(Color.foregroundYellow)
                
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
            }
            .padding()
            
        }
        .foregroundColor(Color.OxfordBlue)
    }
}
