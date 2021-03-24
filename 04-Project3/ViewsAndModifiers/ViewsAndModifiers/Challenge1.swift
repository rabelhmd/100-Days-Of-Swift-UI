//
//  Challenge1.swift
//  ViewsAndModifiers
//
//  Created by Rabel Ahmed on 24/03/2021.
//

import SwiftUI

// challenge 1
struct LargeTitle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
    
}

// challenge 1
extension View {
    func largeTitle() -> some View {
        self.modifier(LargeTitle())
    }
}

struct Challenge1: View {
    var body: some View {
        Text("Custom View Modifiers")
            .largeTitle()
    }
}

struct Challenge1_Previews: PreviewProvider {
    static var previews: some View {
        Challenge1()
    }
}
