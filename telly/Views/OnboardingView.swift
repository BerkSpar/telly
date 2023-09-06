//
//  OnboardingView.swift
//  telly
//
//  Created by Felipe Passos on 24/08/23.
//

import SwiftUI
import AVFoundation
import Speech

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
                    .foregroundColor(.myDarkBlue)
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
        .background(Color.myBackground)
        .onAppear {
            bounce.toggle()  // Start the bounce animation
            
            Task {
                try await Task.sleep(nanoseconds: Duration(seconds: 1).inNanoseconds())
                
                GameService.shared.authenticate { error in
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

