//
//  ConditionalModifiers.swift
//  ViewsAndModifiers
//
//  Created by Rabel Ahmed on 24/03/2021.
//

import SwiftUI

struct ConditionalModifiers: View {
    
    @State private var useRedText = false
    
    var body: some View {
        Button("Hello, World!") {
            self.useRedText.toggle()
        }
        .foregroundColor(useRedText ? .red : .blue)
    }
}

// not allowed because 2 views returned are of different types
//struct IncorrectView: View {
//    
//    @State private var useRedText = false
//    
//    var body: some View {
//        
//        if self.useRedText {
//            return Text("Hello World")
//        } else {
//            return Text("Hello World")
//                .background(Color.red)
//        }
//    }
//}

struct ConditionalModifiers_Previews: PreviewProvider {
    static var previews: some View {
        ConditionalModifiers()
    }
}
