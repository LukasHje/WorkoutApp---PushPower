//
//  Dial2View.swift
//  PushPower
//
//  Purly for visual concept
//
//  Created by Lukas Hjernquist on 2024-10-07.
//
import WidgetKit
import SwiftUI

struct Dial2View: View {
    
    let rounder = MathRound()
    
    var daily_pushups: Int = 20
    
    //rebase variables?
    var Kcal: Double = 0.33 //a single press-up burns vary from about 0.29 calories each to 0.36 calories. Avg≈0.33
    var time_to_completion: Double = 1.2
    
    var body: some View {
        VStack {
            Dial2HV(name: "Lukas", image: "avatar_panda")
                .padding()
            
            Dial2(goal: 100, pushups: daily_pushups)
                .padding()
            
            HStack {
                Button(action: {
                    //lets user submit a number of pushups
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
                StatTile2(image: "flame.fill", value: String(rounder.preciseRound(Double(daily_pushups) * Kcal, precision: .hundredths)), measurment: "Kcal")
                StatTile2(image: "clock.fill", value: String(time_to_completion) + "h", measurment: "Time")
            }
        }
        .padding()
        .background(Color.MetallicBlue)
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        DialView()
//    }
//}

