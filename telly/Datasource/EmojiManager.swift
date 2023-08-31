//
//  EmojiManager.swift
//  duck
//
//  Created by Heloisa Pereira Machado on 29/08/23.
//

import Foundation
import SwiftUI

class EmojiManager: ObservableObject {
    
    func check(text: String, element: ElementModel) -> String {
        for word in element.words {
            if text.contains(word) {
                return "✅"
            }
        }
        
        return ""
    }
    
    // Função para pegar emojis aleatoriamente
    static func getRandomEmojis(count: Int) -> [ElementModel] {
        var elements: [ElementModel] = []
        
        for element in Datasource.elements {
            if (element.theme.contains("work")) {
                elements.append(element)
            }
        }
        
        var randomEmojis: [ElementModel] = []
        
        for _ in 0..<count {
//            if  {
//                randomEmojis.append(randomEmoji)
//            }
            
            let randomEmoji = elements.remove(at: Int.random(in: 0..<elements.count))
            
            randomEmojis.append(randomEmoji)
        }
        
        return randomEmojis
    }
}
