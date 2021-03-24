//
//  BehindTheMainSwiftView.swift
//  ViewsAndModifiers
//
//  Created by Rabel Ahmed on 24/03/2021.
//

import SwiftUI

struct BehindTheMainSwiftView: View {
    
    var body: some View {
        Text("Hello, World!")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.red)
            .edgesIgnoringSafeArea(.all)
    }
}

struct BehindTheMainSwiftView_Previews: PreviewProvider {
    static var previews: some View {
        BehindTheMainSwiftView()
    }
}
