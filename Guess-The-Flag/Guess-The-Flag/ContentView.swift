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
    @State var score : Int = 0
    @State var numberOfQuestions : Int = 0
    
    var body: some View {
        
        ZStack {
            LinearGradient(colors: [.blue, .black], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack(spacing:15) {
                Spacer()
                Text("GUESS THE FLAG")
                    .foregroundStyle(.secondary).font(.headline.weight(.medium))
                Text(countries[correctAnswer])
                    .foregroundStyle(.white).font(.largeTitle.weight(.bold))
                ForEach(0..<2) { number in
                    Button {
                        flagTapped(number)
                    } label: {
                        Image(countries[number]).clipShape(.capsule).shadow(radius: 5)
                        
                        
                    }
                }
                Spacer()
            }.padding().frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
            
            
        }.alert(scoreTitle, isPresented: $showScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(score)")
                .foregroundStyle(.white)
                .font(.title.bold())
        }
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        if(numberOfQuestions == 8) {
            score = 0
            scoreTitle = ""
            numberOfQuestions = 0
        }
        
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score = score + 10
        } else {
            scoreTitle = "Wrong"
        }
        numberOfQuestions = numberOfQuestions + 1
        if(numberOfQuestions == 8) {
            if(score == 100) {
                scoreTitle = "Congragulations!!! You won the game."
            } else {
                scoreTitle = "Oops!!! Game Over... Try Next time"
            }
        }
        showScore = true
        
    }
}

#Preview {
    ContentView()
}
