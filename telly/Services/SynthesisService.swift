//
//  SynthesisService.swift
//  telly
//
//  Created by Felipe Passos on 14/09/23.
//

import Foundation
import Speech

class SynthesisService {
    private let synthesizer = AVSpeechSynthesizer()
    
    public func speak(_ text: String) {
        let utterance = AVSpeechUtterance(string: text)
        
         utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        
        synthesizer.speak(utterance)
    }
}
