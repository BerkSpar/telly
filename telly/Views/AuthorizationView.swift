//
//  SpeechAuthView.swift
//  telly
//
//  Created by Felipe Passos on 29/08/23.
//

import SwiftUI
import Speech

struct AuthorizationView: View {
    
    @State var title: LocalizedStringKey = "To play the game you must enable your microphone"
    @State var icon = "microphone_authorization"
    @State var bodyText: LocalizedStringKey = "That's because we will identify if you are pronouncing the words"
    @State var buttonText: LocalizedStringKey = "Ok, I understand"
    
    let completion: () -> Void
    
    func isAudioDenied() -> Bool {
        return AVAudioSession.sharedInstance().recordPermission == .denied
    }
    
    func isSpeechDenied() -> Bool {
        return SFSpeechRecognizer.authorizationStatus() == .denied
    }
    
    var body: some View {
        VStack(spacing: 24) {
            
            Spacer()
            
            Authorization(titleVoice: title, titleSound: "", icon: icon, bodyText: bodyText)
            
            ElevatedButton(
                backgroundColor: .darkBlue,
                textColor: .background,
                text: buttonText, isDisabled: false,
                action: {
                    HapticsService.shared.play(.heavy)
                    
                    Task {
                        guard await SFSpeechRecognizer.hasAuthorizationToRecognize() else {
                            return
                        }
                        
                        guard await AVAudioSession.sharedInstance().hasPermissionToRecord() else {
                            return
                        }
                        
                        HapticsService.shared.notify(.success)
                        
                        completion()
                    }
                }
            )
            .padding(.horizontal, 24)
            
            if isSpeechDenied() {
                Text("You must enable your microphone")
                    .onAppear {
                        self.title = "You must enable your microphone"}
                Text("You haven't given us permission and the game won't work without it")
                    .onAppear {
                        self.bodyText = "You haven't given us permission and the game won't work without it"}
                Text("Go to settings")
                    .onAppear {
                        self.buttonText = "Go to settings"}
                
                if isAudioDenied() {
                    Text("You have decided to listen to your audio. Activate it in your settings to continue.")
                } else {
                    Text(
                        "We need your audio authorization")
                }
            }
            
            Spacer()
            
        }
        .background(Color.background)
    }
    
    struct AuthorizationView_Previews: PreviewProvider {
        static var previews: some View {
            AuthorizationView(completion: {})
        }
    }
}
