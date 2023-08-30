//
//  Color+Ext.swift
//  telly
//
//  Created by Felipe Passos on 24/08/23.
//

import SwiftUI

extension Color {
    static let myYellow = Color("yellow")
    static let myRed = Color("red")
    static let myBlue = Color("blue")
    static let myPurple = Color("purple")
    static let myGreen = Color("green")
    
    init(hex: Int, opacity: Double = 1.0) {
        let red = Double((hex & 0xff0000) >> 16) / 255.0
        let green = Double((hex & 0xff00) >> 8) / 255.0
        let blue = Double((hex & 0xff) >> 0) / 255.0
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
}
