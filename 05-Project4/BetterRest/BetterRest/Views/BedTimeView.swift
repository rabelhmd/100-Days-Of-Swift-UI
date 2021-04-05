//
//  BedTimeView.swift
//  BetterRest
//
//  Created by Rabel Ahmed on 05/04/2021.
//

import SwiftUI

struct BedTimeView: View {
    
    let bedTime: String
    
    var body: some View {
        Section(header: Text("Recommended bed time").font(.headline)) {
            Text("\(bedTime)")
        }
    }
}

struct BedTimeView_Previews: PreviewProvider {
    static var previews: some View {
        BedTimeView(bedTime: "Bed Time View")
    }
}
