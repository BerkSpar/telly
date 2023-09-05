//
//  StoryView.swift
//  telly
//
//  Created by Heloisa Pereira Machado on 31/08/23.
//

import SwiftUI

struct StoryView: View {
    var body: some View {
        VStack {
            HStack{
                Text(":)")
                Spacer()
            }
            Text("StoryView")
                .background(.white)
            Button("Seleção palavras") {
                RouterService.shared.navigate(.game(
                    theme: "work",
                    nouns: 2,
                    verbs: 2,
                    characters: 2
                ))
            }
            Spacer()
        }
        .background(.white)
    }
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView()
    }
}
