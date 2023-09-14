//
//  TipsView.swift
//  telly
//
//  Created by Heloisa Pereira Machado on 14/09/23.
//

import SwiftUI
import AVFAudio
import Speech

struct TipsView: View {
    @Binding var themeSelected: String
    
    @Binding var nouns: Int
    @Binding var verbs: Int
    @Binding var people: Int
    
    func verifyAuthentication(_ completion: @escaping () -> Void) {
        if (SFSpeechRecognizer.authorizationStatus() != .authorized || AVAudioSession.sharedInstance().recordPermission != .granted) {
            RouterService.shared.navigate(.authorization(completion: completion))
            return;
        }
        
        completion()
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.myGreen)
                .ignoresSafeArea()
            
            VStack(spacing: 32) {
                VStack(spacing: 12) {
                    PageCount(currentPage: 3)
                    SpeechBallon(telly: "speaking_telly", title: "So, to start your storytelling, we’ll choose the theme!", label: "Tap on one of the themes to select it!")
                }
                
                VStack(spacing: 8) {
                    Text("Some tips for you:")
                        .font(.headline)
                        .bold()
                        .fixedSize(horizontal: false, vertical: true)
                    
                    HStack {
                        Image(systemName: "circle.fill")
                            .font(.system(size: 8))
                            .foregroundColor(.myDarkBlue)
                        
                        Text("You can also say words in the plural and conjugate verbs in any tense!")
                            .font(.caption)
                            .fixedSize(horizontal: false, vertical: true)
                        Spacer()
                    }
                    
                    HStack {
                        Image(systemName: "circle.fill")
                            .font(.system(size: 8))
                            .foregroundColor(.myDarkBlue)
                        
                        Text("When you have used all the words, the finish button will be enabled.")
                            .font(.caption)
                            .fixedSize(horizontal: false, vertical: true)
                        Spacer()
                    }
                    
                }
                .padding(.vertical, 24)
                .padding(.leading, 32)
                .padding(.trailing, 16)
                .background(
                    RoundedRectangle(cornerRadius: 24)
                        .stroke(Color.myDarkBlue, lineWidth: 4)
                        .background(
                            RoundedRectangle(cornerRadius: 24)
                                .fill(Color.myBackground)
                        ))
                
                ElevatedButton(
                    backgroundColor: .myDarkBlue,
                    textColor: .myBackground,
                    text: "NEXT",
                    action: {
                        withAnimation(.spring()) {
                            StorageService.shared.setOnboardingSeen(true)
                            HapticsService.shared.play(.medium)
                            
                            verifyAuthentication {
                                RouterService.shared.navigate(.game(
                                    theme: themeSelected,
                                    nouns: nouns,
                                    verbs: verbs,
                                    characters: people
                                ))
                            }
                        }
                    }
                )}
            .padding(32)
        }
    }
}

struct TipsView_Previews: PreviewProvider {
    static var previews: some View {
        TipsView(themeSelected: .constant("work"), nouns: .constant(0), verbs: .constant(0), people: .constant(0))
    }
}
