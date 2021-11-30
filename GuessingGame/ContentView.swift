//
//  ContentView.swift
//  GuessingGame
//
//  Created by Joyce Tao on 2021-11-30.
//

import SwiftUI

struct ContentView: View {
    // MARK: Stored properties
    
    // What the user is currently guessing
    @State var currentGuess: Double = 50.0
    
    // The feedback given to the user
    @State var feedback: String = ""
    
    // The target the user is trying to guess
    // A random value between 1 and 100, inclusive
    let target = Int.random(in: 1...100)
    
    // MARK: Computed properties
    var body: some View {
        VStack(spacing: 20) {
            
            // Output - show current guess
            Text("\(String(format: "%.0f", currentGuess))")
                .font(.title2)
                .bold()
            
            // Input - select current guess
            Slider(value: $currentGuess,
                   in: 0.0...100.0,
                   step: 1.0,
                   label: {
                Text("Guess")
            }, minimumValueLabel: {
                Text("0")
            },
                   maximumValueLabel: {
                Text("100")
            })
            
            // Input - check the guess
            Button(action: {
                
                // Create a temporary constant with the guess as an integer
                let currentGuessAsInteger = Int(currentGuess)
                
                // Check the user's guess
                if currentGuessAsInteger > target {
                    feedback = "Guess lower next time."
                } else if currentGuessAsInteger < target {
                    feedback = "Guess higher next time."
                } else {
                    feedback = "You guessed it!"
                }
                
            },
                   label: {
                Text("Submit Guess")
            })
                .buttonStyle(.bordered)
            
            // Output - show feedback
            Text("\(feedback)")
                .italic()
                .padding()
            
            // DEGUG - show the secret target
            Text("The actual secret number is: \(target).")
            
            Spacer()
        }
        .padding()
        .navigationTitle("Guessing Game")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}
