//
//  WordsView.swift
//  duck
//
//  Created by Heloisa Pereira Machado on 28/08/23.
//

import SwiftUI
import Speech

struct WordsView: View {
    func verifyAuthentication(_ completion: @escaping () -> Void) {
        if (SFSpeechRecognizer.authorizationStatus() != .authorized || AVAudioSession.sharedInstance().recordPermission != .granted) {
            RouterService.shared.navigate(.authorization(completion: completion))
            return;
        }
        
        completion()
    }
    
    var body: some View {
        VStack {
            Text("Selecione as palavras")
            
            Button("Pronto") {
                verifyAuthentication {
                    RouterService.shared.navigate(.game)
                }
            }
        }
    }
}

struct WordsView_Previews: PreviewProvider {
    static var previews: some View {
        WordsView()
    }
}
