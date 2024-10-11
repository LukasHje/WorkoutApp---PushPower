//
//  ContentView.swift
//  PushPower
//
//  Created by Lukas Hjernquist on 2024-10-08.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TabView {
                DialView()
                    .tabItem() {
                        Image(systemName: "house")
                        Text("Home")
                    }
//                Dial2View()
//                    .tabItem() {
//                        Image(systemName: "testtube.2")
//                        Text("concept2")
//                    }
                StatisticsView()
                    .tabItem() {
                        Image(systemName: "chart.bar.fill")
                        Text("Statistics")
                    }
                AchievementsView()
                    .tabItem() {
                        Image(systemName: "rosette")
                        Text("Achievements")
                    }
                UserView()
                    .tabItem() {
                        Image(systemName: "gearshape") //alt. person.fill
                        Text("Settings")
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        //Dial2View()
    }
}

extension Color {
    
    //Objetive-C only takes values between 0 and 1.0. RGB values gets devided by 255.
    static let backgroundGray = Color(red: 234/255, green: 235/255, blue: 239/255)
    static let backgroundDeepGray = Color(red: 170/255, green: 170/255, blue: 170/255)
    static let foregroundGray = Color(red: 215/255, green: 215/255, blue: 215/255)
    static let foregroundRed = Color(red: 255/255, green: 87/255, blue: 51/255)
    static let foregroundYellow = Color(red: 255/255, green: 195/255, blue: 0)
    static let foregroundDeepBlue = Color(red: 54/255, green: 47/255, blue: 143/255)
    
    //colors for alternative app layout
    static let OxfordBlue = Color(red: 6/255, green: 30/255, blue: 67/255)
    static let MetallicBlue = Color(red: 46/255, green: 68/255, blue: 119/255)
    static let UCLABlue = Color(red: 89/255, green: 101/255, blue: 156/255)
    static let RoyalBrown = Color(red: 88/255, green: 50/255, blue: 57/255)
    static let MangoTango = Color(red: 253/255, green: 136/255, blue: 88)
    static let Mustard = Color(red: 253/255, green: 136/255, blue: 88)
    
    
}
