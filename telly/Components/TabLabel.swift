//
//  TabLabel.swift
//  telly
//
//  Created by Heloisa Pereira Machado on 01/09/23.
//

import SwiftUI

struct TabLabel: View {
    @Binding var isSelected: Bool
    var text: LocalizedStringKey
    var corner: UIRectCorner
    
    var body: some View {
        if isSelected {
            Text(text)
                .font(.title3)
                .foregroundColor(.darkBlue)
                .fontWidth(.expanded)
                .bold()
                .padding(.vertical, 12)
                .frame(maxWidth: .infinity)
                .background(Color.background)
                .cornerRadius(32, corners: corner)
//                .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
//                .transition(.move(edge: .leading))
                .transition(.identity)
            
        } else {
            Text(text)
                .font(.title3)
                .fontWidth(.expanded)
                .bold()
                .padding(.vertical, 12)
                .frame(maxWidth: .infinity)
                .foregroundColor(.background)
                .background(Color.darkBlue)
                .cornerRadius(32, corners: corner)
//                .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
//                .transition(.move(edge: .trailing))
                .transition(.identity)
         
        }
    }
}
