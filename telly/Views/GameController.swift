//
//  GameViewController.swift
//  telly
//
//  Created by Felipe Passos on 04/09/23.
//

import SwiftUI

@MainActor
class GameController: ObservableObject {
    @Published var theme = "sports"
    
    @Published var nouns: [ElementModel] = []
    @Published var verbs: [ElementModel] = []
    @Published var characters: [ElementModel] = []
    
    @Published var text = ""
    
    @Published var isSpeaking = false
    @Published var started = false
    
    @Published var audioId = UUID().uuidString
    
    private var expectedWordCount: Int = 0
    private var checkedWordCount: Int = 0
    
    private var service = SpeechRecognizerService()
    
    var nounsCount = 2
    var verbsCount = 2
    var charactersCount = 2
    
    @Published var wordSet = Set<ElementModel>()
    
    var showNouns: Bool {
        wordSet.contains { element in
            return element.type == .nouns
        }
    }
    
    var showVerbs: Bool {
        wordSet.contains { element in
            return element.type == .verbs
        }
    }
    
    var showsCharacters: Bool {
        wordSet.contains { element in
            return element.type == .characters
        }
    }
    
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
        
        let arr = nouns + verbs + characters
        arr.forEach { element in
            wordSet.insert(element)
        }
    }
    
    func check(element: ElementModel) -> Bool {
        for word in element.words {
            if text.lowercased().contains(word.lowercased()) {
                
                if wordSet.contains(element){
                    DispatchQueue.main.async {
                        self.wordSet.remove(element)
                    }
                }
              
                if (word.lowercased() == "apple") {
                    GameService.shared.reportAchievement(identifier: "apple_odyssey", progress: 1.0/26.0 * 100.0)
                }
                
                return true
            }
        }
        return false
    }
    
    func checkAllWords() -> Bool {
        if wordSet.isEmpty {
            return false
        } else {
            return true
        }
    }
    
    func prepareToPlay() {
        started = true
    }
    
    func play() {
        do {
            try service.recognize(audioId: audioId) { text in
                self.text = text
            }
            
            isSpeaking = true
        } catch {
            print("Deu ruim")
        }
    }
    
    func stop() {
        isSpeaking = false
        started = false
        
        service.stop()
    }
    
    func getStory() -> StoryModel{
        let currentDate = Date()

        let formatter = DateFormatter()
        formatter.dateFormat = NSLocalizedString("date_format", comment: "Date format")
        let formattedDate = formatter.string(from: currentDate)
        
        let words =  nouns.map { $0.words[0] } + verbs.map { $0.words[0] } + characters.map { $0.words[0] }
        
        return StoryModel(
            id: audioId,
            title: NSLocalizedString("My Story", comment: "The story title"),
            date: formattedDate,
            theme: theme,
            words: words
        )
    }
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
