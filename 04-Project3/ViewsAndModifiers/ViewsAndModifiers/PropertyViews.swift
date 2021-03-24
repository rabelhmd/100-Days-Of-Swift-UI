//
//  PropertyViews.swift
//  ViewsAndModifiers
//
//  Created by Rabel Ahmed on 24/03/2021.
//

import SwiftUI

struct PropertyViews: View {
    
    let motto1 = Text("Draco dormiens")
    let motto2 = Text("nunquam titillandus")
    
    // or
    //var motto1: some View { Text("Draco dormiens") }
    //var motto2: some View { Text("nunquam titillandus") }
    
    var body: some View {
        VStack {
            motto1
                .foregroundColor(.red)
            motto2
                .foregroundColor(.blue)
        }
    }
}

struct PropertyViews_Previews: PreviewProvider {
    static var previews: some View {
        PropertyViews()
    }
}
