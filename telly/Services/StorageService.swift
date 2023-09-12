//
//  StorageService.swift
//  telly
//
//  Created by Felipe Passos on 24/08/23.
//

import Foundation
import SwiftUI

struct StorageService {
    static let shared = StorageService()
    
    private let storageKey = "stories"
    
    // Save a new story
    func add(story: StoryModel) {
        var currentStories = listAll()
        currentStories.append(story)
        
        if let encoded = try? JSONEncoder().encode(currentStories) {
            UserDefaults.standard.set(encoded, forKey: storageKey)
        }
    }
    
    // List all saved stories
    func listAll() -> [StoryModel] {
        if let savedData = UserDefaults.standard.data(forKey: storageKey),
           let decodedStories = try? JSONDecoder().decode([StoryModel].self, from: savedData) {
            return decodedStories
        }
        return []
    }
}
