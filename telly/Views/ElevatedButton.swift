//
//  ElevatedButton.swift
//  telly
//
//  Created by Felipe Passos on 31/08/23.
//

import SwiftUI

struct ElevatedButton: View {
    var backgroundColor: Color
    var textColor: Color
     
    let text: String
    
    var isDisabled: Bool = false
    
    let action: () -> Void
    
    func buttonTextColor() -> Color {
        if isDisabled {
            return .myBackground
        } else {
            return textColor
        }
    }
    
    var body: some View {
        Button(action: action) {
            ElevatedCard(
                color: isDisabled ? .myGrey : backgroundColor,
                backgroundColor: isDisabled ? .myGrey : backgroundColor
            ) {
                Text(text)
                    .font(.system(size: 24))
                    .fontWidth(.expanded)
                    .fontWeight(.heavy)
                    .foregroundColor(buttonTextColor())
                    .padding(16)
            }
        }
        .disabled(isDisabled)
    }
}

struct ElevatedButton_Previews: PreviewProvider {
    static var previews: some View {
        ElevatedButton(
            backgroundColor: .myDarkBlue,
            textColor: .myGreen,
            text: "START!",
            isDisabled: true
        
        ) {
            print("Ihu")
        }
    }
}
