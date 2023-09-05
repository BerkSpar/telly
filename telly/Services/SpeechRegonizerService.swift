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

/// A service responsible for speech recognition and converting spoken words into text,
/// subsequently replacing specific words with emojis.
///
/// This class leverages Apple's `Speech` framework to recognize speech and convert it to text.
/// Additionally, it uses a predefined dictionary to replace recognized words with related emojis.
class SpeechRecognizerService {
    private let speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "en_US"))!

    private var speechRecognitionRequest:
        SFSpeechAudioBufferRecognitionRequest?
    private var speechRecognitionTask: SFSpeechRecognitionTask?
    private let audioEngine = AVAudioEngine()

    /// Starts the speech recognition process.
    ///
    /// This method initializes and starts the speech recognition process, listens for the user's speech,
    /// and converts it to text. It also updates the recognized text with the emoji conversion.
    /// Throws an error if there are issues starting the `audioEngine`.
    func recognize(callback: @escaping (_ text: String) -> Void) throws {
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
                callback(result.bestTranscription.formattedString)
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
