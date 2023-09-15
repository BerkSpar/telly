//
//  WelcomeView.swift
//  telly
//
//  Created by Heloisa Pereira Machado on 14/09/23.
//

import SwiftUI

struct WelcomeView: View {
    
    func bodyText(_ text: LocalizedStringKey) -> some View {
        Text(text)
            .frame(width: 280)
            .foregroundColor(.myDarkGrey)
            .multilineTextAlignment(.center)
            .fixedSize(horizontal: false, vertical: true)
    }
    
    func boldText(_ text: String) -> some View {
        Text(text)
            .bold()
            .foregroundColor(.myDarkGrey)
    }
    
    var body: some View {
        VStack(spacing: 32) {
            Spacer()
            VStack(spacing: 16) {
                VStack {
                    HStack {
                        Spacer()
                        Text("WELCOME TO")
                            .font(.title3)
                            .foregroundColor(.myDarkGrey)
                            .fontWidth(.expanded)
                            .bold()
                        Spacer()
                    }
                    
                    Image("logo_telly")
                        .foregroundColor(.myDarkBlue)
                }
                
                VStack(spacing: 16) {
                    VStack {
                        Group {
                            bodyText("You're on the best app for ")
                            boldText("practicing your conversation skills")
                            bodyText(" in English without having to talk to someone else!")
                        }
                    }
                    
                    bodyText("Here you'll improve your speaking skills by including random words in your story!")
                    
                    bodyText("Your goal is to include all the  words given to you and improvise!")
                }
            }
            
            ElevatedButton(backgroundColor: .myDarkBlue, textColor: .myBackground, text: "LET'S GO!") {
                
                withAnimation(.spring()) {
                    HapticsService.shared.play(.medium)
                    RouterService.shared.onboarding(.themeSelection)
                }
            }
            .padding(.horizontal, 24)
            
            Spacer()
        }
        .background(Color.myGreen)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
