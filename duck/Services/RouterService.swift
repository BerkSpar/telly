//
//  RouterService.swift
//  duck
//
//  Created by Felipe Passos on 24/08/23.
//

import Foundation
import SwiftUI

class RouterService: ObservableObject {
    static var shared = RouterService()
    
    @Published var screen: Screen = .onboarding
    @Published var isAlertPresented: Bool = false
    @Published var alert: Alert = Alert(title: Text(""))
    
    func showAlert(_ alert: Alert) {
        self.alert = alert
        isAlertPresented = true
    }
    
    func navigate(_ screen: Screen) {
        self.screen = screen
    }
}
