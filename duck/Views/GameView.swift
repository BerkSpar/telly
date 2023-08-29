//
//  GameView.swift
//  duck
//
//  Created by Heloisa Pereira Machado on 28/08/23.
//

import SwiftUI

struct GameView: View {
    @StateObject private var service = SpeechRecognizerService()
    
    var body: some View {
        VStack {
            Text("Crie sua história")
            
            Text(service.text)
            
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
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
