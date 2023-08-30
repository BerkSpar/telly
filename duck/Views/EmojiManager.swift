//
//  EmojiManager.swift
//  duck
//
//  Created by Heloisa Pereira Machado on 29/08/23.
//

import Foundation
import SwiftUI

class EmojiManager: ObservableObject {
    
    func check(text: String, emoji: String) -> String {
        if text.contains(emoji) {
            return "✅"
        } else {
            return ""
        }
            
    }
    
    // Função para pegar emojis aleatoriamente
    static func getRandomEmojis(count: Int) -> [String] {
        var randomEmojis: [String] = []
        
        for _ in 0..<count {
            if let randomEmoji = emojis.randomElement() {
                randomEmojis.append(randomEmoji)
            }
        }
        
        return randomEmojis
    }
    
    static let emojis = Array(Datasource.words.keys) // Lista de emojis disponíveis
}
