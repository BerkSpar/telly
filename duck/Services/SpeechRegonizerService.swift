//
//  SpeechRegonizerService.swift
//  duck
//
//  Created by Felipe Passos on 24/08/23.
//

import Foundation
import AVFoundation
import Speech
import SwiftUI

class SpeechRecognizerService: ObservableObject {
    @Published var text = ""
    
    private let speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "en_US"))!

    private var speechRecognitionRequest:
        SFSpeechAudioBufferRecognitionRequest?
    private var speechRecognitionTask: SFSpeechRecognitionTask?
    private let audioEngine = AVAudioEngine()
    
    func parseText(_ text: String) -> String {
        let datasource = [
            "🍎": ["apple", "apples"],
            "🚶‍♂️": ["walk", "walking", "walked"],
            "🌲": ["tree", "trees", "forest"],
            "🐶": ["dog", "dogs", "puppy", "puppies"],
            "📚": ["book", "books", "read", "reading"],
            "🚗": ["car", "cars", "drive", "driving"],
            "🖋": ["pen", "pens", "write", "writing"],
            "🎵": ["music", "song", "songs", "melody"],
            "🖥": ["computer", "computers", "desktop", "laptop"],
            "🏠": ["house", "houses", "home", "homes"],
            "🏖": ["beach", "beaches", "coast", "shore"],
            "🎂": ["cake", "cakes", "birthday cake"],
            "🎉": ["party", "celebration", "festive"],
            "🌦": ["weather", "rain", "cloudy", "showers"],
            "🚀": ["rocket", "rockets", "spacecraft", "launch"]
        ]

        
        var modifiedText = text
        
        for (emoji, words) in datasource {
            // Sort words by length in descending order
            let sortedWords = words.sorted(by: { $0.count > $1.count })
            for word in sortedWords {
                modifiedText = modifiedText.replacingOccurrences(of: word, with: emoji, options: .caseInsensitive, range: nil)
            }
        }
        
        return modifiedText
    }

    
    func recognize() throws {
        if let recognitionTask = speechRecognitionTask {
            recognitionTask.cancel()
            self.speechRecognitionTask = nil
        }

        let audioSession = AVAudioSession.sharedInstance()
        try audioSession.setCategory(.record, mode: .voicePrompt)

        speechRecognitionRequest = SFSpeechAudioBufferRecognitionRequest()

        guard let recognitionRequest = speechRecognitionRequest else {
          fatalError(
        "SFSpeechAudioBufferRecognitionRequest object creation failed") }

        let inputNode = audioEngine.inputNode

        recognitionRequest.shouldReportPartialResults = true

        speechRecognitionTask = speechRecognizer.recognitionTask(
            with: recognitionRequest) { result, error in

            var finished = false

            if let result = result {
                 self.text = result.bestTranscription.formattedString
                self.text = self.parseText(self.text)
                finished = result.isFinal
            }

            if error != nil || finished {
                self.audioEngine.stop()
                inputNode.removeTap(onBus: 0)

                self.speechRecognitionRequest = nil
                self.speechRecognitionTask = nil
            }
        }

        let recordingFormat = inputNode.outputFormat(forBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) {
         (buffer: AVAudioPCMBuffer, when: AVAudioTime) in
            self.speechRecognitionRequest?.append(buffer)
        }

        audioEngine.prepare()
        try audioEngine.start()
    }
}
