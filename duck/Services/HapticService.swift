//
//  HapticService.swift
//  duck
//
//  Created by Felipe Passos on 24/08/23.
//

import UIKit

class HapticsService {
    static let shared = HapticsService()
    
    private init() {}

    func play(_ feedbackStyle: UIImpactFeedbackGenerator.FeedbackStyle) {
        UIImpactFeedbackGenerator(style: feedbackStyle).impactOccurred()
    }
    
    func notify(_ feedbackType: UINotificationFeedbackGenerator.FeedbackType) {
        UINotificationFeedbackGenerator().notificationOccurred(feedbackType)
    }
}
