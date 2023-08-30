//
//  AVAudioSession+Ext.swift
//  telly
//
//  Created by Felipe Passos on 25/08/23.
//

import AVFoundation

extension AVAudioSession {
    func hasPermissionToRecord() async -> Bool {
        await withCheckedContinuation { continuation in
            requestRecordPermission { authorized in
                continuation.resume(returning: authorized)
            }
        }
    }
}
