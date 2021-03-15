//
//  UnitType.swift
//  ChallangeDay1
//
//  Created by Rabel Ahmed on 15/03/2021.
//

import Foundation

protocol UnitType {
    static var name: String { get }
    static var units: [NamedUnit] { get }
}

/// List of unit types supported in this application
struct UnitTypes {
    static let types: [UnitType.Type] = [Temperature.self, Length.self, Time.self, Volume.self]
}

