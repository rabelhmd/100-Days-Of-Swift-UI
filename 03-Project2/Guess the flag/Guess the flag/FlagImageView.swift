//
//  FlagImageView.swift
//  Guess the flag
//
//  Created by Rabel Ahmed on 16/03/2021.
//

import SwiftUI

struct FlagImageView: View {
    let imageName: String
    
    var body: some View {
        Image(imageName)
            .renderingMode(.original)
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color.white, lineWidth: 5))
            .shadow(color: .gray, radius: 25)
    }
}

struct FlagImageView_Previews: PreviewProvider {
    static var previews: some View {
        FlagImageView(imageName: "US")
    }
}
