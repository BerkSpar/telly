//
//  HomeView.swift
//  duck
//
//  Created by Felipe Passos on 24/08/23.
//

import SwiftUI

struct HomeView: View {
    @State private var text = "Home View"
    
    var body: some View {
        VStack {
            Text(text)
            
            Button("Say Hi") {
                let alert = Alert(title: Text("Hi!"))
                
                RouterService.shared.showAlert(alert)
            }
            
            Button("Go Pikachu!") {
                fetchPokemon()
            }
        }
    }
    
    func fetchPokemon() {
        Task {
            await WhisperService().listen { result in
                switch result {
                case .success(let text):
                    self.text = text
                case .failure(let error):
                    self.text = error.localizedDescription
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
