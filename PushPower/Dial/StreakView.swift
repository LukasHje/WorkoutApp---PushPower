//
//  StreakView.swift
//  PushPower
//
//  Created by Lukas Hjernquist on 2024-10-18.
//

import Foundation
import SwiftUI

struct StreakView: View {
    
    // Using @AppStorage to retrieve streak and last_completion_date
    @AppStorage("streak") private var streak: Int = 0
    @AppStorage("last_completion_date") private var lastCompletionDate: String = ""

    // Example for testing: Array to store whether pushups are completed for each day
    var completedDays: [Bool] {
        calculateStreakStatus()
    }
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 25).fill(Color.backgroundGray)
                .frame(width: .infinity, height: 80)
                .shadow(color: .foregroundGray, radius: 3, x: 4, y: 4)
                .shadow(color: .white, radius: 3, x: -2, y: -2)
                .overlay(
                    HStack(spacing: 10) {
                        // Iterate through 7 days, showing a circle for each day
                        ForEach(0..<7) { index in
                            VStack(spacing: 5) {
                                // Display the first three letters of the day
                                Text(threeLetterDay(for: index))
                                    .font(.caption)
                                    .foregroundColor(.foregroundDeepBlue)
                                
                                // Display the circle for each day based on completion status
                                Circle()
                                    .fill(completedDays[index] ? Color.gradientTileGreen : Color.gradientTileLightGrey)
                                    .frame(width: 40, height: 40)
                                    .overlay(
                                        completedDays[index] ?
                                        Image(systemName: "checkmark.circle.fill")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 20, height: 20)
                                            .foregroundColor(.white)
                                        : nil
                                    )
                            }
                        } // ForEach{} Ends
                    } // HStack Ends
                    .padding()
                )
        } // VStack() Ends
        .padding()
    } // Body Ends
    
    // Helper function to return the first three letters of each day
    func threeLetterDay(for index: Int) -> String {
        let days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
        return days[index]
    }
    
    // Function to calculate which days have been completed based on streak and last completion date
    func calculateStreakStatus() -> [Bool] {
        var completed = [Bool](repeating: false, count: 7) // Initialize an array with 7 false values
        
        guard let lastDate = getDate(from: lastCompletionDate) else {
            return completed // Return all false if last completion date is invalid
        }
        
        let calendar = Calendar.current
        let today = Date()
        
        // Calculate how many days back to check based on the streak
        for i in 0..<min(streak, 7) {
            if let pastDate = calendar.date(byAdding: .day, value: -i, to: today) {
                // Check if the past date matches the completion date for each day
                completed[6 - i] = calendar.isDate(pastDate, equalTo: lastDate, toGranularity: .day)
            }
        }
        
        return completed
    }
    
    // Helper function to convert the stored date string into a Date object
    func getDate(from dateString: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.date(from: dateString)
    }
    
} // Struct Ends

