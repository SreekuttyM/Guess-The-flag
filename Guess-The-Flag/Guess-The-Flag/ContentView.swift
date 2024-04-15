//
//  ContentView.swift
//  Guess-The-Flag
//
//  Created by Sreekutty Maya on 21/12/2023.
//

import SwiftUI

struct ContentView: View {
    @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"]
    @State var correctAnswer = Int.random(in: 0...2)
    @State var scoreTitle = ""
    @State var showScore : Bool = false

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
                        flagTapped(number)
                        } label: {
                            Image(countries[number])
                        }
                    }
            }
            
            
        }.alert(scoreTitle, isPresented: $showScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is ???")
        }
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)

    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong"
        }

        showScore = true
    }
}

#Preview {
    ContentView()
}
