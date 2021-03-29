//
//  GestureView.swift
//  05-Milestone-Project1-3
//
//  Created by Rabel Ahmed on 29/03/2021.
//

import SwiftUI

struct GestureView: View {
    var gesture: Gesture
    
    var body: some View {
        switch gesture {
        case .rock: return Text("✊")
        case .paper: return Text("✋")
        case .scissors: return Text("✌️")
        }
    }
}

struct GestureView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
