//
//  DialView.swift
//  PushPower
//
//  Created by Lukas Hjernquist on 2024-10-07.
//
import WidgetKit
import SwiftUI

struct DialView: View {
    
    @Environment(\.scenePhase) var scenePhase
    
    // Tracking achievements using @AppStorage
    @AppStorage("threeDayStreakAchieved") private var threeDayStreakAchieved = false
    @AppStorage("myFirstDayAchieved") private var myFirstDayAchieved = false
    @AppStorage("firstGoalAchieved") private var firstGoalAchieved = false
    
    @AppStorage("last_reset_date") var lastResetDate: String = ""
    @AppStorage("last_completion_date") var lastCompletionDate: String = ""
    @AppStorage("start_time") var startTime: String = ""
    
    @AppStorage("streak") private var storedStreak = 0
    @AppStorage("daily_pushups") private var storedDailyPushups = 0
    @AppStorage("current_goal") var storedCurrentGoal = 100
    

    // State variables to track the current session values
    @State private var streak: Int = 0
    @State private var daily_pushups: Int = 0
    @State private var current_goal: Int = 100
    
    @State private var showUserInput = false
    @State private var showUserResetDailyPushups = false
    
    @State private var completionTime: String = "N/A"
    @State private var goalReached = false
    
    @State private var showAchievementPopup = false
    @State private var achievementText = ""
    
    let data = DataManager()
    let rounder = MathRound()

    var Kcal: Double = 0.33

    var completionPercentage: Int {
        let adjustedStreak = max(1, storedStreak) // Ensure streak starts from at least 1
        guard storedCurrentGoal > 0 else { return 0 } // Avoid division by zero
        return min(100, (adjustedStreak * 100) / storedCurrentGoal)
    }
    
    var body: some View {
        ZStack {
            // Add the background color here and ensure it covers the entire screen
            Color.backgroundGray
                .edgesIgnoringSafeArea(.all) // This will extend the background across the entire screen
            
            VStack {
                DialHeaderView(name: "Lukas", image: "avatar_panda", statusCode: completionPercentage)
                    .padding()
                    .frame(maxWidth: .infinity) // Allow it to expand horizontally
                
                Dial(goal: storedCurrentGoal, pushups: storedDailyPushups)
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity) // Allow it to fill available space
                
                HStack(spacing: 70) {
                    Button(action: {
                        showUserInput = true
                        logStartTimeIfNeeded()
                        logCompletionTime()
                        logPushupCompletion()
                    }, label: {
                        VStack {
                            Image("Pushups")
                                .resizable()
                                .scaledToFit()
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .frame(width: 50)
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
                            Color.backgroundGray
                                .edgesIgnoringSafeArea(.all)
                            UserInputPushupsView(isPresented: $showUserInput)
                        }
                    }
                    
                    Button(action: {
                        showUserResetDailyPushups = true
                        resetStartTime()
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
                            Color.backgroundGray
                                .edgesIgnoringSafeArea(.all)
                            UserResetDailyPushupsView(isPresented: $showUserResetDailyPushups)
                        }
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                
                HStack(spacing: 50) {
                    StatTileCalBurnt(image: "flame.fill", value: String(rounder.preciseRound(Double(daily_pushups) * Kcal, precision: .hundredths)), measurment: "Kcal")
                        .frame(width: 100, height: 100)
                    StatTileTimeElapsed(image: "clock.fill", value: completionTime, measurment: "Time")
                        .frame(width: 150, height: 100)
                    
                    
                // Achievement Popup
                if showAchievementPopup {
                    VStack {
                        Text("🎉 Achievement Unlocked! 🎉")
                        Text(achievementText)
                    }
                    .padding()
                    .background(Color.yellow)
                    .cornerRadius(10)
                
                }
                    
                }
                .padding()
            }
        }
        .onAppear {
            print("DialView - current daily_pushups: \(storedDailyPushups)")
            resetDailyPushupsIfNeeded()
            checkForAchievement() // Re-check achievements on app launch or view load
        }
        .onChange(of: scenePhase) { newPhase in
            if newPhase == .active {
                resetDailyPushupsIfNeeded()
                checkForAchievement() // Re-check achievements on app launch or view load
            }
        }
    }
    
    
    func logPushupCompletion() {
        let today = getCurrentDateString()
        
        if storedDailyPushups >= storedCurrentGoal {
            goalReached = true // Set goalReached to true once the goal is completed
            
            // Convert the lastCompletionDate from String to Date
           if lastCompletionDate.isEmpty || !Calendar.current.isDateInToday(getDate(from: lastCompletionDate) ?? Date.distantPast) {
               // First completion or goal completed on a new day
                if let lastDate = getDate(from: lastCompletionDate),
                   Calendar.current.isDateInYesterday(lastDate) {
                    // Continue streak if yesterday's goal was completed
                    data.log_streak(streak: 1) // Persist streak
                } else {
                    // Reset streak if yesterday's goal was not completed
                    data.reset_streak(resetValue: 1) // Persist the reset of streak
                }
            }
            // Update last completion date
            lastCompletionDate = today
            
            // Now that streak and goal status are updated, check for achievements
            checkForAchievement()
            
            // Reset start time after goal completion
            resetStartTime()
        }
    }
    
    enum Achievement: String {
        case threeDayStreak = "Three Day Streak"
        case myFirstDay = "My First Day"
        case firstGoal = "Completed my First Goal"
        // Add more achievements here as needed
    }
        
    // Function to check and trigger achievements
    func checkForAchievement() {
        print("Checking for achievements. Streak: \(storedStreak), Daily Pushups: \(storedDailyPushups), Current Goal: \(storedCurrentGoal)")
        
        // Check for "Three Day Streak" achievement
        if storedStreak == 3 && !threeDayStreakAchieved {
            unlockAchievement(.threeDayStreak)
        }
        
        // Check for "My First Day" achievement (first time user hits a streak of 1)
        if storedStreak == 1 && !myFirstDayAchieved {
            unlockAchievement(.myFirstDay)
        }
        
        // Check for "Completed First Goal" achievement
        if storedDailyPushups >= storedCurrentGoal && !firstGoalAchieved {
            unlockAchievement(.firstGoal)
        }
        
        // Add more achievement conditions here
    }
    
    // Unlock an achievement and show the popup
    func unlockAchievement(_ achievement: Achievement) {
        switch achievement {
        case .threeDayStreak:
            threeDayStreakAchieved = true
        case .myFirstDay:
            myFirstDayAchieved = true
        case .firstGoal:
            firstGoalAchieved = true
        }
        
        // Set the achievement text and show the popup
        achievementText = achievement.rawValue
        showAchievementPopup = true
        
        // Dismiss popup after 3 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            showAchievementPopup = false
        }
    }
    
    
    func resetDailyPushupsIfNeeded() {
        let today = getCurrentDateString()
        
        // Check if lastResetDate is empty or if it is not the current day
        if lastResetDate != today {
            // Reset daily pushups
            data.reset_dailyPushups(resetValue: 0) // Persist the reset of dailyPushups
            
            // Update the last reset date to today
            lastResetDate = today
        }
    }
    
    func logStartTimeIfNeeded() {
        if startTime.isEmpty {
            startTime = getCurrentTimeString()
        }
    }
    
    func logCompletionTime() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        if let start = formatter.date(from: startTime) {
            let now = Date()
            let timeInterval = now.timeIntervalSince(start)
            
            // Convert timeInterval (seconds) into hours, minutes, and seconds
            let hours = Int(timeInterval) / 3600
            let minutes = (Int(timeInterval) % 3600) / 60
            let seconds = Int(timeInterval) % 60
            
            let timeString = String(format: "%02dh %02dm %02ds", hours, minutes, seconds)
            completionTime = timeString // Update local state
        } else {
            completionTime = "N/A" // If no valid start time is found
        }
    }
    
    // Function to reset start time. Which also will reset Completion_Time and KcalBurned
    func resetStartTime() {
        startTime = ""
        
        // Reset completion time
        completionTime = "N/A"
    }

    // Helper functions to get the current date as a string and convert from string to date
    func getCurrentDateString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: Date())
    }

    func getDate(from string: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.date(from: string)
    }
    
    // Helper function to get the current time as a string
    func getCurrentTimeString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss" // Format to store both date and time
        return formatter.string(from: Date())
    }

}



