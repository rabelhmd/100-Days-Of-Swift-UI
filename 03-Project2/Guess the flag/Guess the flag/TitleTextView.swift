//
//  TitleTextView.swift
//  Guess the flag
//
//  Created by Rabel Ahmed on 16/03/2021.
//

import SwiftUI

struct TitleTextView: View {
    var body: some View {
        Text("Find the flag of")
            .foregroundColor(.white)
            .font(.headline)
            .autocapitalization(.allCharacters)
    }
}

struct TitleTextView_Previews: PreviewProvider {
    static var previews: some View {
        TitleTextView()
    }
}
