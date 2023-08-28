//
//  ContentView.swift
//  duck
//
//  Created by Felipe Passos on 24/08/23.
//

import SwiftUI

enum Screen {
    case onboarding
    case home
    case words
    case game
    case done
}

struct ContentView: View {
    @StateObject var router = RouterService.shared
    
    var body: some View {
        ZStack {
            switch(router.screen) {
            case .onboarding: OnboardingView()
            case .home: HomeView()
            case .words: WordsView()
            case .game: GameView()
            case .done: DoneView()
            }
        }
        .alert(isPresented: $router.isAlertPresented) {
            router.alert
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
