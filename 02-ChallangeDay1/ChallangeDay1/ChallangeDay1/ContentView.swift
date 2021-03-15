//
//  ContentView.swift
//  ChallangeDay1
//
//  Created by Rabel Ahmed on 15/03/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var value = "0"

    @State private var unitTypeIndex = 0

    @State private var sourceNamedUnitIndexes = Array(repeating: 0, count: UnitTypes.types.count)
    
    @State private var destinationNamedUnitIndexes = Array(repeating: 0, count: UnitTypes.types.count)
    
    private var unitTypes: [UnitType.Type] {
        return UnitTypes.types
    }
    
    private var namedUnits: [NamedUnit] {
        return unitTypes[unitTypeIndex].units
    }
    
    private var sourceNamedUnit: NamedUnit {
        let selectedSourceIndex = sourceNamedUnitIndexes[unitTypeIndex]
        return namedUnits[selectedSourceIndex]
    }
    
    private var destinationNamedUnit: NamedUnit {
        let selectedDestinationIndex = destinationNamedUnitIndexes[unitTypeIndex]
        return namedUnits[selectedDestinationIndex]
    }
    
    
    private var result: Double {
        let source = Measurement(value: Double(value) ?? 0, unit: sourceNamedUnit.unit)
        return source.converted(to: destinationNamedUnit.unit).value
    }
    
    var body: some View {
        
        NavigationView {
            
            Form {
                
                Section() {
                    
                    Picker("Unit", selection: $unitTypeIndex) {
                        
                        ForEach(0 ..< unitTypes.count, id: \.self) {
                            Text("\(self.unitTypes[$0].name)")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section() {
                    
                    HStack {
                        TextField("Value", text: $value)
                            .keyboardType(.decimalPad)
                        Spacer()
                        Text(sourceNamedUnit.name)
                    }
                    
                    Picker("in", selection: $sourceNamedUnitIndexes[unitTypeIndex]) {
                        ForEach(0 ..< namedUnits.count, id: \.self) { index in
                            Text(self.namedUnits[index].unit.symbol)
                        }
                    }
                    .id(unitTypeIndex)
                    .pickerStyle(SegmentedPickerStyle())
                    
                }
                
                Section(header: Text("=")) {
                    
                    HStack {
                        Text(format(number: result))
                        Spacer()
                        Text(destinationNamedUnit.name)
                    }
                    
                    Picker("in", selection: $destinationNamedUnitIndexes[unitTypeIndex]) {
                        ForEach(0 ..< namedUnits.count, id: \.self) { index in
                            Text(self.namedUnits[index].unit.symbol)
                        }
                    }
                    .id(unitTypeIndex)
                    .pickerStyle(SegmentedPickerStyle())
                }
                
            }
            .navigationBarTitle("Converter")
        }
        .modifier(DismissingKeyboard())
    }
    
    /// Format a number with up to 5 digits after the decimal point
    func format(number: Double) -> String {
        // better than %.5f specifier because it removes trailing zeros
        let formatter = NumberFormatter()
        let nsnumber = NSNumber(value: number)
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 5
        return String(formatter.string(from: nsnumber) ?? "")
    }
}
