//
//  DialView.swift
//  PushPower
//
//  Created by Lukas Hjernquist on 2024-10-07.
//

import SwiftUI

struct DialView: View {
    
    var input_pushups: Int = 35
    var Kcal: Double = 0.33 //a single press-up burns vary from about 0.29 calories each to 0.36 calories. Avg≈0.33
    var time_to_completion: Double = 1.2
    
    var body: some View {
        VStack {
            DialHeaderView(name: "Lukas", image: "avatar_panda")
                .padding()
            
            Dial(goal: 100, pushups: input_pushups)
                .padding()
            
            HStack(spacing: 30) {
                SubmitTile()
                StatTile(image: "flame.fill", value: String(Double(input_pushups) * Kcal), measurment: "Kcal")
                StatTile(image: "clock.fill", value: String(time_to_completion) + "h", measurment: "Time")
            }
        }
        .padding()
        .background(Color.backgroundGray)
        
        HStack {
            NavigationTiles(image: "house.fill", text: "start")
            NavigationTiles(image: "chart.bar.fill", text: "history")
            NavigationTiles(image: "", text: "Achievements")
            NavigationTiles(image: "chart.bar.fill", text: "Settings")
        }
        .background(Color.foregroundDeepBlue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DialView()
    }
}

extension Color {
    
    //Objetive-C only takes values between 0 and 1.0. RGB values gets devided by 255.
    static let backgroundGray = Color(red: 234/255, green: 235/255, blue: 239/255)
    static let backgroundBlack = Color(red: 0, green: 0, blue: 0)
    static let backgroundDeepGray = Color(red: 170/255, green: 170/255, blue: 170/255)
    static let foregroundGray = Color(red: 215/255, green: 215/255, blue: 215/255)
    static let foregroundRed = Color(red: 255/255, green: 87/255, blue: 51/255)
    static let foregroundYellow = Color(red: 255/255, green: 195/255, blue: 0)
    static let foregroundDeepBlue = Color(red: 54/255, green: 47/255, blue: 143/255)
    
}
