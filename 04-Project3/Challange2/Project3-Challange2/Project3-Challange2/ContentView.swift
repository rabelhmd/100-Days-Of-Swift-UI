//
//  ContentView.swift
//  Project3-Challange2
//
//  Created by Rabel Ahmed on 24/03/2021.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    
    private let tipPercentages = [10, 15, 20, 25, 0]
    
    @State private var checkAmount = ""
    
    // challenge 3
    @State private var textNumberOfPeople = ""
    @State private var tipPercentage = 2
    
    // challenge 2
    private var grandTotal: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        
        return grandTotal
    }
    
    private var totalPerPerson: Double {
        let peopleCount = Double(textNumberOfPeople) ?? 1
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    
    var body: some View {
        
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
                    // challenge 3
                    TextField("Number of people", text: $textNumberOfPeople)
                        .keyboardType(.numberPad)
                }
                
                
                Section {
                    Text("How much tip do you want to leave?")

                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                // challenge 2
                
                Section(header: Text("Total amount")) {
                    // project 3 - challenge 2
                    Text("$\(grandTotal, specifier: "%.2f")")
                        .foregroundColor(tipPercentages[tipPercentage] == 0 ? .red : .primary)
                }
                
                // challenge 1
                Section(header: Text("Amount per person")) {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("WeSplit")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


