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
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ElevatedCard(
                color: backgroundColor,
                backgroundColor: backgroundColor,
                hasStroke: false
            ) {
                Text(text)
                    .font(.system(size: 24))
                    .fontWidth(.expanded)
                    .fontWeight(.heavy)
                    .foregroundColor(textColor)
                    .padding(16)
            }
        }
    }
}

struct ElevatedButton_Previews: PreviewProvider {
    static var previews: some View {
        ElevatedButton(
            backgroundColor: .myDarkBlue,
            textColor: .myGreen,
            text: "START!"
        
        ) {
            print("Ihu")
        }
    }
}
