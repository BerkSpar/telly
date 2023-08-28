//
//  GameService.swift
//  duck
//
//  Created by Felipe Passos on 27/08/23.
//

import Foundation
import GameKit

/// A service responsible for managing Game Center functionalities such as player authentication,
/// rewarding achievements, and controlling the access point's visibility.
///
/// This class provides a centralized way to interact with Game Center functionalities and
/// manage the Game Center experience for the user.
class GameService {
    
    /// The shared singleton instance of `GameService`.
    static let shared = GameService()
    
    /// Represents the local player instance from GameKit, which will be used for authentication.
    let player = GKLocalPlayer.local
    
    /// Authenticates the local player with Game Center.
    ///
    /// This function checks if the player is authenticated and updates the location and activity status of the
    /// Game Center's access point. If there's an error during the authentication process, it's printed.
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
    
    /// Rewards an achievement to the player based on the provided identifier.
    ///
    /// The achievement will be marked as 100% complete and will display a completion banner.
    ///
    /// - Parameter identifier: The unique identifier of the achievement to be rewarded.
    func rewardAchievement(_ identifier: String) {
        let achievement = GKAchievement(identifier: identifier)
        achievement.percentComplete = 100
        achievement.showsCompletionBanner = true
        
        GKAchievement.report([achievement])
    }
    
    /// Resets all the achievements for the player.
    ///
    /// This function will reset all achievements back to their initial, unearned state.
    func resetAchievements() {
        GKAchievement.resetAchievements()
    }
    
    /// Hides the Game Center access point.
    ///
    /// This function deactivates the Game Center access point, making it hidden.
    func hideAccessPoint() {
        GKAccessPoint.shared.isActive = false
    }
    
    /// Shows the Game Center access point.
    ///
    /// This function activates the Game Center access point, making it visible.
    func showAccessPoint() {
        GKAccessPoint.shared.isActive = true
    }
}

