//
//  Popup.swift
//  telly
//
//  Created by Heloisa Pereira Machado on 14/09/23.
//

import SwiftUI

struct Popup: View {
    @Binding var alert: Bool
    var title: String
    var bodyText: String
    var numberOfButtons: Int
    var buttonText: String
    var secondButtonText: String = "YES"
    
    var action: () -> Void
    
    @StateObject private var controller = GameController()
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.myDarkBlue)
                .opacity(0.6)
                .ignoresSafeArea()
            
            VStack(spacing: 16) {
                VStack(spacing: 4) {
                    HStack {
                        Text(title)
                            .foregroundColor(.myDarkGrey)
                            .font(.title2)
                            .bold()
                            .multilineTextAlignment(.center)
                            .frame(width: 200)
                        
                    }
                    Text(bodyText)
                        .frame(width: 250)
                        .foregroundColor(.myDarkGrey)
                        .multilineTextAlignment(.center)
                }
                
                HStack(spacing: 14) {
                    if numberOfButtons == 2 {
                        ElevatedButton(backgroundColor: .myReddish,textColor: .myBackground, text: secondButtonText, isDisabled: false) {
                            withAnimation() {
                                alert = false
                                action()
                                HapticsService.shared.play(.heavy)
                            }
                        }
                        
                        ElevatedButton(backgroundColor: .myDarkBlue, textColor: .myBackground, text: buttonText, isDisabled: false) {
                            withAnimation() {
                                alert = false
                                HapticsService.shared.play(.soft)
                            }
                        }
                        
                    }
                    if numberOfButtons == 1 {
                        ElevatedButton(backgroundColor: .myDarkBlue, textColor: .myBackground, text: buttonText, isDisabled: false) {
                            withAnimation() {
                                alert = false
                                HapticsService.shared.play(.soft)
                            }
                        }
                    }
                }
            }
            .padding(.vertical, 24)
            .padding(.horizontal, 32)
            .background(Color.myBackground)
            .cornerRadius(24)
            
        }.opacity(alert ? 1 : 0)
    }
}

struct Popup_Previews: PreviewProvider {
    static var previews: some View {
        Popup(alert: .constant(true),
              title: "Title of popup",
              bodyText: "Body of the warning",
              numberOfButtons: 2,
              buttonText: "NO") {
            print("OK")
        }
    }
}
