//
//  WordErrorModel.swift
//  WordScramble
//
//  Created by Rabel Ahmed on 31/03/2021.
//

import SwiftUI

struct WordErrorModel {
    var title: String
    var message: String
    var showError: Bool
    
    init(_ title: String, _ message: String, _ showError: Bool) {
        self.title = title
        self.message = message
        self.showError = showError
    }
    
    init() {
        self.title = ""
        self.message = ""
        self.showError = false
    }
}
