//
//  HomeView.swift
//  telly
//
//  Created by Felipe Passos on 24/08/23.
//

import SwiftUI

struct HomeView: View {
    @State private var text = "Home View"

    var body: some View {
        VStack {
            
            Text("gGBs")
                .font(.myTitle)
                
            
            Button("Say His") {
                let alert = Alert(title: Text("Hi!"))
                
                RouterService.shared.showAlert(alert)
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

