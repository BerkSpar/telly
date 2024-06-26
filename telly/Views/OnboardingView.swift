//
//  OnboardingView.swift
//  telly
//
//  Created by Felipe Passos on 24/08/23.
//

import SwiftUI
import AVFAudio
import Speech
import GoogleMobileAds

struct OnboardingView: View {
    @State private var bounce = false
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                Spacer()
                
                Image("telly")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.darkBlue)
                    .frame(height: 300)
                    .scaleEffect(bounce ? 1.1 : 1.0)
                    .animation(
                        Animation.easeInOut(duration: 0.35)
                            .repeatCount(3, autoreverses: true),
                        value: bounce
                    )
                
                Spacer()
            }
            
            Spacer()
            
        }
        .background(Color.background)
        .onAppear {
            bounce.toggle()
            
            Task {
                GADMobileAds.sharedInstance().disableSDKCrashReporting()
                AVSpeechSynthesisVoice.speechVoices()
                
                RewardedAd.shared.loadAd(withAdUnitId: AdService.rewardedStoryId)
                InterstitialAd.shared.loadAd(withAdUnitId: AdService.intersticalDoneId)
                
                try await Task.sleep(nanoseconds: Duration(seconds: 1).inNanoseconds())
                
                GameService.shared.authenticate { error in
                    if !StorageService.shared.hasSeenOnboarding() {
                        withAnimation(){
                            RouterService.shared.navigate(.tutorial)
                        }
                        
                        return
                    }
                    
                    RouterService.shared.navigate(.home)
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

