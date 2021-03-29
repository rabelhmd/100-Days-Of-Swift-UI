//
//  RockPaperScissors.swift
//  05-Milestone-Project1-3
//
//  Created by Rabel Ahmed on 29/03/2021.
//

import SwiftUI

struct RockPaperScissors {
    
    var gesture: Gesture = Gesture.allCases.randomElement()!
    var goal: Goal = Goal.allCases.randomElement()!
    
    func isCorrect(guess: Gesture) -> Bool {
        switch goal {
        case .win: return isWinner(guess, over: gesture)
        case .lose: return isWinner(gesture, over: guess)
        }
    }
    
    private func isWinner(_ shouldWin: Gesture, over shouldLose: Gesture) -> Bool {
        switch shouldWin {
        case .rock: return shouldLose == .scissors
        case .paper: return shouldLose == .rock
        case .scissors: return shouldLose == .paper
        }
    }
}
