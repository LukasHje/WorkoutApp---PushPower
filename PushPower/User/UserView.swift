//
//  UserView.swift
//  PushPower
//
//  Created by Lukas Hjernquist on 2024-10-08.
//

import Foundation
import SwiftUI

struct UserView: View {
    
    let emoji1: String = "🏗️"
    let emoji2: String = "⚙️"
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 20) {
                    Text("\(emoji2) User settings")
                        .foregroundColor(Color.foregroundDeepBlue)
                        .font(.title)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.leading)
                    Text("will be here shortly... \(emoji1)")
                        .foregroundColor(Color.foregroundDeepBlue)
                }
                
                Spacer()
                
                Image("Pushups")
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .frame(width: 50)
            }
            .foregroundColor(.accentColor)
        }
        .padding()
        .background(Color.backgroundGray)
    }
}
