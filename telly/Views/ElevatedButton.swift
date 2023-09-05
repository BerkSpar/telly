//
//  ElevatedButton.swift
//  telly
//
//  Created by Felipe Passos on 31/08/23.
//

import SwiftUI

struct ElevatedButton: View {
    var backgroundColor: Color = .myDarkBlue
    var textColor: Color = .myGreen
    
    let text: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ElevatedCard(
                color: backgroundColor,
                backgroundColor: backgroundColor
            ) {
                Text(text)
                    .font(.system(size: 20))
                    .fontWidth(.expanded)
                    .bold()
                    .foregroundColor(textColor)
                    .padding(16)
            }
        }
    }
}

struct ElevatedButton_Previews: PreviewProvider {
    static var previews: some View {
        ElevatedButton(text: "START!") {
            print("Ihu")
        }
    }
}
