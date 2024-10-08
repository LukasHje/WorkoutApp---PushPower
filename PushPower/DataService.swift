//
//  DataService.swift
//  PushPower
//
//  Created by Lukas Hjernquist on 2024-10-08.
//

import Foundation
import SwiftUI

struct DataService {
    
    @AppStorage("streak") private var streak = 0
    
    func log() {
        streak += 1
    }
    
    func progress() -> Int {
        return streak
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
