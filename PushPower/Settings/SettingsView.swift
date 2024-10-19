//
//  SettingsView.swift
//  PushPower
//
//  Created by Lukas Hjernquist on 2024-10-18.
//

import Foundation
import SwiftUI

struct SettingsView: View {
    
    // Toggle states to track selected mode
    @State private var selectedMode: Mode = .endurance
    @State private var showResetConfirmation = false // State to show the confirmation dialog
    
    enum Mode {
        case endurance
        case explosive
        case beast
    }

    var body: some View {
        ZStack {
            // Background color for the whole screen
            Color.backgroundGray
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Text("Select Your Mode")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.foregroundDeepBlue)
                    .padding()

                // Mode toggles
                VStack(spacing: 20) {
                    Toggle("Endurance Mode", isOn: Binding(
                        get: { selectedMode == .endurance },
                        set: { if $0 { selectedMode = .endurance } }
                    ))
                    .toggleStyle(SwitchToggleStyle(tint: .green)) // Custom tint color
                    .foregroundColor(Color.foregroundDeepBlue)
                    
                    Toggle("Explosive Mode", isOn: Binding(
                        get: { selectedMode == .explosive },
                        set: { if $0 { selectedMode = .explosive } }
                    ))
                    .toggleStyle(SwitchToggleStyle(tint: .orange))
                    .foregroundColor(Color.foregroundDeepBlue)
                    
                    Toggle("Beast Mode", isOn: Binding(
                        get: { selectedMode == .beast },
                        set: { if $0 { selectedMode = .beast } }
                    ))
                    .toggleStyle(SwitchToggleStyle(tint: .red))
                    .foregroundColor(Color.foregroundDeepBlue)
                }
                .padding(.horizontal, 20)

                // Display mode-specific title and description
                VStack(spacing: 10) {
                    Text(displayModeTitle(selectedMode)) // Title for the selected mode
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(Color.foregroundDeepBlue)
                    
                    Text(displayModeDescription(selectedMode)) // Description for the selected mode
                        .font(.subheadline)
                        .foregroundColor(Color.foregroundDeepBlue)
                        .multilineTextAlignment(.center)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 15)
                                .fill(Color.white)
                                .shadow(radius: 5))
                .padding()

                Spacer()
                
                // Reset App Button
                Button(action: {
                    showResetConfirmation = true // Show confirmation dialog
                }) {
                    Text("Reset App")
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .cornerRadius(10)
                }
                .padding(.horizontal, 20)
                .alert(isPresented: $showResetConfirmation) {
                    // Confirmation dialog
                    Alert(
                        title: Text("Reset App"),
                        message: Text("Are you sure you want to reset the app? This will erase all progress and cannot be undone."),
                        primaryButton: .destructive(Text("Reset")) {
                            resetApp() // Call the reset function if user confirms
                        },
                        secondaryButton: .cancel()
                    )
                }

            }
        }
    }
    
    // Function to return the appropriate title based on the selected mode
    func displayModeTitle(_ mode: Mode) -> String {
        switch mode {
        case .endurance:
            return "Endurance Mode"
        case .explosive:
            return "Explosive Mode"
        case .beast:
            return "Beast Mode"
        }
    }

    // Function to return the appropriate text based on the selected mode
    func displayModeDescription(_ mode: Mode) -> String {
        switch mode {
        case .endurance:
            return "Your goal will increase by 25 pushups upon completing your current goal."
        case .explosive:
            return "Your goal will increase by 50 pushups upon completing your current goal."
        case .beast:
            return "You will register pushups one-at-a-time using your nose for deep and thorough reps. Your goal will increase by 75 pushups upon completing your current goal."
        }
    }
    
    // Function to reset all @AppStorage data
    func resetApp() {
        // Reset all @AppStorage values here
        UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
        UserDefaults.standard.synchronize()
        
        // You can also explicitly reset any other state or storage values here if needed
    }
}
