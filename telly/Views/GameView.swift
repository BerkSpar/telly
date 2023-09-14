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
    @State var countdown = 3
    @State var showAlert = false

    @StateObject private var controller = GameController()
    
    func startCountdown() {
        let interval = DispatchTimeInterval.seconds(1)
        DispatchQueue.main.asyncAfter(deadline: .now() + interval) {
            if controller.isSpeaking && countdown > 0 {
                countdown -= 1
                
                startCountdown()
            }
        }
    }
    
    var body: some View {
        
        
        ZStack {
            VStack(spacing: 0) {
                if (controller.isSpeaking) {
                    Text("Theme: \(controller.theme)")
                        .bold()
                        .font(.system(size: 22))
                        .padding(.bottom, 24)
                } else {
                    Text("Take a look at the words")
                        .font(.system(size: 24))
                        .bold()
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.myDarkGrey)
                    
                    Text("You will be able to see them again once you start your story")
                        .font(.system(size: 16))
                        .multilineTextAlignment(.center)
                        .frame(width: 300)
                        .padding(.bottom, 24)
                        .foregroundColor(.myDarkGrey)
                }
                
                if (!controller.nouns.isEmpty) {
                    Text("NOUNS")
                        .font(.myHeader)
                        .foregroundColor(controller.showNouns ? .myDarkBlue : .myGrey)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 8)
                    
                    LazyVGrid(columns: [GridItem(), GridItem()]) {
                        ForEach(controller.nouns) { element in
                            let isChecked = controller.check(element: element)
                            
                            IconCard(
                                text: element.words[0],
                                icon: element.icon,
                                color: .myDarkBlue,
                                type: isChecked ? .disabled : .none
                            )
                        }
                    }
                    .padding(.bottom, 24)
                }
                
                if (!controller.verbs.isEmpty) {
                    Text("VERBS")
                        .font(.myHeader)
                        .foregroundColor(controller.showVerbs ? .myPurple : .myGrey)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 8)
                    
                    LazyVGrid(columns: [GridItem(), GridItem()]) {
                        ForEach(controller.verbs) { element in
                            let isChecked = controller.check(element: element)
                            
                            IconCard(
                                text: element.words[0],
                                color: .myPurple,
                                type: isChecked ? .disabled : .none
                            )
                        }
                    }
                    .padding(.bottom, 24)
                }
                
                if (!controller.characters.isEmpty) {
                    Text("CHARACTERS")
                        .font(.myHeader)
                        .foregroundColor(controller.showsCharacters ? .myReddish : .myGrey)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 8)
                    
                    LazyVGrid(columns: [GridItem(), GridItem()]) {
                        ForEach(controller.characters) { element in
                            let isChecked = controller.check(element: element)
                            
                            IconCard(
                                text: element.words[0],
                                color: .myReddish,
                                type: isChecked ? .disabled : .none
                            )
                        }
                    }
                    .padding(.bottom, 24)
                }
                
                Spacer()
                
                if (!controller.isSpeaking) {
                    HStack {
                        ElevatedButton(
                            backgroundColor: .myReddish,
                            textColor: .myBackground,
                            text: "QUIT"
                        ) {
                            withAnimation() {
                                HapticsService.shared.notify(.warning)
                                RouterService.shared.navigate(.home)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        
                        ElevatedButton(
                            backgroundColor: .myDarkBlue,
                            textColor: .myBackground,
                            text: "START"
                        ) {
                            HapticsService.shared.play(.heavy)
                            controller.play()
                            startCountdown()
                    }
                        .frame(maxWidth: .infinity)
                    }
                    
                } else {
                    HStack {
                        ElevatedButton(
                            backgroundColor: .myReddish,
                            textColor: .myBackground,
                            text: "STOP",
                            isDisabled: false
                        ) {
                            withAnimation() {
                                HapticsService.shared.notify(.warning)
                                showAlert = true
                            }
                        }
                        .frame(maxWidth: .infinity)
                        
                        ElevatedButton(
                            backgroundColor: .myDarkBlue,
                            textColor: .myBackground,
                            text: "FINISH",
                            isDisabled: controller.checkAllWords()
                        ) {
                            controller.stop()
                            controller.save()
                            
                            HapticsService.shared.notify(.success)
                            
                            RouterService.shared.navigate(.done(theme: controller.theme))
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
            
            .overlay {
                ZStack {
                    Rectangle()
                        .foregroundColor(.myDarkBlue)
                        .opacity(0.6)
                        .ignoresSafeArea()
                    
                    VStack(spacing: 16) {
                        VStack(spacing: 4) {
                            HStack {
                                Text("Do you really want to quit de game?")
                                    .foregroundColor(.myDarkGrey)
                                    .font(.title2)
                                    .bold()
                                    .multilineTextAlignment(.center)
                                    .frame(width: 200)
                                
                            }
                            Text("Any progress you may have made so far won't be saved")
                                .frame(width: 250)
                                .foregroundColor(.myDarkGrey)
                                .multilineTextAlignment(.center)
                        }
                        
                        HStack(spacing: 14) {
                            ElevatedButton(backgroundColor: .myReddish,textColor: .myBackground, text: "YES", isDisabled: false) {
                                withAnimation() {
                                    showAlert = false
                                    controller.stop()
                                    HapticsService.shared.play(.heavy)
                                }
                            }
                            
                            ElevatedButton(backgroundColor: .myDarkBlue, textColor: .myBackground, text: "NO", isDisabled: false) {
                                withAnimation() {
                                    showAlert = false
                                    HapticsService.shared.play(.soft)
                                }
                            }
                        }
                    }
                    .padding(.vertical, 24)
                    .padding(.horizontal, 32)
                    .background(Color.myBackground)
                    .cornerRadius(24)
                    
                    
                    
                }.opacity(showAlert ? 1 : 0)
                
                if controller.isSpeaking && countdown > 0 {
                    Rectangle()
                        .opacity(0.7)
                        .ignoresSafeArea()
                        .foregroundColor(.myDarkGrey)
                    Text("\(countdown)")
                        .font(.myLargeTitle)
                        .foregroundColor(.myBackground)
                }
            }
            
        }
    }
    
    struct GameView_Previews: PreviewProvider {
        static var previews: some View {
            GameView(
                theme: "work",
                nounsCount: 4,
                verbsCount: 2,
                charactersCount: 2
            )
        }
    }
    
}
