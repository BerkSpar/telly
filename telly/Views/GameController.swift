//
//  GameViewController.swift
//  telly
//
//  Created by Felipe Passos on 04/09/23.
//

import Foundation

@MainActor
class GameController: ObservableObject {
    @Published var theme = "sports"
    
    @Published var nouns: [ElementModel] = []
    @Published var verbs: [ElementModel] = []
    @Published var characters: [ElementModel] = []
    
    @Published var text = ""
    
    @Published var isSpeaking = false
    
    private var service = SpeechRecognizerService()
    
    var nounsCount = 2
    var verbsCount = 2
    var charactersCount = 2
    
    func initialize(theme: String, nounsCount: Int, verbsCount: Int, charactersCount: Int) {
        self.theme = theme
        self.nounsCount = nounsCount
        self.verbsCount = verbsCount
        self.charactersCount = charactersCount
        
        generateElements()
    }
    
    func generateElements() {
        nouns = ElementManager.getRandomElements(count: nounsCount, theme: theme, type: .nouns)
        verbs = ElementManager.getRandomElements(count: verbsCount, theme: theme, type: .verbs)
        characters = ElementManager.getRandomElements(count: charactersCount, theme: theme, type: .characters)
    }
    
    func check(element: ElementModel) -> Bool {
        for word in element.words {
            if text.contains(word) {
                HapticsService.shared.notify(.success)
                
                if (word.lowercased() == "apple") {
                    GameService.shared.reportAchievement(identifier: "apple_odyssey", progress: 1.0/26.0 * 100.0)
                }
                
                return true
            }
        }
        
        return false
    }
    
    func play() {
        do {
            try service.recognize { text in
                self.text = text
            }
            
            isSpeaking = true
        } catch {
            print("Deu ruim")
        }
    }
    
    func stop() {
        isSpeaking = false
        
        service.stop()
    }
}
