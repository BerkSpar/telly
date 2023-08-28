//
//  HomeView.swift
//  duck
//
//  Created by Felipe Passos on 24/08/23.
//

import SwiftUI

struct HomeView: View {
    @State private var text = "Home View"
    @StateObject private var service = SpeechRecognizerService()

    var body: some View {
        VStack {
            Text(service.text)
            
            Button("Say Hi") {
                let alert = Alert(title: Text("Hi!"))
                
                RouterService.shared.showAlert(alert)
            }
            
            Button("Go Pikachu!") {
                do {
                    try service.recognize()
                } catch {
                    print("Deu ruim, pae")
                }
            }
            
            Button("Ganha Conquista") {
                GameService.shared.rewardAchievement("first_login")
            }
            
            Button("Apaga Conquistas") {
                GameService.shared.resetAchievements()
            }
            Button("Seleção palavras") {
                RouterService.shared.navigate(.words)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

