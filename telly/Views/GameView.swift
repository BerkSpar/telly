//
//  GameView.swift
//  duck
//
//  Created by Heloisa Pereira Machado on 28/08/23.
//

import SwiftUI

struct GameView: View {
    public var theme: String
    public var nounsCount: Int
    public var verbsCount: Int
    public var charactersCount: Int
    
    @StateObject private var controller = GameController()
    
    var body: some View {
        VStack {
            if (controller.isSpeaking) {
                Text("Theme: \(controller.theme)")
                    .bold()
                    .font(.system(size: 22))
            } else {
                Text("Time to listen to the pronunciation!")
                    .font(.system(size: 22))
                    .bold()
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
                
                Text("Listen to them carefully so you can tell your story more smoothly! You won't be able to listen to them again once you start the game")
                    .font(.system(size: 14))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
            }
            
            if (!controller.verbs.isEmpty) {
                Text("NOUNS")
                    .font(.myHeader)
                    .foregroundColor(.myDarkBlue)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                LazyVGrid(columns: [GridItem(), GridItem()]) {
                    ForEach(controller.nouns) { element in
                        let isChecked = controller.check(element: element)
                        
                        IconCard(
                            text: element.words[0],
                            icon: element.icon,
                            type: isChecked ? .disabled : .none
                        )
                    }
                }
            }
            
            if (!controller.verbs.isEmpty) {
                Text("VERBS")
                    .font(.myHeader)
                    .foregroundColor(.myPurple)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                LazyVGrid(columns: [GridItem(), GridItem()]) {
                    ForEach(controller.verbs) { element in
                        let isChecked = controller.check(element: element)
                        
                        IconCard(
                            text: element.words[0],
                            color: Color.myPurple,
                            type: isChecked ? .disabled : .none
                        )
                    }
                }
            }
            
            if (!controller.characters.isEmpty) {
                Text("CHARACTERS")
                    .font(.myHeader)
                    .foregroundColor(.myDarkBlue)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                LazyVGrid(columns: [GridItem(), GridItem()]) {
                    ForEach(controller.characters) { element in
                        let isChecked = controller.check(element: element)
                        
                        IconCard(
                            text: element.words[0],
                            color: Color.myDarkBlue,
                            type: isChecked ? .disabled : .none
                        )
                    }
                }
            }
            
            Spacer()
            
            if (!controller.isSpeaking) {
                ElevatedButton(
                    backgroundColor: .myDarkBlue,
                    textColor: .myGreen,
                    text: "START SPEAKING"
                ) {
                    HapticsService.shared.play(.heavy)
                    controller.play()
                }
            } else {
                HStack {
                    ElevatedButton(
                        backgroundColor: .myReddish,
                        textColor: .myBackground,
                        text: "STOP"
                    ) {
                        HapticsService.shared.play(.heavy)
                        controller.stop()
                    }
                    .frame(maxWidth: .infinity)
                    
                    ElevatedButton(
                        backgroundColor: .myDarkBlue,
                        textColor: .myGreen,
                        text: "FINISH"
                    ) {
                        HapticsService.shared.notify(.success)
                        controller.stop()
                        RouterService.shared.navigate(.done)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            

        }
        .padding(24)
        .background(Color.myBackground)
        .onAppear {
            controller.initialize(
                theme: theme,
                nounsCount: nounsCount,
                verbsCount: verbsCount,
                charactersCount: charactersCount
            )
        }
        
        
    }
    
    struct GameView_Previews: PreviewProvider {
        static var previews: some View {
            GameView(
                theme: "work",
                nounsCount: 2,
                verbsCount: 1,
                charactersCount: 1
            )
        }
    }
    
}
