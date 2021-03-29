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
        
        Text("Daily coffee intake")
            .font(.headline)
        
        Stepper(value: $coffeeAmount, in: 1...20) {
            if coffeeAmount == 1 {
                Text("1 cup")
            } else {
                Text("\(coffeeAmount) cups")
            }
        }
    }
}

struct CoffeeIntakeView_Previews: PreviewProvider {
    
    @State static private var coffeeAmount = 2
    
    static var previews: some View {
        CoffeeIntakeView(coffeeAmount: $coffeeAmount)
    }
}
