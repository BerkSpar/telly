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
    var color: Color
    
    var body: some View {
        VStack(spacing: 16) {
            Image(image)
                .frame(maxWidth: .infinity)
                .padding(16)
                .background(Color.myBackground)
                .cornerRadius(8)
                
            
            Text(title)
                .font(.system(size: 20))
                .fontWidth(.condensed)
                .bold()
                .foregroundColor(Color.myBackground)
        }
        .padding(16)
        .background(color)
        .cornerRadius(16)
    }
}

struct ImageCard_Previews: PreviewProvider {
    static var previews: some View {
        ImageCard(
            title: "WORKSPACE",
            image: "category_workspace",
            color: Color.myDarkBlue
        )
        .frame(maxWidth: 200)
    }
}
