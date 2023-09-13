//
//  StoryModel.swift
//  telly
//
//  Created by Heloisa Pereira Machado on 10/09/23.
//

import Foundation

struct StoryModel: Codable {
    var id = UUID().uuidString
    
    var title: String = ""
    var date: String = ""
    var theme: String = ""
    var words: [String] = []
}
