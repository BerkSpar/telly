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
    case done(story: StoryModel)
    case authorization(completion: () -> Void)
}

struct ContentView: View {
    @StateObject var router = RouterService.shared
    @StateObject var locale = LocaleService.shared
    
    var body: some View {
        ZStack {
            switch(router.screen) {
            case .onboarding: OnboardingView()
            case .tutorial: TutorialView()
            case .home: HomeView()
                    .transition(.move(edge: .leading))
            case .words: WordsView()
            case .done(story: let story):
                DoneView(story: story)
                    .transition(.move(edge: .trailing))
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
                
            }
        }
        .alert(isPresented: $router.isAlertPresented) {
            router.alert
        }
        .sheet(isPresented: $router.isSheetPresented) {
            router.sheet
        }
        .overlay {
            if router.isPopUpPresented {
                    router.popUp
            }
        }
//        .environment(\.locale, .init(identifier: locale.systemLocale))
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
