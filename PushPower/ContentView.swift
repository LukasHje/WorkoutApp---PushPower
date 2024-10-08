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
        .foregroundColor(Color.backgroundBlack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
