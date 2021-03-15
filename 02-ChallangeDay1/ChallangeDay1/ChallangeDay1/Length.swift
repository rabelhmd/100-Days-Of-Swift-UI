//
//  Length.swift
//  ChallangeDay1
//
//  Created by Rabel Ahmed on 15/03/2021.
//

import Foundation


struct Length: UnitType {
    static var name = "Length"
    
    private static let meters = NamedUnit(name: "Meters", unit: UnitLength.meters)
    private static let kilometers = NamedUnit(name: "Kilometers", unit: UnitLength.kilometers)
    private static let feet = NamedUnit(name: "Feet", unit: UnitLength.feet)
    private static let yards = NamedUnit(name: "Yards", unit: UnitLength.yards)
    private static let miles = NamedUnit(name: "Miles", unit: UnitLength.miles)
    
    static let units = [meters, kilometers, feet, yards, miles]
}
