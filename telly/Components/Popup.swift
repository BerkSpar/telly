//
//  Popup.swift
//  telly
//
//  Created by Heloisa Pereira Machado on 14/09/23.
//

import SwiftUI

struct Popup: View {

    internal init(title: LocalizedStringKey, bodyText: LocalizedStringKey, numberOfButtons: Int, buttonText: LocalizedStringKey, secondButtonText: LocalizedStringKey = "YES", action: @escaping () -> Void) {
        self.title = title
        self.bodyText = bodyText
        self.numberOfButtons = numberOfButtons
        self.buttonText = buttonText
        self.secondButtonText = secondButtonText
        self.action = action
        self.secondaryAction = nil
    }
    
    internal init(title: LocalizedStringKey, bodyText: LocalizedStringKey, numberOfButtons: Int, buttonText: LocalizedStringKey, secondButtonText: LocalizedStringKey = "YES", action: @escaping () -> Void, secondaryAction: @escaping () -> Void) {
        self.title = title
        self.bodyText = bodyText
        self.numberOfButtons = numberOfButtons
        self.buttonText = buttonText
        self.secondButtonText = secondButtonText
        self.action = action
        self.secondaryAction = secondaryAction
    }
 
    var title: LocalizedStringKey
    var bodyText: LocalizedStringKey
    var numberOfButtons: Int
    var buttonText: LocalizedStringKey
    var secondButtonText: LocalizedStringKey = "YES"
    
    var action: () -> Void
    var secondaryAction: (() -> Void)?
    
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
                                RouterService.shared.hidePopUp()
                                action()
                                HapticsService.shared.play(.heavy)
                            }
                        }
                        
                        ElevatedButton(backgroundColor: .myDarkBlue, textColor: .myBackground, text: buttonText, isDisabled: false) {
                            withAnimation() {
                                RouterService.shared.hidePopUp()
                                secondaryAction?()
                                HapticsService.shared.play(.soft)
                            }
                        }
                        
                    }
                    if numberOfButtons == 1 {
                        ElevatedButton(backgroundColor: .myDarkBlue, textColor: .myBackground, text: buttonText, isDisabled: false) {
                            withAnimation() {
                                RouterService.shared.hidePopUp()
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
            .padding(32)
            
        }
    }
}

struct Popup_Previews: PreviewProvider {
    static var previews: some View {
        Popup(title: "Title of popup",
              bodyText: "Body of the warning",
              numberOfButtons: 2,
              buttonText: "NO") {
            print("OK")
        }
    }
}
