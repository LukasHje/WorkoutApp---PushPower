//
//  DialView.swift
//  PushPower
//
//  Created by Lukas Hjernquist on 2024-10-07.
//
import WidgetKit
import SwiftUI

struct DialView: View {
    
    @AppStorage("streak") var streak = 0
    @AppStorage("daily_pushups") var daily_pushups = 0
    @AppStorage("current_goal") var current_goal = 100
    
    @State private var showUserInput = false
    @State private var showUserResetDailyPushups = false
    
    let data = DataManager()
    let compentry = CompareEntry()
    let rounder = MathRound()
    
    //rebase variables?
    var Kcal: Double = 0.33 //a single press-up burns vary from about 0.29 calories each to 0.36 calories. Avg≈0.33
    var time_to_completion: Double = 1.2
    
    // Calculate the percentage of the goal completed
        var completionPercentage: Int {
            return min(100, (daily_pushups * 100) / current_goal) // Ensure it doesn't go over 100%
        }
    
    var body: some View {
        VStack {
            DialHeaderView(name: "Lukas", image: "avatar_panda", statusCode: completionPercentage)
                .padding()
            
            Dial(goal: current_goal, pushups: daily_pushups)
                .padding()
            
            HStack(spacing: 70) {
                
                Button(action: {
                    showUserInput = true // Show the view when the button is pressed
                    compentry.checkLastEntryDate()
                    //lets user submit a number of pushups
                    //also logs date() of the submit
                }, label: {
                    VStack {
                        Image("Pushups")
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .frame(width: 50)
//                        Text("Submit")
//                            .font(.title)
//                            .foregroundColor(.white)
                    }
                    .foregroundColor(Color.foregroundDeepBlue)
                    .padding(5)
                    .background(
                        RoundedRectangle(cornerRadius: 15).fill(Color.foregroundYellow)
                            .shadow(color: .foregroundGray, radius: 3, x: 6, y: 6)
                            .shadow(color: .white, radius: 3, x: -6, y: -6)
                            .frame(width: 130, height: 60)
                    )
                })
                .fullScreenCover(isPresented: $showUserInput) {
                    ZStack {
                        Color.backgroundGray // Set background color here
                            .edgesIgnoringSafeArea(.all) // Ensure it covers the entire screen, including safe areas

                        UserInputPushupsView(isPresented: $showUserInput) // Pass the binding to UserInputView
                    }
                }
                
                Button(action: {
                    showUserResetDailyPushups = true // Show the view when the button is pressed
                    //lets user submit a number of pushups
                    //also logs date() of the submit
                }, label: {
                    VStack {
                        Image(systemName: "trash.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color.backgroundGray)
                    }
                    .padding(5)
                    .background(
                        RoundedRectangle(cornerRadius: 15).fill(Color.foregroundGray)
                            .shadow(color: .foregroundGray, radius: 3, x: 6, y: 6)
                            .shadow(color: .white, radius: 3, x: -6, y: -6)
                            .frame(width: 75, height: 60)
                    )
                })
                .fullScreenCover(isPresented: $showUserResetDailyPushups) {
                    ZStack {
                        Color.backgroundGray // Set background color here
                            .edgesIgnoringSafeArea(.all) // Ensure it covers the entire screen, including safe areas

                        UserResetDailyPushupsView(isPresented: $showUserResetDailyPushups) // Pass the binding to UserInputView
                    }
                }
            }
            .padding()
            .frame(maxWidth: .infinity) // Ensure HStack takes up the available width
            .alignmentGuide(.leading) { d in d[.leading] } // Align HStack to center its elements
            
            
            HStack(spacing: 50) {
                StatTile(image: "flame.fill", value: String(rounder.preciseRound(Double(daily_pushups) * Kcal, precision: .hundredths)), measurment: "Kcal")
                StatTile(image: "clock.fill", value: String(time_to_completion) + "h", measurment: "Time")
            }
        }
        .padding()
        .background(Color.backgroundGray)
    }
}

