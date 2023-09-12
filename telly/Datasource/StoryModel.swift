//
//  StoryModel.swift
//  telly
//
//  Created by Heloisa Pereira Machado on 10/09/23.
//

import Foundation

struct StoryModel: Codable {
    var id = UUID()
    
    var title: String
    var date: String
}
