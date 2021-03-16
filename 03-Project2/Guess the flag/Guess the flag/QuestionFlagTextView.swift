//
//  QuestionFlagTextView.swift
//  Guess the flag
//
//  Created by Rabel Ahmed on 16/03/2021.
//

import SwiftUI

struct QuestionFlagTextView: View {
    let question: String
    var body: some View {
        Text(question)
            .foregroundColor(.white)
            .font(.largeTitle)
            .fontWeight(.black)
    }
}

struct QuestionFlagTextView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionFlagTextView(question: "Germany")
    }
}
