//
//  Story.swift
//  telly
//
//  Created by Heloisa Pereira Machado on 10/09/23.
//

import SwiftUI

struct Story: View {
    @State var storyModel: StoryModel
    
    
    var body: some View {
        VStack{
            
            HStack {
                Text(storyModel.date)
                    .font(.myCallout)
                .foregroundColor(.myGrey)
                
                Spacer()
            }
            
            Button {
                
            } label: {
                HStack {
                    Text(storyModel.title)
                        .font(.myBodyBold)
                        .foregroundColor(.myDarkGrey)
                        .lineLimit(1)
                    
                    Spacer()
                    
                    Image(systemName: "ellipsis.circle.fill")
                        .font(.system(size: 24))
                        .foregroundColor(.myDarkBlue)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
                .overlay(RoundedRectangle(cornerRadius: 16) .stroke(Color.myDarkBlue))
            }
        }
    }
}

struct Story_Previews: PreviewProvider {
    static var previews: some View {
        Story(storyModel: StoryModel(title: "My trip", date: "24/08 04:30p.m"))
    }
}
