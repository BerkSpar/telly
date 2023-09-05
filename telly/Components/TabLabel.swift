//
//  TabLabel.swift
//  telly
//
//  Created by Heloisa Pereira Machado on 01/09/23.
//

import SwiftUI

struct TabLabel: View {
    @Binding var isSelected: Bool
    var text: String
    var corner: UIRectCorner
    
    var body: some View {
        if isSelected {
            Text(text)
                .font(.title3)
                .foregroundColor(.myDarkBlue)
                .fontWidth(.expanded)
                .bold()
                .padding(.vertical, 12)
                .frame(width: 200)
                .background()
                .cornerRadius(32, corners: corner)
        } else {
            Text(text)
                .font(.title3)
                .fontWidth(.expanded)
                .bold()
                .padding(.vertical, 12)
                .frame(width: 200)
                .foregroundColor(.myGreen)
                .background(Color.myDarkBlue)
                .cornerRadius(32, corners: corner)
        }
    }
}
