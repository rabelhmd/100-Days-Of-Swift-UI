//
//  CoffeeIntakeView.swift
//  BetterRest
//
//  Created by Rabel Ahmed on 25/03/2021.
//

import SwiftUI

struct CoffeeIntakeView: View {
    
    @Binding var coffeeAmount: Int
    
    var body: some View {
        // Challange 1
        Section(header: Text("Daily coffee intake").font(.headline)) {
            Stepper(value: $coffeeAmount, in: 1...20) {
                Text("\(amountText)")
            }
        }
    }
    
    var amountText: String {
        let amount = coffeeAmount == 1 ? "cup" : "cups"
        return "\(coffeeAmount) \(amount)"
    }
}

struct CoffeeIntakeView_Previews: PreviewProvider {
    
    @State static private var coffeeAmount = 2
    
    static var previews: some View {
        CoffeeIntakeView(coffeeAmount: $coffeeAmount)
    }
}
