//
//  ContentView.swift
//  Guess-The-Flag
//
//  Created by Sreekutty Maya on 21/12/2023.
//

import SwiftUI

struct ContentView: View {
    var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"]
    var correctAnswer = Int.random(in: 0...2)

    var body: some View {
        
        ZStack {
            Color.blue
            VStack {
                Text("Tap the flag of")
                    .foregroundStyle(.white)

                Text(countries[correctAnswer])
                    .foregroundStyle(.white)
                
                ForEach(0..<2) { number in
                        Button {
                           // flag was tapped
                        } label: {
                            Image(countries[number])
                        }
                    }
            }
            
            
        }
    }
    
}

#Preview {
    ContentView()
}
