//
//  tellyApp.swift
//  telly
//
//  Created by Felipe Passos on 24/08/23.
//

import SwiftUI

@main
struct tellyApp: App {
    init() {
            for family in UIFont.familyNames {
                print("\(family)")
                for font in UIFont.fontNames(forFamilyName: family) {
                    print(" \(font)")
                }
            }
        }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
