//
//  SpeechBallon.swift
//  telly
//
//  Created by Heloisa Pereira Machado on 14/09/23.
//

import SwiftUI

struct SpeechBallon: View {
    var telly: String
    var title: String
    var label:  String
    
    var body: some View {
        
        HStack(spacing: 24) {
            Image(telly)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 75, height: 50)
                
            
                .foregroundColor(.myDarkBlue)
            VStack(spacing: 8) {
                HStack {
                    Text(title)
                        .font(.headline)
                        .bold()
                        .fixedSize(horizontal: false, vertical: true)
                    Spacer()
                }
                
                HStack {
                    Text(label)
                        .font(.caption)
                        .fixedSize(horizontal: false, vertical: true)
                    Spacer()
                }
            }
        }
        .padding(.vertical, 24)
        .padding(.leading, 32)
        .padding(.trailing, 16)
        .background(
            RoundedRectangle(cornerRadius: 24)
                .stroke(Color.myDarkBlue, lineWidth: 4)
                .background(
                    RoundedRectangle(cornerRadius: 24)
                        .fill(Color.myBackground)
                ))
        //        .padding(32)
    }
}

struct SpeechBallon_Previews: PreviewProvider {
    static var previews: some View {
        SpeechBallon(telly: "tellyIcon", title: "So, to start your storytelling, we’ll choose the theme!", label: "Tap on one of the themes to select it!")
    }
}
