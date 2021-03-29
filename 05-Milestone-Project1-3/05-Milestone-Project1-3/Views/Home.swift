//
//  Home.swift
//  05-Milestone-Project1-3
//
//  Created by Rabel Ahmed on 29/03/2021.
//

import SwiftUI

struct Home: View {
    
    @State private var game = RockPaperScissors()
    @State private var score = 0
    
    static private let maxTime = 5.0
    @State private var remainingTime = Home.maxTime
    
    @State private var gameMode: Mode = .normal
    
    private static var timer = Timer.publish(every: 1, on: .current, in: .common).autoconnect()
    
    var body: some View {
        
        VStack {
            
            Button(action: {
                self.changeGameMode()
                self.newQuestion()
            }, label: {
                Text(gameMode == .normal ? "Untimed game" : "Timed game, remaining \(remainingTime, specifier: "%0.0f")s")
                    .padding()
            })
            .onReceive(Home.timer, perform: { _ in
                self.updateTime()
            })
            
            GestureView(gesture: game.gesture)
                .font(Font.system(size: 100))
            
            GoalView(goal: game.goal)
                .padding(.top)
            
            HStack {
                
                ForEach(Gesture.allCases, id: \.self) { gesture in
                    
                    Button(action: {
                        self.submitAnswer(withGuess: gesture)
                    }, label: {
                        GestureView(gesture: gesture)
                            .font(Font.system(size: 50))
                            .padding()
                    })
                    
                }
            }
            
            HStack {
                Text("Score")
                Text(String(score))
                    .font(.largeTitle)
            }
        }
    }
    
    private func updateTime() {
        if gameMode == .timed {
            remainingTime -= 1
            if remainingTime <= 0 {
                updateScore(withWin: false)
            }
        }
    }
    
    private func submitAnswer(withGuess guess: Gesture) {
        let win = self.game.isCorrect(guess: guess)
        updateScore(withWin: win)
    }
    
    private func updateScore(withWin win: Bool) {
        score += win ? 1 : -1
        newQuestion()
    }
    
    private func newQuestion() {
        game = RockPaperScissors()
        remainingTime = Home.maxTime
    }
    
    private func changeGameMode() {
        self.gameMode = (self.gameMode == .normal ? .timed : .normal)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
