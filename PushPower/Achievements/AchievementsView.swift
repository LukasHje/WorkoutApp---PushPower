//
//  AchievementsView.swift
//  PushPower
//
//  Created by Lukas Hjernquist on 2024-10-08.
//

import Foundation
import SwiftUI

struct AchievementsView: View {
    
    @AppStorage("achievement_unlocked") private var achievementUnlocked = false

    
    var body: some View {
        VStack {
            Text("Achievements")
               .font(.title)
           
            if achievementUnlocked {
                Text("🏆 My First Day - Unlocked!")
            } else {
                Text("🔒 My First Day")
            }
            
            if achievementUnlocked {
                Text("🏆 Completed my First Goal - Unlocked!")
            } else {
                Text("🔒 Completed my First Goal")
            }
            
           if achievementUnlocked {
               Text("🏆 Three-Day Streak Unlocked!")
           } else {
               Text("🔒 Three-Day Streak")
           }
            
           
           // Add more achievements here...
        }
        .padding()
        .background(Color.backgroundGray)
    }
}
