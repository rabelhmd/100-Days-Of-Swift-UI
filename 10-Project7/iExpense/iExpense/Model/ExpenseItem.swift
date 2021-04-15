//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Rabel Ahmed on 15/04/2021.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Int
}
