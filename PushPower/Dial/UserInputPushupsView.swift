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
    
    @State var showUserValidateDailyPushups = false
    @State var newPushupCount: Int = 0 // User input
    
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
                showUserValidateDailyPushups = true
            }, label: {
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
            })
            .fullScreenCover(isPresented: $showUserValidateDailyPushups) {
                ZStack {
                    Color.backgroundGray
                        .edgesIgnoringSafeArea(.all)
                    
                    // Pass the `onConfirm` closure to dismiss both sheets
                    UserValidateDailyPushupsView(isPresented: $showUserValidateDailyPushups, inputDailyPushups: $newPushupCount) {
                        // When confirmed, dismiss both views
                        isPresented = false // This dismisses UserInputPushupsView
                        showUserValidateDailyPushups = false // This dismisses UserValidateDailyPushupsView
                    }
                }
            }
        }
        .padding(80)
    }
}


struct UserValidateDailyPushupsView: View {
    @Binding var isPresented: Bool
    @Binding var inputDailyPushups: Int
    
    @AppStorage("daily_pushups") var storedDailyPushups: Int = 0 // Directly use @AppStorage for daily_pushups
    
    let data = DataManager()
    var onConfirm: () -> Void // Completion handler to dismiss both sheets simultaneously
    
    var body: some View {
        VStack {
            Text("Do you really want to submit \(inputDailyPushups) pushups?")
                .foregroundColor(Color.foregroundDeepBlue)
                .fontWeight(.semibold)
                .multilineTextAlignment(.leading)
                .padding(15)
            
            HStack(spacing: 40) {
                Button(action: {
                    // Log the new pushups via DataManager and update @AppStorage
                    data.log_dailyPushups(dailyPushups: inputDailyPushups)
                    print("Updated daily_pushups: \(inputDailyPushups)") // Debugging print statement
                    
                    // Call onConfirm to dismiss both sheets simultaneously
                    onConfirm() // This dismisses the input sheet
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
                        RoundedRectangle(cornerRadius: 20).fill(Color.foregroundYellow)
                            .shadow(color: .foregroundGray, radius: 3, x: 6, y: 6)
                            .shadow(color: .white, radius: 3, x: -6, y: -6)
                            .frame(width: 60, height: 60)
                    )
                }
                
                Button(action: {
                    print("User chose not to submit daily_pushups")
                    isPresented = false // Only dismiss the confirmation sheet
                }) {
                    VStack {
                        Image(systemName: "xmark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color.white)
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


