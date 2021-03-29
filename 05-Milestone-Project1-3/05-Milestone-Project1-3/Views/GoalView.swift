//
//  GoalView.swift
//  05-Milestone-Project1-3
//
//  Created by Rabel Ahmed on 29/03/2021.
//

import SwiftUI

struct GoalView: View {
    var goal: Goal
    
    var body: some View {
        
        HStack {
            
            Text("How to")
            
            if goal == .win {
                Text("Win")
                    .foregroundColor(.green)
            } else {
                Text("Lose")
                    .foregroundColor(.red)
            }
            Text("this game?")
        }
    }
}

struct GoalView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
