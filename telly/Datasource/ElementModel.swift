//
//  File.swift
//  telly
//
//  Created by Felipe Passos on 30/08/23.
//

import Foundation

enum ElementType {
    case nouns
    case verbs
    case characters
}

struct ElementModel: Identifiable, Hashable {
    var id = UUID()
    
    var icon: String
    var words: [String]
    var type: ElementType
    var theme: [String]

}
