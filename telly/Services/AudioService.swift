//
//  AudioService.swift
//  telly
//
//  Created by Felipe Passos on 11/09/23.
//

import Foundation
import AVFoundation

class AudioService {
    private var audioPlayer: AVAudioPlayer?
    
    init() { }
    
    func playAudio(withPath path: String) {
        guard let url = URL(string: path) else {
            print("Invalid path provided.")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("Failed to initialize audio player with error: \(error.localizedDescription)")
        }
    }
    
    func pauseAudio() {
        audioPlayer?.pause()
    }
    
    func stopAudio() {
        audioPlayer?.stop()
    }
}
