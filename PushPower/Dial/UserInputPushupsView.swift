//
//  UserInputPushupsView.swift
//  PushPower
//
//  Created by Lukas Hjernquist on 2024-10-10.
//

import Foundation
import SwiftUI

struct UserInputPushupsView: View {
    
    @Binding var isPresented: Bool
    
    @AppStorage("daily_pushups") var daily_pushups: Int = 0 // Directly use @AppStorage for daily_pushups
    
    @State private var newPushupCount: Int = 0 // Example state for user input
    
    let data = DataManager()
    
    var body: some View {
        VStack {
            Text("Pushups performed...")
                .foregroundColor(Color.foregroundDeepBlue)
                .padding(15)

            TextField("Pushups", value: $newPushupCount, formatter: NumberFormatter())
                .keyboardType(.numberPad)
                .padding(15)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5)
            
            Button(action: {
                // Log the new pushups via DataManager and update @AppStorage
                data.log_dailyPushups(dailyPushups: newPushupCount)
                
                // SwiftUI automatically updates @AppStorage value, reflecting in other views
                print("Updated daily_pushups: \(daily_pushups)") // Debugging print statement
                
                // Dismiss the sheet
                isPresented = false
            }) {
                VStack {
                    Image("Pushups")
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .frame(width: 50)
                }
                .foregroundColor(Color.foregroundDeepBlue)
                .padding(15)
                .background(
                    RoundedRectangle(cornerRadius: 20).fill(Color.foregroundYellow)
                        .shadow(color: .foregroundGray, radius: 3, x: 6, y: 6)
                        .shadow(color: .white, radius: 3, x: -6, y: -6)
                        .frame(width: 70, height: 70)
                )
            }
        }
        .padding(80)
    }
}


struct UserResetDailyPushupsView: View {
    
    @Binding var isPresented: Bool
    
    @AppStorage("daily_pushups") var daily_pushups: Int = 0 // Directly use @AppStorage for daily_pushups
    
    let data = DataManager()
    
    var body: some View {
        VStack {
            Text("Do you really want to reset todays pushups?")
                .foregroundColor(Color.foregroundDeepBlue)
                .fontWeight(.semibold)
                .multilineTextAlignment(.leading)
                .padding(15)
            HStack(spacing: 40) {
                Button(action: {
                    // Log the reset of pushups via DataManager and update @AppStorage
                    data.reset_dailyPushups(resetValue: 0) // Persist the reset of dailyPushups
                    
                    // SwiftUI automatically updates @AppStorage value, reflecting in other views
                    print("Updated daily_pushups: \(daily_pushups)") // Debugging print statement
                    
                    // Dismiss the sheet
                    isPresented = false
                }) {
                    VStack {
                        Image(systemName: "checkmark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color.backgroundGray)
                    }
                    .padding(15)
                    .background(
                        RoundedRectangle(cornerRadius: 20).fill(Color.foregroundRed)
                            .shadow(color: .foregroundGray, radius: 3, x: 6, y: 6)
                            .shadow(color: .white, radius: 3, x: -6, y: -6)
                            .frame(width: 60, height: 60)
                    )
                }
                
                Button(action: {
                    // User rejects to reset daily pushups counter: No action and we return to the DialView()
                    // Dismiss the sheet
                    isPresented = false
                }) {
                    VStack {
                        Image(systemName: "xmark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color.backgroundGray)
                        
                    }
                    .padding(15)
                    .background(
                        RoundedRectangle(cornerRadius: 20).fill(Color.foregroundGray)
                            .shadow(color: .foregroundGray, radius: 3, x: 6, y: 6)
                            .shadow(color: .white, radius: 3, x: -6, y: -6)
                            .frame(width: 60, height: 60)
                    )
                }
            }
        }
        .padding(80)
    }
}

