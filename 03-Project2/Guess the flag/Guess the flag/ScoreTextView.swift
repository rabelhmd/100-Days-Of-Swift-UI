//
//  ScoreTextView.swift
//  Guess the flag
//
//  Created by Rabel Ahmed on 16/03/2021.
//

import SwiftUI

struct ScoreTextView: View {
    let score: Int
    
    var body: some View {
        Text("SCORE: \(score)")
            .foregroundColor(.white)
            .font(.headline)
    }
}

struct ScoreTextView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreTextView(score: 0)
    }
}
