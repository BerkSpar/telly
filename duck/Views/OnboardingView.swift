//
//  OnboardingView.swift
//  duck
//
//  Created by Felipe Passos on 24/08/23.
//

import SwiftUI
import AVFoundation
import Speech

struct OnboardingView: View {
    var body: some View {
        VStack {
            Text("Onboarding View")
            
            Button("Go Home") {
                RouterService.shared.navigate(.home)
                GameService.shared.hideAccessPoint()
            }
        }
        .onAppear {
            GameService.shared.authenticate()
            
            Task {
                guard await SFSpeechRecognizer.hasAuthorizationToRecognize() else {
                    return
                }
                guard await AVAudioSession.sharedInstance().hasPermissionToRecord() else {
                    return
                }
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
