//
//  WordsView.swift
//  duck
//
//  Created by Heloisa Pereira Machado on 28/08/23.
//

import SwiftUI

struct WordsView: View {
    var body: some View {
        VStack {
            Text("Selecione as palavras")
            
            Button("Pronto") {
                RouterService.shared.navigate(.game)
            }
        }
    }
}

struct WordsView_Previews: PreviewProvider {
    static var previews: some View {
        WordsView()
    }
}
