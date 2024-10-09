//
//  UserInputView.swift
//  PushPower
//
//  Created by Lukas Hjernquist on 2024-10-10.
//

import Foundation
import SwiftUI

struct UserInputView: View {
    
    @Binding var isPresented: Bool
    @State private var pushupCount: Int = 0 // Example state for user input
    let data = DataManager()
    
    var body: some View {
        VStack {
            Text("Pushups performed...")
                .foregroundColor(Color.foregroundDeepBlue)
                .padding(15)

            TextField("Pushups", value: $pushupCount, formatter: NumberFormatter())
                .keyboardType(.numberPad)
                .padding(15)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5)
            
            Button(action: {
                // Do something with pushupCount, like saving it
//                if let number = Int(inputValue) {
//                    DataManager().log_dp(user_input: number)
//                } else {
//                    numberValue = nil // Handle the case where conversion fails
//                }
                data.log_dp(user_input: pushupCount)
                
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
                    RoundedRectangle(cornerRadius: 20).fill(Color.foregroundRed)
                        .shadow(color: .foregroundGray, radius: 3, x: 6, y: 6)
                        .shadow(color: .white, radius: 3, x: -6, y: -6)
                        .frame(width: 70, height: 70)
                )
//                Text("Submit")
//                    .padding()
//                    .background(Color.foregroundRed)
//                    .foregroundColor(.white)
//                    .cornerRadius(10)
            }
        }
        .padding(80)
    }
}
