//
//  LocaleService.swift
//  telly
//
//  Created by Felipe Passos on 19/09/23.
//

import Foundation

class LocaleService: ObservableObject {
    static let shared = LocaleService()
    
    var systemLocale: String = "en-US"
    var gameLocale: String = "en"
}
