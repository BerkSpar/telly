//
//  ElevatedCard.swift
//  telly
//
//  Created by Felipe Passos on 31/08/23.
//

import SwiftUI

struct ElevatedCard<Content: View>: View {
    var color: Color = Color.myDarkBlue
    var backgroundColor: Color = Color.myBackground
    let content: () -> Content
    
    var body: some View {
        content()
            .background(
                Rectangle()
                  .foregroundColor(.clear)
                  .background(backgroundColor)
                  .cornerRadius(16)
                  .shadow(
                    color: .black.opacity(0.25),
                    radius: 2, x: 0, y: 2
                  )
                  .overlay(
                    RoundedRectangle(cornerRadius: 16)
                      .inset(by: 0.5)
                      .stroke(color, lineWidth: 1)
                  )
            )
    }
}

struct ElevatedCard_Previews: PreviewProvider {
    static var previews: some View {
        ElevatedCard(color: Color.myPurple, content:  {
            Text("1")
                .font(.system(size: 20))
                .fontWidth(.expanded)
                .bold()
                .foregroundColor(Color.myPurple)
                .frame(width: 40, height: 40)
        })
    }
}
