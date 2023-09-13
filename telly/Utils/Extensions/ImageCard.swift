//
//  StoryCard.swift
//  telly
//
//  Created by Felipe Passos on 31/08/23.
//

import SwiftUI

struct ImageCard: View {
    var title: String
    var image: String
    @Binding var isSelected: Bool
    
    func changeColor() -> Color {
        if isSelected {
            return .myBackground
        } else {
            return .myDarkGrey
        }
    }
    
    func changeBackgroundColor() -> Color{
        if isSelected {
            return .myDarkBlue
        } else {
            return .myBackground
        }
    }
    
    var body: some View {
        VStack(spacing: 8) {
            Image(image)
                .resizable()
                .frame(width: 130, height: 100)
                .scaledToFill()
                
            Text(title)
                .font(.myBodyBold)
                .bold()
                .foregroundColor(changeColor())
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .stroke(changeColor(), lineWidth: 2)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(changeBackgroundColor())
                ))
    }
}

struct ImageCard_Previews: PreviewProvider {
    static var previews: some View {
        ImageCard(
            title: "WORKSPACE",
            image: "category_workspace",
            isSelected: .constant(true)
        )
        .frame(maxWidth: 200)
    }
}
