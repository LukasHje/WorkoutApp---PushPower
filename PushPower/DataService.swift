//
//  DataService.swift
//  PushPower
//
//  Created by Lukas Hjernquist on 2024-10-08.
//

import Foundation
import SwiftUI

struct DataManager {
    
    @AppStorage("streak") private var streak = 0
    @AppStorage("daily_pushups") private var daily_pushups = 0
  
    func log_streak() {
        streak += 1 //dev notes: for testing the functionality
    }
    
    func progress_streak() -> Int {
        return streak
    }
    
    func log_dp(user_input: Int) {
        daily_pushups += user_input
    }
    
    func reset_dp() {
        daily_pushups = 0
    }
    
    func progress_dp() -> Int {
        return daily_pushups
    }
}

struct CompareEntry {
    
    func checkLastEntryDate() {
        //IF last_entry (where last_entry is not Date()) and last_entry = Date() - 1 then (date should be in truncated format: 'YYYY-MM-DD')
        if(true) {
            DataManager().log_streak()
        }
    }
    
}

struct MathRound {
    // Specify the decimal place to round to using an enum
    public enum RoundingPrecision {
        case ones
        case tenths
        case hundredths
    }
    
    // Round to the specific decimal place
    public func preciseRound(
        _ value: Double,
        precision: RoundingPrecision = .ones) -> Double
    {
        switch precision {
        case .ones:
            return round(value)
        case .tenths:
            return round(value * 10) / 10.0
        case .hundredths:
            return round(value * 100) / 100.0
        }
    }
}
