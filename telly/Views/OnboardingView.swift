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
    let start = Date()
    let end = Date().addingTimeInterval(1)
    
    var body: some View {
        VStack {
            Text("Onboarding View")
            
            Text("Carregando...")
        }
        .onAppear {
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
