//
//  AchievementsView.swift
//  PushPower
//
//  Created by Lukas Hjernquist on 2024-10-08.
//

import Foundation
import SwiftUI

struct AchievementsView: View {
    
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
    @AppStorage("1000GoalAchieved") private var thousandGoalAchieved = false
    // Streak milestones
    @AppStorage("threeDayStreakAchieved") private var threeDayStreakAchieved = false
    
    // Define a grid layout with two columns
        let columns = [
            GridItem(.flexible()), // Each column will take up equal space
            GridItem(.flexible())
        ]
    
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
                    VStack(spacing: 40) { // Add spacing between the achievement blocks
                        // A Journey Begins - Achievement
                        ZStack {
                            if aJourneyBegins {
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(LinearGradient(
                                        gradient: Gradient(colors: [Color.gradientTileVice, Color.gradientTileCity]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    ))
                                    .frame(width: 200, height: 150)
                                    .shadow(radius: 5)
                                
                                VStack(spacing: 10) {
                                    Circle()
                                        .fill(LinearGradient(
                                            gradient: Gradient(colors: [Color.gradientTileCity, Color.gradientTileVice]),
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        ))
                                        .frame(width: 125, height: 125)
                                        .overlay( // Add the image inside the circle
                                            Image("50_pushups")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 110, height: 110)
                                                .clipShape(Circle()) // This will clip the image to a circular shape
                                                .shadow(color: .gradientTileCity, radius: 2, x: 3, y: 3)
                                                .shadow(color: .gradientTileVice, radius: 2, x: -3, y: -3)
                                        )
                                        .offset(y: -20)
                                    
                                    VStack {
                                        Text("🏆 A Journey Begins")
                                            .foregroundColor(.black)
                                            .font(.caption)
                                            .bold()
                                    }
                                    .padding(.top, -20)
                                }
                            } else {
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(LinearGradient(
                                        gradient: Gradient(colors: [Color.gradientTileLightGrey, Color.gradientTileDarkGrey]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    ))
                                    .frame(width: 200, height: 150)
                                    .shadow(radius: 5)
                                
                                VStack(spacing: 10) {
                                    Circle()
                                        .fill(LinearGradient(
                                            gradient: Gradient(colors: [Color.gradientTileDarkGrey, Color.gradientTileLightGrey]),
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        ))
                                        .frame(width: 125, height: 125)
                                        .overlay( // Add the image inside the circle
                                            Image("locked")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 110, height: 110)
                                                .clipShape(Circle()) // This will clip the image to a circular shape
                                                .shadow(color: .gradientTileDarkGrey, radius: 3, x: 3, y: 3)
                                                .shadow(color: .gradientTileLightGrey, radius: 3, x: -3, y: -3)
                                        )
                                        .offset(y: -20)
                                    
                                    VStack {
                                        Text("A Journey Begins")
                                            .foregroundColor(.black)
                                            .font(.caption)
                                            .bold()
                                    }
                                    .padding(.top, -20)
                                }
                            }
                        } // ZStack ends
                        
                        // First Goal Achieved - Achievement
                        ZStack {
                            if firstGoalAchieved {
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(LinearGradient(
                                        gradient: Gradient(colors: [Color.gradientTileVice, Color.gradientTileCity]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    ))
                                    .frame(width: 200, height: 150)
                                    .shadow(radius: 5)
                                
                                VStack(spacing: 10) {
                                    Circle()
                                        .fill(LinearGradient(
                                            gradient: Gradient(colors: [Color.gradientTileCity, Color.gradientTileVice]),
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        ))
                                        .frame(width: 125, height: 125)
                                        .overlay( // Add the image inside the circle
                                            Image("50_pushups")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 110, height: 110)
                                                .clipShape(Circle()) // This will clip the image to a circular shape
                                                .shadow(color: .gradientTileCity, radius: 2, x: 3, y: 3)
                                                .shadow(color: .gradientTileVice, radius: 2, x: -3, y: -3)
                                        )
                                        .offset(y: -20)
                                    
                                    VStack {
                                        Text("🏆 Completed my First Goal")
                                            .foregroundColor(.black)
                                            .font(.caption)
                                            .bold()
                                    }
                                    .padding(.top, -20)
                                }
                            } else {
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(LinearGradient(
                                        gradient: Gradient(colors: [Color.gradientTileLightGrey, Color.gradientTileDarkGrey]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    ))
                                    .frame(width: 200, height: 150)
                                    .shadow(radius: 5)
                                
                                VStack(spacing: 10) {
                                    Circle()
                                        .fill(LinearGradient(
                                            gradient: Gradient(colors: [Color.gradientTileDarkGrey, Color.gradientTileLightGrey]),
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        ))
                                        .frame(width: 125, height: 125)
                                        .overlay( // Add the image inside the circle
                                            Image("locked")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 110, height: 110)
                                                .clipShape(Circle()) // This will clip the image to a circular shape
                                                .shadow(color: .gradientTileDarkGrey, radius: 3, x: 3, y: 3)
                                                .shadow(color: .gradientTileLightGrey, radius: 3, x: -3, y: -3)
                                        )
                                        .offset(y: -20)
                                    
                                    VStack {
                                        Text("Completed my First Goal")
                                            .foregroundColor(.black)
                                            .font(.caption)
                                            .bold()
                                    }
                                    .padding(.top, -20)
                                }
                            }
                        } // ZStack ends
                        
                        // 100 pushups Achieved - Achievement
                        ZStack {
                            if firstGoalAchieved {
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(LinearGradient(
                                        gradient: Gradient(colors: [Color.gradientTileLightRose, Color.gradientTileRose]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    ))
                                    .frame(width: 200, height: 150)
                                    .shadow(radius: 5)
                                
                                VStack(spacing: 10) {
                                    Circle()
                                        .fill(LinearGradient(
                                            gradient: Gradient(colors: [Color.gradientTileRose, Color.gradientTileLightRose]),
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        ))
                                        .frame(width: 125, height: 125)
                                        .overlay( // Add the image inside the circle
                                            Image("100_pushups")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 110, height: 110)
                                                .clipShape(Circle()) // This will clip the image to a circular shape
                                                .shadow(color: .gradientTileRose, radius: 2, x: 3, y: 3)
                                                .shadow(color: .gradientTileLightRose, radius: 2, x: -3, y: -3)
                                        )
                                        .offset(y: -20)
                                    
                                    VStack {
                                        Text("🏆 Completed 100 Pushups")
                                            .foregroundColor(.black)
                                            .font(.caption)
                                            .bold()
                                    }
                                    .padding(.top, -20)
                                }
                            } else {
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(LinearGradient(
                                        gradient: Gradient(colors: [Color.gradientTileLightGrey, Color.gradientTileDarkGrey]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    ))
                                    .frame(width: 200, height: 150)
                                    .shadow(radius: 5)
                                
                                VStack(spacing: 10) {
                                    Circle()
                                        .fill(LinearGradient(
                                            gradient: Gradient(colors: [Color.gradientTileDarkGrey, Color.gradientTileLightGrey]),
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        ))
                                        .frame(width: 125, height: 125)
                                        .overlay( // Add the image inside the circle
                                            Image("locked")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 110, height: 110)
                                                .clipShape(Circle()) // This will clip the image to a circular shape
                                                .shadow(color: .gradientTileDarkGrey, radius: 3, x: 3, y: 3)
                                                .shadow(color: .gradientTileLightGrey, radius: 3, x: -3, y: -3)
                                        )
                                        .offset(y: -20)
                                    
                                    VStack {
                                        Text("Completed 100 Pushups")
                                            .foregroundColor(.black)
                                            .font(.caption)
                                            .bold()
                                    }
                                    .padding(.top, -20)
                                }
                            }
                        } // ZStack ends
                        
                        // 200 pushups Achieved - Achievement
                        ZStack {
                            if firstGoalAchieved {
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(LinearGradient(
                                        gradient: Gradient(colors: [Color.gradientTileDawnLight, Color.gradientTileDawnDark]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    ))
                                    .frame(width: 200, height: 150)
                                    .shadow(radius: 5)
                                
                                VStack(spacing: 10) {
                                    Circle()
                                        .fill(LinearGradient(
                                            gradient: Gradient(colors: [Color.gradientTileDawnDark, Color.gradientTileDawnLight]),
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        ))
                                        .frame(width: 125, height: 125)
                                        .overlay( // Add the image inside the circle
                                            Image("200_pushups")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 110, height: 110)
                                                .clipShape(Circle()) // This will clip the image to a circular shape
                                                .shadow(color: .gradientTileDawnDark, radius: 2, x: 3, y: 3)
                                                .shadow(color: .gradientTileDawnLight, radius: 2, x: -3, y: -3)
                                        )
                                        .offset(y: -20)
                                    
                                    VStack {
                                        Text("🏆 Completed 200 Pushups")
                                            .foregroundColor(.black)
                                            .font(.caption)
                                            .bold()
                                    }
                                    .padding(.top, -20)
                                }
                            } else {
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(LinearGradient(
                                        gradient: Gradient(colors: [Color.gradientTileLightGrey, Color.gradientTileDarkGrey]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    ))
                                    .frame(width: 200, height: 150)
                                    .shadow(radius: 5)
                                
                                VStack(spacing: 10) {
                                    Circle()
                                        .fill(LinearGradient(
                                            gradient: Gradient(colors: [Color.gradientTileDarkGrey, Color.gradientTileLightGrey]),
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        ))
                                        .frame(width: 125, height: 125)
                                        .overlay( // Add the image inside the circle
                                            Image("locked")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 110, height: 110)
                                                .clipShape(Circle()) // This will clip the image to a circular shape
                                                .shadow(color: .gradientTileDarkGrey, radius: 3, x: 3, y: 3)
                                                .shadow(color: .gradientTileLightGrey, radius: 3, x: -3, y: -3)
                                        )
                                        .offset(y: -20)
                                    
                                    VStack {
                                        Text("Completed 100 Pushups")
                                            .foregroundColor(.black)
                                            .font(.caption)
                                            .bold()
                                    }
                                    .padding(.top, -20)
                                }
                            }
                        } // ZStack ends
                        
                        // Three-Day Streak - Achievement
                        ZStack {
                            if threeDayStreakAchieved {
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(LinearGradient(
                                        gradient: Gradient(colors: [Color.gradientTileVice, Color.gradientTileCity]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    ))
                                    .frame(width: 200, height: 150)
                                    .shadow(radius: 5)
                                
                                VStack(spacing: 10) {
                                    Circle()
                                        .fill(LinearGradient(
                                            gradient: Gradient(colors: [Color.gradientTileCity, Color.gradientTileVice]),
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        ))
                                        .frame(width: 125, height: 125)
                                        .overlay( // Add the image inside the circle
                                            Image("50_pushups")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 110, height: 110)
                                                .clipShape(Circle()) // This will clip the image to a circular shape
                                                .shadow(color: .gradientTileCity, radius: 2, x: 3, y: 3)
                                                .shadow(color: .gradientTileVice, radius: 2, x: -3, y: -3)
                                        )
                                        .offset(y: -20)
                                    
                                    VStack {
                                        Text("🏆 Three-Day Streak")
                                            .foregroundColor(.black)
                                            .font(.caption)
                                            .bold()
                                    }
                                    .padding(.top, -20)
                                }
                            } else {
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(LinearGradient(
                                        gradient: Gradient(colors: [Color.gradientTileLightGrey, Color.gradientTileDarkGrey]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    ))
                                    .frame(width: 200, height: 150)
                                    .shadow(radius: 5)
                                
                                VStack(spacing: 10) {
                                    Circle()
                                        .fill(LinearGradient(
                                            gradient: Gradient(colors: [Color.gradientTileDarkGrey, Color.gradientTileLightGrey]),
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        ))
                                        .frame(width: 125, height: 125)
                                        .overlay( // Add the image inside the circle
                                            Image("locked")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 110, height: 110)
                                                .clipShape(Circle()) // This will clip the image to a circular shape
                                                .shadow(color: .gradientTileDarkGrey, radius: 3, x: 3, y: 3)
                                                .shadow(color: .gradientTileLightGrey, radius: 3, x: -3, y: -3)
                                        )
                                        .offset(y: -20)
                                    
                                    VStack {
                                        Text("Three-Day Streak")
                                            .foregroundColor(.black)
                                            .font(.caption)
                                            .bold()
                                    }
                                    .padding(.top, -20)
                                }
                            }
                        } // ZStack ends
                    }
                    .padding() // Padding for the VStack: Holds ZStacks of achievments
                } // ScrollView Ends
                .padding()
            } // VStack Ends
            .padding()
        } // ZStack Ends
    } // body View Ends
} // StructView Ends
