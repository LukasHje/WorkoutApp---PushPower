//
//  DataService.swift
//  PushPower
//
//  Created by Lukas Hjernquist on 2024-10-08.
//

import Foundation
import SwiftUI

struct DataManager {
    
    @AppStorage("streak") private var storedStreak = 0
    @AppStorage("daily_pushups") private var storedDailyPushups = 0
    @AppStorage("current_goal") var StoreCurrentGoal = 100
  
    func log_streak(streak: Int) {
        storedStreak += streak
        print("DataManager - updated streak: \(storedStreak)")
    }
    
    func reset_streak(resetValue: Int) {
        storedStreak = resetValue
    }
    
    func progress_streak() -> Int {
        return storedStreak
    }
    
    func log_dailyPushups(dailyPushups: Int) {
        storedDailyPushups += dailyPushups
        print("DataManager - updated daily_pushups: \(storedDailyPushups)")
    }
    
    func reset_dailyPushups(resetValue: Int) {
        storedDailyPushups = resetValue
    }
    
    func progress_dailyPushups() -> Int {
        return storedDailyPushups
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
