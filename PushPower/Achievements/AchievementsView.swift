//
//  AchievementsView.swift
//  PushPower
//
//  Created by Lukas Hjernquist on 2024-10-08.
//

import Foundation
import SwiftUI

struct AchievementsView: View {

    //Achievments data
    // Pushup milestones
    @AppStorage("firstGoalAchieved") private var firstGoalAchieved = false
    @AppStorage("50GoalAchieved") private var fiftyGoalAchieved = false
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
    @AppStorage("aJourneyBegins") private var aJourneyBegins = false
    @AppStorage("twoDayStreakAchieved") private var twoDayStreakAchieved = false
    @AppStorage("threeDayStreakAchieved") private var threeDayStreakAchieved = false
    @AppStorage("fourDayStreakAchieved") private var fourDayStreakAchieved = false
    @AppStorage("fiveDayStreakAchieved") private var fiveDayStreakAchieved = false
    @AppStorage("sixDayStreakAchieved") private var sixDayStreakAchieved = false
    @AppStorage("sevenDayStreakAchieved") private var sevenDayStreakAchieved = false
    
    
    // Track the selected achievement
    @State private var selectedAchievement: Achievement?
    @State private var showDetail = false
    
    
    // Define a grid layout with two columns
    let columns = [GridItem(.flexible())]
    
    // Array of achievements
    var achievements: [AchievementData] {
        [
            AchievementData(unlocked: firstGoalAchieved, title: "My First Goal", image: "firstGoalAchieved", detail: "You have reached your first milestone."),
            AchievementData(unlocked: oneHundredGoalAchieved, title: "50 Pushups", image: "50_pushups", detail: "You have successfully completed 50 pushups."),
            AchievementData(unlocked: oneHundredGoalAchieved, title: "100 Pushups", image: "100_pushups", detail: "You have successfully completed 100 pushups."),
            AchievementData(unlocked: twoHundredGoalAchieved, title: "200 Pushups", image: "200_pushups", detail: "You have reached 200 pushups. Keep going!"),
            AchievementData(unlocked: threeHundredGoalAchieved, title: "300 Pushups", image: "300_pushups", detail: "You have reached 300 pushups. Keep going!"),
            AchievementData(unlocked: fourHundredGoalAchieved, title: "400 Pushups", image: "400_pushups", detail: "You have reached 400 pushups. Keep going!"),
            AchievementData(unlocked: fiveHundredGoalAchieved, title: "500 Pushups", image: "500_pushups", detail: "You have reached 500 pushups. Keep going!"),
            AchievementData(unlocked: sixHundredGoalAchieved, title: "600 Pushups", image: "600_pushups", detail: "You have reached 600 pushups. Keep going!"),
            AchievementData(unlocked: sevenHundredGoalAchieved, title: "700 Pushups", image: "700_pushups", detail: "You have reached 700 pushups. Keep going!"),
            AchievementData(unlocked: eightHundredGoalAchieved, title: "800 Pushups", image: "800_pushups", detail: "You have reached 800 pushups. Keep going!"),
            AchievementData(unlocked: nineHundredGoalAchieved, title: "900 Pushups", image: "900_pushups", detail: "You have reached 900 pushups. Keep going!"),
            AchievementData(unlocked: oneThousandGoalAchieved, title: "1000 Pushups", image: "1000_pushups", detail: "You have reached 1000 pushups. Keep going!"),
            AchievementData(unlocked: aJourneyBegins, title: "A Journey Begins", image: "aJourneyBegins", detail: "You have started your journey to greatness."),
            AchievementData(unlocked: twoDayStreakAchieved, title: "Two-Day Streak", image: "2_streak", detail: "You have completed a 2-day streak of pushups!"),
            AchievementData(unlocked: threeDayStreakAchieved, title: "Three-Day Streak", image: "3_streak", detail: "You have completed a 3-day streak of pushups!"),
            AchievementData(unlocked: fourDayStreakAchieved, title: "Four-Day Streak", image: "4_streak", detail: "You have completed a 4-day streak of pushups!"),
            AchievementData(unlocked: fiveDayStreakAchieved, title: "Five-Day Streak", image: "5_streak", detail: "You have completed a 5-day streak of pushups!"),
            AchievementData(unlocked: sixDayStreakAchieved, title: "Six-Day Streak", image: "6_streak", detail: "You have completed a 6-day streak of pushups!"),
            AchievementData(unlocked: sevenDayStreakAchieved, title: "Seven-Day Streak", image: "7_streak", detail: "You have completed a 7-day streak of pushups!!!")
        ]
    }
    
    // Sorted achievements: unlocked ones at the top
    var sortedAchievements: [AchievementData] {
        achievements.sorted { $0.unlocked && !$1.unlocked }
    }
    
    // Filterd achievements: only unlocked ones
    var unlockedAchievements: [AchievementData] {
        achievements.filter { $0.unlocked }
    }
    
    // Filterd achievements: only locked ones
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
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(sortedAchievements, id: \.title) { achievement in
                            achievementCard(unlocked: achievement.unlocked, title: achievement.title, image: achievement.image, detail: achievement.detail)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding() // Padding for the grid
                } // ScrollView Ends
                
//                Text("Locked Achievements")
//                    .font(.title)
//                    .fontWeight(.semibold)
//                    .foregroundColor(Color.foregroundDeepBlue)
//                    .padding()
//
//                ScrollView {
//                    LazyVGrid(columns: columns, spacing: 20) {
//                        ForEach(lockedAchievements, id: \.title) { achievement in
//                            achievementCard(unlocked: achievement.unlocked, title: achievement.title, image: achievement.image, detail: achievement.detail)
//                        }
//                    }
//                    .frame(maxWidth: .infinity)
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
                    .frame(width: .infinity, height: 80)
                    .shadow(radius: 5)
                    .onTapGesture {
                        selectedAchievement = Achievement(title: title, detail: detail, imageName: image, isUnlocked: true)
                        showDetail = true
                    }
                    .overlay(
                        
                        HStack(spacing: 16) { // Add spacing between circle and text
                            
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

                            Text("🏆 \(title)")
                                .foregroundColor(.backgroundGray)
                                .font(.headline) // Increase the font size
                                .bold()
                                .lineLimit(1) // Limit to 1 line
                                .truncationMode(.tail) // Add ellipsis (...) if text is too long
                            
                        }
                        .padding(.horizontal, 20) // Padding for spacing inside the RoundedRectangle
                        .frame(maxWidth: .infinity, alignment: .leading) // Align HStack to the leading edge
                        
                    )
                } else {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(LinearGradient(
                            gradient: Gradient(colors: [Color.gradientTileLightGrey, Color.gradientTileDarkGrey]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ))
                        .frame(height: 80) // Width will expand based on the parent view
                        .shadow(radius: 5)
                        .onTapGesture {
                            selectedAchievement = Achievement(title: title, detail: "Achievement is locked.", imageName: image, isUnlocked: false)
                            showDetail = true
                        }
                        .overlay(
                            HStack(spacing: 16) { // Add spacing between circle and text
                                Circle()
                                    .fill(LinearGradient(
                                        gradient: Gradient(colors: [Color.gradientTileDarkGrey, Color.gradientTileLightGrey]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    ))
                                    .frame(width: 80, height: 80) // Keep a fixed size for the circle
                                    .overlay( // Add the image inside the circle
                                        Image("locked")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 70, height: 70)
                                            .clipShape(Circle())
                                            .shadow(color: .gradientTileDarkGrey, radius: 3, x: 3, y: 3)
                                            .shadow(color: .gradientTileLightGrey, radius: 3, x: -3, y: -3)
                                    )

                                Text("\(title)")
                                    .foregroundColor(.backgroundGray)
                                    .font(.headline)
                                    .bold()
                                    .lineLimit(1) // Limit to 1 line
                                    .truncationMode(.tail) // Add ellipsis (...) if text is too long
                                    .frame(maxWidth: .infinity, alignment: .leading) // Ensure text takes available space but doesn't push the circle
                            }
                            .padding(.horizontal, 20) // Padding for spacing inside the RoundedRectangle
                            .frame(maxWidth: .infinity, alignment: .leading) // Align HStack to the leading edge
                        ) // overlay ends
            } // else ends
        }
    }
}
