//
//  SpeechAuthView.swift
//  duck
//
//  Created by Felipe Passos on 29/08/23.
//

import SwiftUI
import Speech

struct AuthorizationView: View {
    let completion: () -> Void
    
    func isAudioDenied() -> Bool {
        return AVAudioSession.sharedInstance().recordPermission == .denied
    }
    
    func isSpeechDenied() -> Bool {
        return SFSpeechRecognizer.authorizationStatus() == .denied
    }
    
    var body: some View {
        VStack {
            if isSpeechDenied() {
                Text("Você se recusou para reconhecer a sua voz. Ative nas suas configurações para continuar.")
            } else {
                Text("Precisamos da sua autorização para reconhecer a sua voz")
            }
            
            if isAudioDenied() {
                Text("Você se recusou para escutar seu áudio. Ative nas suas configurações para continuar.")
            } else {
                Text("Precisamos da sua autorização de audio")
            }
            
            
            Button("Autorizar") {
                Task {
                    guard await SFSpeechRecognizer.hasAuthorizationToRecognize() else {
                        return
                    }
                    
                    guard await AVAudioSession.sharedInstance().hasPermissionToRecord() else {
                        return
                    }
                    
                    completion()
                }
            }
        }
    }
}

struct AuthorizationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorizationView(completion: {})
    }
}
