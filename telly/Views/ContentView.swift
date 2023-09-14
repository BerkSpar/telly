//
//  ContentView.swift
//  telly
//
//  Created by Felipe Passos on 24/08/23.
//

import SwiftUI

enum Screen {
    case onboarding
    case tutorial
    case home
    case words
    case game(theme: String, nouns: Int, verbs: Int, characters: Int)
    case done(theme: String)
    case authorization(completion: () -> Void)
}

struct ContentView: View {
    @StateObject var router = RouterService.shared
    
    var body: some View {
        ZStack {
            switch(router.screen) {
            case .onboarding: OnboardingView()
            case .tutorial: TutorialView()
            case .home: HomeView()
                    .transition(.slide)
            case .words: WordsView()
            case .done(theme: let theme):
                DoneView(theme: theme)
            case .authorization(completion: let completion):
                AuthorizationView(completion: completion)
            case .game(
                theme: let theme,
                nouns: let nouns,
                verbs: let verbs,
                characters: let characters
            ):
                GameView(
                    theme: theme,
                    nounsCount: nouns,
                    verbsCount: verbs,
                    charactersCount: characters
                )
                .transition(.push(from: .trailing))
            }
        }
        .alert(isPresented: $router.isAlertPresented) {
            router.alert
        }
        .sheet(isPresented: $router.isSheetPresented) {
            router.sheet
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
