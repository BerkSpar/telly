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
    
    func rewardAchievement(_ identifier: String) {
        let achievement = GKAchievement(identifier: identifier)
        achievement.percentComplete = 100
        achievement.showsCompletionBanner = true
        
        GKAchievement.report([achievement])
    }
    
    func resetAchievements() {
        GKAchievement.resetAchievements()
    }
    
    func hideAccessPoint() {
        GKAccessPoint.shared.isActive = false
    }
    
    func showAccessPoint() {
        GKAccessPoint.shared.isActive = true
    }
}
