//
//  SFSpeechRecognizer+Ext.swift
//  duck
//
//  Created by Felipe Passos on 25/08/23.
//

import Speech

extension SFSpeechRecognizer {
    static func hasAuthorizationToRecognize() async -> Bool {
        await withCheckedContinuation { continuation in
            requestAuthorization { status in
                continuation.resume(returning: status == .authorized)
            }
        }
    }
}
