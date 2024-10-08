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
    
    let data = DataService()
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
                    daily_pushups += 1
                    //somthing else
                }, label: {
                    VStack {
                        Image("Pushups")
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .frame(width: 50)
                        //Text("Submit")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                    .foregroundColor(Color.foregroundDeepBlue)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 15).fill(Color.foregroundRed)
                            .shadow(color: .foregroundGray, radius: 3, x: 6, y: 6)
                            .shadow(color: .white, radius: 3, x: -6, y: -6)
                            .frame(width: 175)
                    )
                })
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
