//
//  TutorialView.swift
//  telly
//
//  Created by Heloisa Pereira Machado on 13/09/23.
//

import SwiftUI

enum OnboardingScreen {
    case welcome
    case themeSelection
    case wordsSelection
    case tips
}
    
struct TutorialView: View {
    @State var theme = ""
    @State var nouns = 0
    @State var verbs = 0
    @State var characters = 0
    
    @StateObject var router = RouterService.shared
    
    var body: some View {
        ZStack {
            switch (router.onboardingScreen) {
            case .welcome: WelcomeView()
            case .themeSelection: ThemeSelectionView(themeSelected: $theme)
                    .transition(.push(from: .trailing))
            case .wordsSelection: WordsSelection(nouns: $nouns, verbs: $verbs, people: $characters)
                    .transition(.push(from: .trailing))
            case .tips: TipsView(themeSelected: $theme, nouns: $nouns, verbs: $verbs, people: $characters)
                    .transition(.push(from: .trailing))
            }
        }
        
    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView()
    }
}
