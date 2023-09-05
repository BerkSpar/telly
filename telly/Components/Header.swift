//
//  Header.swift
//  telly
//
//  Created by Heloisa Pereira Machado on 31/08/23.
//

import SwiftUI

struct Header: View {
    var body: some View {
        HStack(spacing: 16) {
            ZStack {
                Circle()
                    .stroke(.white, lineWidth: 5)
                    .background(
                        Circle().fill(Color.myGreen)
                    )
                    .frame(width: 82)
                    .foregroundColor(.myGreen)
                
                Image("tellyIcon")
                    .foregroundColor(.myDarkBlue)
                    
            }
            Text("Welcome, Storyteller!")
                .frame(width: 140)
                .font(.myTitle)
                .foregroundColor(.white)
            
            Spacer()
        }
        .padding(.horizontal, 32)
        .padding(.top, 40)
        .padding(.bottom, 24)
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
    }
}
