//
//  DismissingKeyboard.swift
//  ChallangeDay1
//
//  Created by Rabel Ahmed on 15/03/2021.
//

import SwiftUI

/// Dismiss keyboard by a double tap outside the keyboard
struct DismissingKeyboard: ViewModifier {
    func body(content: Content) -> some View {
        // note: using a single tap breaks the Pickers
        content.onTapGesture(count: 2) {
            let keyWindow = UIApplication.shared.connectedScenes
                .filter({$0.activationState == .foregroundActive})
                .map({$0 as? UIWindowScene})
                .compactMap({$0})
                .first?.windows
                .filter({$0.isKeyWindow}).first
            keyWindow?.endEditing(true)
        }
    }
}
