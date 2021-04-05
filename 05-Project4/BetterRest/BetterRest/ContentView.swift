//
//  ContentView.swift
//  BetterRest
//
//  Created by Rabel Ahmed on 25/03/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date()
    }
    
    var body: some View {
        NavigationView {
            
            Form {
                
                DatePickerView(wakeUp: $wakeUp)
                
                SleepAmountView(sleepAmount: $sleepAmount)
                
                CoffeeIntakeView(coffeeAmount: $coffeeAmount)
                
                BedTimeView(bedTime: calculateBedtime)
            }
            .navigationTitle("BetterRest")
        }
    }
    
    // Challange 3
    var calculateBedtime: String {
        
        let model = SleepCalculator()
        
        let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
        let hour = (components.hour ?? 0) * 60 * 60
        let minute = (components.minute ?? 0) * 60
        
        var message: String
        do {
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            let sleepTime = wakeUp - prediction.actualSleep
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            message = formatter.string(from: sleepTime)
        } catch {
            message = "Error, there was a problem calculating bedtime."
        }
        return message
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
