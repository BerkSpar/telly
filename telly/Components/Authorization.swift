//
//  Authorization.swift
//  telly
//
//  Created by Heloisa Pereira Machado on 04/09/23.
//

import SwiftUI

struct Authorization: View {
    var titleVoice: String
    var titleSound: String
    var icon: String
    var bodyText: String
    
    var body: some View {
        VStack{
            Text(titleVoice)
                .font(.title2)
                .bold()
                .multilineTextAlignment(.center)
                .frame(width: 300)
            
            Image(icon)
                .foregroundColor(.myDarkBlue)
            
            Text(bodyText)
                .multilineTextAlignment(.center)
                .frame(width: 300)
            
        }
    }
}

struct Authorization_Previews: PreviewProvider {
    static var previews: some View {
        Authorization(titleVoice: "To play the game you must enable your microphone", titleSound: "And your sound", icon: "microphone_authorization", bodyText: "That's because we will identify if you are pronouncing the words")
    }
}
