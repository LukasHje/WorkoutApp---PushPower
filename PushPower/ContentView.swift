//
//  ContentView.swift
//  PushPower
//
//  Created by Lukas Hjernquist on 2024-10-08.
//

import SwiftUI

struct ContentView: View {
//    var body: some View {
//        VStack {
//            TabView {
//                DialView()
//                    .tabItem() {
//                        Image(systemName: "house")
//                        Text("Home")
//                    }
////                Dial2View()
////                    .tabItem() {
////                        Image(systemName: "testtube.2")
////                        Text("concept2")
////                    }
//                AchievementsGridView()
//                    .tabItem() {
//                        Image(systemName: "crown.fill")
//                        Text("Statistics")
//                    }
//                AchievementsView()
//                    .tabItem() {
//                        Image(systemName: "rosette")
//                        Text("Achievements")
//                    }
//            }
//        }
//    }
    
    // Start the user at DialView, which is at index 0 in the array
    @State private var selectedView = 0 // Keep track of the selected view
    
    // List of views
    private let views: [AnyView] = [
        AnyView(SettingsView()),          // -1 (Left swipe to settings)
        AnyView(DialView()),              // 0 (Starting view - DialView)
        AnyView(AchievementsGridView()),  // 1 (Right swipe to AchievementsGridView)
        AnyView(AchievementsView())       // 2 (Right swipe to AchievementsView)
    ]

    var body: some View {
        VStack {
            // Display the selected view based on the index
            views[selectedView + 1]  // Adjust the index to map [-1, 0, 1, 2] to [0, 1, 2, 3] for the views array
                .transition(.slide)
                .animation(.easeInOut, value: selectedView)
                .gesture(
                    DragGesture()
                        .onEnded { value in
                            if value.translation.width < -50 {
                                // Swipe left: Move to next view
                                withAnimation {
                                    selectedView = min(selectedView + 1, 2) // Don't exceed index 2 (rightmost view)
                                }
                            } else if value.translation.width > 50 {
                                // Swipe right: Move to previous view
                                withAnimation {
                                    selectedView = max(selectedView - 1, -1) // Don't exceed index -1 (leftmost view)
                                }
                            }
                        }
                )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AchievementsView()
//        AchievementsGridView()
        ContentView()
//        Dial2View()
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
    
    //colors for gradiant achievement-tiles
    static let gradientTileDarkGreen = Color(red: 9/255, green: 48/255, blue: 40/255)
    static let gradientTileGreen = Color(red: 35/255, green: 122/255, blue: 87/255)
    static let gradientTileLightRose = Color(red: 232/255, green: 203/255, blue: 192/255)
    static let gradientTileRose = Color(red: 99/255, green: 111/255, blue: 164/255)
    static let gradientTileVice = Color(red: 52/255, green: 148/255, blue: 230/255)
    static let gradientTileCity = Color(red: 236/255, green: 110/255, blue: 173/255)
    static let gradientTileDawnLight = Color(red: 243/255, green: 144/255, blue: 79/255)
    static let gradientTileDawnDark = Color(red: 59/255, green: 67/255, blue: 113/255)
    static let gradientTileLightGrey = Color(red: 189/255, green: 195/255, blue: 199/255)
    static let gradientTileDarkGrey = Color(red: 44/255, green: 62/255, blue: 80/255)
    
    //colors for alternative app layout
    static let OxfordBlue = Color(red: 6/255, green: 30/255, blue: 67/255)
    static let MetallicBlue = Color(red: 46/255, green: 68/255, blue: 119/255)
    static let UCLABlue = Color(red: 89/255, green: 101/255, blue: 156/255)
    static let RoyalBrown = Color(red: 88/255, green: 50/255, blue: 57/255)
    static let MangoTango = Color(red: 253/255, green: 136/255, blue: 88)
    static let Mustard = Color(red: 253/255, green: 136/255, blue: 88)
    
    
}
