//
//  AchievementsGridView.swift
//  PushPower
//
//  Created by Lukas Hjernquist on 2024-10-13.
//

import Foundation
import SwiftUI

struct AchievementsGridView: View {
    
    //Achievments data
    //New player achievment
    @AppStorage("aJourneyBegins") private var aJourneyBegins = false
    // Pushup milestones
    @AppStorage("firstGoalAchieved") private var firstGoalAchieved = false
    @AppStorage("100GoalAchieved") private var oneHundredGoalAchieved = false
    @AppStorage("200GoalAchieved") private var twoHundredGoalAchieved = false
    @AppStorage("300GoalAchieved") private var threeHundredGoalAchieved = false
    @AppStorage("400GoalAchieved") private var fourHundredGoalAchieved = false
    @AppStorage("500GoalAchieved") private var fiveHundredGoalAchieved = false
    @AppStorage("600GoalAchieved") private var sixHundredGoalAchieved = false
    @AppStorage("700GoalAchieved") private var sevenHundredGoalAchieved = false
    @AppStorage("800GoalAchieved") private var eightHundredGoalAchieved = false
    @AppStorage("900GoalAchieved") private var nineHundredGoalAchieved = false
    @AppStorage("1000GoalAchieved") private var oneThousandGoalAchieved = false
    // Streak milestones
    @AppStorage("threeDayStreakAchieved") private var threeDayStreakAchieved = false
    
    // Track the selected achievement
    @State private var selectedAchievement: Achievement?
    @State private var showDetail = false
    
    // Define a grid layout with three columns
    let columns = [
        GridItem(.flexible()), // Each column will take up equal space
        GridItem(.flexible())
    ]
    
    // Array of achievements
    var achievements: [AchievementData] {
        [
//          achievementCard(unlocked: aJourneyBegins, title: "A Journey Begins", image: "50_pushups", detail: "You have started your journey to greatness."), //no image for this one yet
            AchievementData(unlocked: firstGoalAchieved, title: "Completed my First Goal", image: "50_pushups", detail: "You have reached your first milestone."),
            AchievementData(unlocked: oneHundredGoalAchieved, title: "Completed 100 Pushups", image: "100_pushups", detail: "You have successfully completed 100 pushups."),
            AchievementData(unlocked: twoHundredGoalAchieved, title: "Completed 200 Pushups", image: "200_pushups", detail: "You have reached 200 pushups. Keep going!"),
            AchievementData(unlocked: threeHundredGoalAchieved, title: "Completed 300 Pushups", image: "300_pushups", detail: "You have reached 300 pushups. Keep going!"),
//          AchievementData(unlocked: fourHundredGoalAchieved, title: "Completed 400 Pushups", image: "400_pushups", detail: "You have reached 400 pushups. Keep going!"),
            AchievementData(unlocked: fiveHundredGoalAchieved, title: "Completed 500 Pushups", image: "500_pushups", detail: "You have reached 500 pushups. Keep going!"),
//          achievementCard(unlocked: sixHundredGoalAchieved, title: "Completed 600 Pushups", image: "600_pushups", detail: "You have reached 600 pushups. Keep going!"), //no image for this one yet
            AchievementData(unlocked: sevenHundredGoalAchieved, title: "Completed 700 Pushups", image: "700_pushups", detail: "You have reached 700 pushups. Keep going!"),
//          achievementCard(unlocked: eightHundredGoalAchieved, title: "Completed 800 Pushups", image: "800_pushups", detail: "You have reached 800 pushups. Keep going!"), //no image for this one yet
            AchievementData(unlocked: nineHundredGoalAchieved, title: "Completed 900 Pushups", image: "900_pushups", detail: "You have reached 900 pushups. Keep going!"),
            AchievementData(unlocked: oneThousandGoalAchieved, title: "Completed 1000 Pushups", image: "1000_pushups", detail: "You have reached 1000 pushups. Keep going!"),
//          achievementCard(unlocked: threeDayStreakAchieved, title: "Three-Day Streak", image: "50_pushups", detail: "You have completed a 3-day streak of pushups!"), //no image for this one yet
        ]
    }
    
    // Sorted achievements: unlocked ones at the top
    var sortedAchievements: [AchievementData] {
        achievements.sorted { $0.unlocked && !$1.unlocked }
    }
    
    var unlockedAchievements: [AchievementData] {
        achievements.filter { $0.unlocked }
    }
    
    var lockedAchievements: [AchievementData] {
        achievements.filter { !$0.unlocked }
    }
    
    var body: some View {
        ZStack {
            // Background color for the whole screen
            Color.backgroundGray
                .edgesIgnoringSafeArea(.all) // Extend the background to cover the entire screen
            
            VStack {
                Text("Achievements")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.foregroundDeepBlue)
                    .padding()
                
                ScrollView {
                LazyVGrid(columns: columns, spacing: 20) { // Use LazyVGrid for grid layout
                    ForEach(sortedAchievements, id: \.title) { achievement in
                            achievementCard(unlocked: achievement.unlocked, title: achievement.title, image: achievement.image, detail: achievement.detail)
                        }
                    }
                    .padding() // Padding for the grid
                } // ScrollView Ends
//                Text("Locked Achievements")
//                    .font(.title)
//                    .fontWeight(.semibold)
//                    .foregroundColor(Color.foregroundDeepBlue)
//                    .padding()
//
//                ScrollView {
//                LazyVGrid(columns: columns, spacing: 20) { // Use LazyVGrid for grid layout
//                    ForEach(lockedAchievements, id: \.title) { achievement in
//                            achievementCard(unlocked: achievement.unlocked, title: achievement.title, image: achievement.image, detail: achievement.detail)
//                        }
//                    }
//                    .padding() // Padding for the grid
//                } // ScrollView Ends
            } // VStack Ends
            .padding()
            
            // Show the detail view when an achievement is clicked
            if let achievement = selectedAchievement, showDetail {
                ZStack {
                    Color.black.opacity(0.4).edgesIgnoringSafeArea(.all) // Background overlay
                    
                    VStack {
                        Circle()
                            .fill(
                                // Check if the achievement is unlocked or locked, and change the background accordingly
                                achievement.isUnlocked ?
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.gradientTileDawnLight, Color.gradientTileDawnDark]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                                :
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.gradientTileLightGrey, Color.gradientTileDarkGrey]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(width: 180, height: 180)
                            .overlay( // Add the image inside the circle
                                Image(achievement.isUnlocked ? achievement.imageName : "locked")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 150, height: 150)
                                    .clipShape(Circle())
                                    .shadow(color: .gradientTileCity, radius: 2, x: 3, y: 3)
                                    .shadow(color: .gradientTileVice, radius: 2, x: -3, y: -3)
                            )
                            .offset(y: -10)
                        VStack {
                            Text(achievement.title)
                                .font(.headline)
                                .foregroundColor(.backgroundGray)
                                .padding()
                            
                            Text(achievement.detail)
                                .font(.body)
                                .foregroundColor(.backgroundGray)
                                .padding()
                            
                            Button("Close") {
                                showDetail = false
                            }
                            .padding(10)
                            .background(.blue)
                            .foregroundColor(.backgroundGray)
                            .cornerRadius(10)
                        }
                        .frame(width: .infinity, height: 200)
                        .background(
                            // Check if the achievement is unlocked or locked, and change the background accordingly
                            achievement.isUnlocked ?
                            LinearGradient(
                                gradient: Gradient(colors: [Color.gradientTileDawnLight, Color.gradientTileDawnDark]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                            :
                            LinearGradient(
                                gradient: Gradient(colors: [Color.gradientTileLightGrey, Color.gradientTileDarkGrey]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .cornerRadius(20)
                        .shadow(radius: 10)
                        .transition(.scale)
                        .zIndex(1) // Ensure this view appears above everything else
                    }
                }
            } // if selectedAchievment Ends
        } // ZStack Ends
    } // body View Ends
    
    // Helper function to generate achievement cards
    @ViewBuilder
    func achievementCard(unlocked: Bool, title: String, image: String, detail: String) -> some View {
        ZStack {
            if unlocked {
                RoundedRectangle(cornerRadius: 25)
                    .fill(LinearGradient(
                        gradient: Gradient(colors: [Color.gradientTileVice, Color.gradientTileCity]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ))
                    .padding(5)
                    .frame(width: .infinity, height: 150)
                    .shadow(radius: 5)
                    .onTapGesture {
                        selectedAchievement = Achievement(title: title, detail: detail, imageName: image, isUnlocked: true)
                        showDetail = true
                    }
                
                VStack(spacing: 10) {
                    Circle()
                        .fill(LinearGradient(
                            gradient: Gradient(colors: [Color.gradientTileCity, Color.gradientTileVice]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ))
                        .frame(width: 80, height: 80)
                        .overlay( // Add the image inside the circle
                            Image(image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 70, height: 70)
                                .clipShape(Circle())
                                .shadow(color: .gradientTileCity, radius: 2, x: 3, y: 3)
                                .shadow(color: .gradientTileVice, radius: 2, x: -3, y: -3)
                        )
                        .offset(y: 0)
                    
                    Text("🏆 \(title)")
                        .foregroundColor(.backgroundGray)
                        .font(.caption)
                        .bold()
                        .lineLimit(1) // Limit to 1 line
                        .truncationMode(.tail) // Add ellipsis (...) if text is too long
                        .frame(maxWidth: 110) // Ensure the text doesn't exceed the width of the tile
                }
                .padding(.top, -20)
            } else {
                RoundedRectangle(cornerRadius: 25)
                    .fill(LinearGradient(
                        gradient: Gradient(colors: [Color.gradientTileLightGrey, Color.gradientTileDarkGrey]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ))
                    .padding(5)
                    .frame(width: .infinity, height: 150)
                    .shadow(radius: 5)
                    .onTapGesture {
                        selectedAchievement = Achievement(title: title, detail: "Achievement is locked.", imageName: image, isUnlocked: false)
                        showDetail = true
                    }
                
                VStack(spacing: 10) {
                    Circle()
                        .fill(LinearGradient(
                            gradient: Gradient(colors: [Color.gradientTileDarkGrey, Color.gradientTileLightGrey]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ))
                        .frame(width: 80, height: 80)
                        .overlay( // Add the image inside the circle
                            Image("locked")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 70, height: 70)
                                .clipShape(Circle())
                                .shadow(color: .gradientTileDarkGrey, radius: 3, x: 3, y: 3)
                                .shadow(color: .gradientTileLightGrey, radius: 3, x: -3, y: -3)
                        )
                        .offset(y: 0)
                    
                    Text("\(title)")
                        .foregroundColor(.backgroundGray)
                        .font(.caption)
                        .bold()
                        .lineLimit(1) // Limit to 1 line
                        .truncationMode(.tail) // Add ellipsis (...) if text is too long
                        .frame(maxWidth: 110) // Ensure the text doesn't exceed the width of the tile
                }
                .padding(.top, -20)
            }
        }
    }
}
