//
//  GameService.swift
//  duck
//
//  Created by Felipe Passos on 27/08/23.
//

import Foundation
import GameKit

class GameService {
    static let shared = GameService()
    
    let player = GKLocalPlayer.local
    
    func authenticate() {
        player.authenticateHandler = { vc, error in
            guard error == nil else {
                print(error?.localizedDescription ?? "")
                return
            }
            
            GKAccessPoint.shared.location = .bottomLeading
            GKAccessPoint.shared.isActive = self.player.isAuthenticated
        }
    }
    
    func hideAccessPoint() {
        GKAccessPoint.shared.isActive = false
    }
    
    func showAccessPoint() {
        GKAccessPoint.shared.isActive = true
    }
}
