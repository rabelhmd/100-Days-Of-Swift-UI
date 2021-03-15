//
//  Time.swift
//  ChallangeDay1
//
//  Created by Rabel Ahmed on 15/03/2021.
//

import Foundation

struct Time: UnitType {
    static var name = "Time"
    
    private static let seconds = NamedUnit(name: "Seconds", unit: UnitDuration.seconds)
    private static let minutes = NamedUnit(name: "Minutes", unit: UnitDuration.minutes)
    private static let hours = NamedUnit(name: "Hours", unit: UnitDuration.hours)
    
    static let units = [seconds, minutes, hours]
}
