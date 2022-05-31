//
//  UIApplication.swift
//  Crypto(swiftUI2)
//
//  Created by Drum, Jesse on 5/25/22.
//

import Foundation
import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
