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
    
    @State private var showUserInput = false
    
    let data = DataManager()
    let compentry = CompareEntry()
    let rounder = MathRound()
    
    //rebase variables?
    var Kcal: Double = 0.33 //a single press-up burns vary from about 0.29 calories each to 0.36 calories. Avg≈0.33
    var time_to_completion: Double = 1.2
    
    var body: some View {
        VStack {
            DialHeaderView(name: "Lukas", image: "avatar_panda")
                .padding()
            
            Dial(goal: 100, pushups: daily_pushups)
                .padding()
            
            HStack {
                
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
                        RoundedRectangle(cornerRadius: 15).fill(Color.foregroundRed)
                            .shadow(color: .foregroundGray, radius: 3, x: 6, y: 6)
                            .shadow(color: .white, radius: 3, x: -6, y: -6)
                            .frame(width: 175)
                    )
                })
                .fullScreenCover(isPresented: $showUserInput) {
                    ZStack {
                        Color.backgroundGray // Set background color here
                            .edgesIgnoringSafeArea(.all) // Ensure it covers the entire screen, including safe areas

                        UserInputView(isPresented: $showUserInput) // Pass the binding to UserInputView
                    }
                }
            }
            .padding()
            
            HStack(spacing: 30) {
                StatTile(image: "flame.fill", value: String(rounder.preciseRound(Double(daily_pushups) * Kcal, precision: .hundredths)), measurment: "Kcal")
                StatTile(image: "clock.fill", value: String(time_to_completion) + "h", measurment: "Time")
            }
        }
        .padding()
        .background(Color.backgroundGray)
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        DialView()
//    }
//}

