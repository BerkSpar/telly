//
//  EmojiManager.swift
//  duck
//
//  Created by Heloisa Pereira Machado on 29/08/23.
//

import Foundation
import SwiftUI

class ElementManager: ObservableObject {
    // Função para pegar elementos aleatoriamente
    static func getRandomElements(count: Int, theme: String, type: ElementType) -> [ElementModel] {
        var elements: [ElementModel] = []
        
        for element in Datasource.elements {
            if (element.theme.contains(theme) && element.type == type) {
                elements.append(element)
            }
        }
        
        var randomElements: [ElementModel] = []
        
        for _ in 0..<count {
            let randomElement = elements.remove(at: Int.random(in: 0..<elements.count))
            
            randomElements.append(randomElement)
        }
        
        return randomElements
    }
}
