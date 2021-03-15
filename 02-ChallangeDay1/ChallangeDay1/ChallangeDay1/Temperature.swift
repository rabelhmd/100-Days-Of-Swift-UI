//
//  Temperature.swift
//  ChallangeDay1
//
//  Created by Rabel Ahmed on 15/03/2021.
//

import Foundation


struct Temperature: UnitType {
    
    static var name = "Temperature"
    
    private static let celsius = NamedUnit(name: "Celsius", unit: UnitTemperature.celsius)
    private static let farenheit = NamedUnit(name: "Farenheit", unit: UnitTemperature.fahrenheit)
    private static let kelvin = NamedUnit(name: "Kelvin", unit: UnitTemperature.kelvin)
    
    static var units = [celsius, farenheit, kelvin]
}
