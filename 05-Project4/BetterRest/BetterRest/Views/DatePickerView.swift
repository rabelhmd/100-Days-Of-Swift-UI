//
//  DatePickerView.swift
//  BetterRest
//
//  Created by Rabel Ahmed on 25/03/2021.
//

import SwiftUI

struct DatePickerView: View {
    
    @Binding var wakeUp: Date
    
    var body: some View {
        // Challange 1
        Section(header: Text("When do you want to wake up?").font(.headline)) {
            DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                .labelsHidden()
                .datePickerStyle(WheelDatePickerStyle())
        }
    }
}

struct DatePickerView_Previews: PreviewProvider {
    
    @State static private var wakeUp = Date()
    
    static var previews: some View {
        DatePickerView(wakeUp: $wakeUp)
    }
}
