//
//  Color.swift
//  Crypto(swiftUI2)
//
//  Created by Drum, Jesse on 5/2/22.
//

import Foundation
import SwiftUI

extension Color {
    
    static let theme = ColorTheme()
    
}

struct ColorTheme {
    let accent = Color("AccentColor")
    let background = Color("BackGroundColor")
    let green = Color("GreenColor")
    let red = Color("RedColor")
    
    let secondaryText = Color("SecondaryTextColor")
}
