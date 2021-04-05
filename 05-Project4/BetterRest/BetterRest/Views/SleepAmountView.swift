//
//  SleepAmountView.swift
//  BetterRest
//
//  Created by Rabel Ahmed on 25/03/2021.
//

import SwiftUI

struct SleepAmountView: View {
    
    @Binding var sleepAmount: Double
    
    var body: some View {
        // Challange 1
        Section(header: Text("Desired amount of sleep").font(.headline)) {
            Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
                Text("\(sleepAmount, specifier: "%g") hours")
            }
        }
    }
}

struct SleepAmountView_Previews: PreviewProvider {
    
    @State static private var sleepAmount = 8000.0
    
    static var previews: some View {
        SleepAmountView(sleepAmount: $sleepAmount)
    }
}
