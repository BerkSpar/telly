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
        
        utterance.voice = AVSpeechSynthesisVoice(language: LocaleService.shared.gameLocale)
        
        // Configure the audio session for playback
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.playback, mode: .default, options: [])
            try audioSession.setActive(true)
        } catch {
            print("Failed to set up audio session: \(error.localizedDescription)")
            return
        }
        
        synthesizer.speak(utterance)
    }
}
