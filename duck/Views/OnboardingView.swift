//
//  OnboardingView.swift
//  duck
//
//  Created by Felipe Passos on 24/08/23.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        VStack {
            Text("Onboarding View")
            
            Button("Go Home") {
                RouterService.shared.navigate(.home)
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
