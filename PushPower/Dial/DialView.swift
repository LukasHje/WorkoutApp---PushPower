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
    
    @AppStorage("last_reset_date") var lastResetDate: String = ""
    @AppStorage("last_completion_date") var lastCompletionDate: String = ""
    @AppStorage("start_time") var startTime: String = ""
    
    @AppStorage("streak") private var storedStreak = 0
    @AppStorage("daily_pushups") private var storedDailyPushups = 0
    @AppStorage("current_goal") var storedCurrentGoal = 100
    
    //show input-form or achievment-popup
    @State private var showUserInput = false
    @State private var showAchievementPopup = false
    
    @State private var achievementText = ""
    @State private var completionTime: String = "N/A"
    @State private var goalReached = false
    
    @State private var buttonScale: CGFloat = 1.0 // Track the button's scale for animation
    
    private var Kcal: Double = 0.33
    
    //instanciate DataServices: to persist values,
    //instanciate math function: to round values
    let data = DataManager()
    let rounder = MathRound()

    
    var body: some View {
        ZStack {
            // Add the background color here and ensure it covers the entire screen
            Color.backgroundGray
                .edgesIgnoringSafeArea(.all) // This will extend the background across the entire screen
            
            VStack {
                // Compute the completion percentage directly in the body
                let completionPercentage = min(100, (storedDailyPushups * 100) / storedCurrentGoal)
                
                DialHeaderView(name: "Lukas", image: "avatar_panda", statusCode: completionPercentage)
                    .padding()
                    .frame(maxWidth: .infinity) // Allow it to expand horizontally
                
                ZStack {
                    Dial(goal: storedCurrentGoal, pushups: storedDailyPushups)
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: .infinity) // Allow it to fill available space
                        .zIndex(0)
                    
                    Button(action: {
                        // Start bouncing animation
                        withAnimation(Animation.interpolatingSpring(stiffness: 100, damping: 5)) {
                            buttonScale = 1.3 // Increase the button scale for a larger bounce
                        }
                        
                        // Reset scale back to normal after a slight delay
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                            withAnimation(Animation.spring(response: 0.3, dampingFraction: 0.5, blendDuration: 0)) {
                                buttonScale = 1.0 // Reset back to original scale
                            }
                        }
                        
                        // Delay sheet presentation slightly to allow the animation to complete
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                            // Preforms button actions
                            showUserInput = true
                            logStartTimeIfNeeded()
                            logCompletionTime()
                            logPushupCompletion()
                        }
                    }, label: {
//                            VStack {
//                                Image("Pushups")
//                                    .resizable()
//                                    .scaledToFit()
//                                    .clipShape(RoundedRectangle(cornerRadius: 15))
//                                    .frame(width: 50)
//                            }
//                            .foregroundColor(Color.foregroundDeepBlue)
//                            .padding(5)
//                            .background(
//                                RoundedRectangle(cornerRadius: 15).fill(Color.foregroundYellow)
//                                    .shadow(color: .foregroundGray, radius: 3, x: 6, y: 6)
//                                    .shadow(color: .white, radius: 3, x: -6, y: -6)
//                                    .frame(width: 130, height: 60)
//                            )
                        // Text elements in the center
                        VStack {
                            Text("Goal: \(storedCurrentGoal)")
                                .foregroundColor(Color.foregroundDeepBlue)
                            Text("\(storedDailyPushups)")
                                .foregroundColor(Color.foregroundYellow)
                                .font(.title)
                                .bold()
                                .padding()
                            Text("Pushups")
                                .foregroundColor(Color.foregroundDeepBlue)
                        }
                        .padding(50) // Add padding inside the button
                        .background(
                            Circle() // Make the button circular
                                .fill(Color.backgroundGray)
                                //.shadow(color: .foregroundGray, radius: 3, x: -1, y: -1)
                                //.shadow(color: .white, radius: 3, x: -1, y: -1)
                                //.frame(width: 130, height: 130) // Control the size of the circular button
                        )
                    })
                    .zIndex(1)
                    .fullScreenCover(isPresented: $showUserInput) {
                        ZStack {
                            Color.backgroundGray
                                .edgesIgnoringSafeArea(.all)
                            UserInputPushupsView(isPresented: $showUserInput)
                        }
                    }
                }
                
                
                HStack(spacing: 25) {
                    StatTileCalBurnt(image: "flame.fill", value: String(rounder.preciseRound(Double(storedDailyPushups) * Kcal, precision: .hundredths)), measurment: "Kcal")
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
        }
    }
    
    enum Achievement: String {
        case threeDayStreak = "Three Day Streak"
        case aJourneyBegins = "My First Day"
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
        if storedStreak == 0 && storedDailyPushups > 0 && !aJourneyBegins {
            unlockAchievement(.aJourneyBegins)
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
        case .aJourneyBegins:
            aJourneyBegins = true
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
    
    // Function to reset start time. Which also will reset Completion_Time and KcalBurned
    func resetStartTime() {
        startTime = ""
        
        // Reset completion time
        completionTime = "N/A"
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
            
            // Format based on whether it's over an hour or less
            if hours > 0 {
                // If time exceeds 1 hour, show hours with minutes as decimal
                let decimalMinutes = Double(minutes) / 60.0
                let timeString = String(format: "%.2fh", Double(hours) + decimalMinutes)
                completionTime = timeString // Update local state
            } else {
                // If time is below 1 hour, show minutes with seconds as decimal
                let decimalSeconds = Double(seconds) / 60.0
                let timeString = String(format: "%.2fm", Double(minutes) + decimalSeconds)
                completionTime = timeString // Update local state
            }
        } else {
            completionTime = "N/A" // If no valid start time is found
        }
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

//dev notes: Used for debugging
func resetAppStorage() {
    if let appDomain = Bundle.main.bundleIdentifier {
        UserDefaults.standard.removePersistentDomain(forName: appDomain)
        print("AppStorage reset for all keys")
    }
}

