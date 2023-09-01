//
//  Color+Ext.swift
//  telly
//
//  Created by Felipe Passos on 24/08/23.
//

import SwiftUI

extension Color {
    static let myPurple = Color("purple")
    static let myGreen = Color("green")
    static let myDarkBlue = Color("dark_blue")
    static let myReddish = Color("reddish")
    static let myBackground = Color("background")
    static let myGrey = Color("grey")
    
    init(hex: Int, opacity: Double = 1.0) {
        let red = Double((hex & 0xff0000) >> 16) / 255.0
        let green = Double((hex & 0xff00) >> 8) / 255.0
        let blue = Double((hex & 0xff) >> 0) / 255.0
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
}
