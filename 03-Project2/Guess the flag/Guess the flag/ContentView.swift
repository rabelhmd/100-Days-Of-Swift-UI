//
//  ContentView.swift
//  Guess the flag
//
//  Created by Rabel Ahmed on 16/03/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false

    @State private var scoreTitle = ""
    @State private var scoreMessage = ""
    
    // Challange 1
    @State private var score = 0
    
    @State private var opacityAmount = 1.0
    @State private var rotationAmount = 0.0
    @State private var wrongRotationAmount = [0.0, 0.0, 0.0]
    
    var body: some View {
        
        ZStack {
            GradientView()
            
            VStack(spacing: 30) {
                
                Spacer()
                
                VStack {
                    TitleTextView()
                    QuestionFlagTextView(question: countries[correctAnswer])
                }
                
                ForEach(0 ..< 3, id: \.self) { number in
                    
                    Button(action: {
                        self.opacityAmount = 0.8
                        self.answerTapped(number)
                    }) {
                        // project 3 - challenge 3
                        FlagImageView(imageName: self.countries[number])
                    }
                    .opacity(number == self.correctAnswer ? 1 : self.opacityAmount)
                    .rotation3DEffect(.degrees(number == self.correctAnswer ? self.rotationAmount : 0),
                                      axis: (x: 0, y: 1, z: 0))
                    .rotation3DEffect(.degrees(self.wrongRotationAmount[number]),
                                      axis: (x: 0, y: 1, z: 0))
                }
                
                // Challange 2
                ScoreTextView(score: score)
                
                Spacer()
            }
        }
        .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text(scoreMessage), dismissButton: .default(Text("Continue")) {
                self.askQuestion()
            })
        }
    }
    
    private func answerTapped(_ number: Int) {
        
        number == correctAnswer ? handleCorrectAnswer() : handleWrongAnswer(number)
        
        showingScore = true
    }
    
    private func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        withAnimation(.easeInOut) {
            self.opacityAmount = 1.0
        }
        self.rotationAmount = 0.0
        wrongRotationAmount = Array(repeating: 0.0, count: 3)
    }
    
    private func handleCorrectAnswer() {
        score += 1 // Challenge 1
        scoreTitle = "CORRECT!"
        scoreMessage = "Your score is: \(score)" // Challenge 1
        rotationAmount = 0.0
        withAnimation(.interpolatingSpring(stiffness: 20, damping: 5)) {
            self.rotationAmount = 360
        }
    }
    
    private func handleWrongAnswer(_ number: Int) {
        score -= 1 // Challenge 1
        scoreTitle = "WRONG!"
        scoreMessage = "That's the flag of \(countries[number])\nYour score is now: \(score)" // challenge 3
        
        withAnimation(Animation.interpolatingSpring(mass: 1, stiffness: 120, damping: 40, initialVelocity: 200)) {
            self.wrongRotationAmount[number] = 1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
