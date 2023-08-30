//
//  GameView.swift
//  duck
//
//  Created by Heloisa Pereira Machado on 28/08/23.
//

import SwiftUI

struct GameView: View {
    @StateObject private var emojiManager = EmojiManager()
    @StateObject private var service = SpeechRecognizerService()
    @State private var currentIcons: [String] = []
    @State private var selectedIconCount: Int = 3
    
    func updateIcons() {
        currentIcons = EmojiManager.getRandomEmojis(count: selectedIconCount)
    }
    
    var body: some View {
        VStack {
            Text("Crie sua história")
            
            Text(service.text)
            
            ForEach(currentIcons, id: \.self) { icon in
                Text("\(icon)\(emojiManager.check(text: service.text, emoji: icon))")
                    .font(.largeTitle)
            }
            
            Button("Falar") {
                do {
                    try service.recognize()
                } catch {
                    print("Deu ruim, pae")
                }
            }
            
            Button("Cabei") {
                RouterService.shared.navigate(.done)
            }
        }
        .onAppear {
            updateIcons()
        }
        
        
    }
    
    struct GameView_Previews: PreviewProvider {
        static var previews: some View {
            GameView()
        }
    }
    
}
