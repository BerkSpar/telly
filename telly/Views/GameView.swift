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
    
    @State private var bounce = false
    
    @StateObject private var controller = GameController()
    
    @State private var timeElapsed: Double = 0
    
    let service = SynthesisService()
    
    func startCountdown() {
        
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if controller.started && countdown > 0 {
                withAnimation(.spring()) {
                    countdown -= 1
                }
            } else if controller.started && countdown == 0 {
                controller.play()
                timer.invalidate()
            } else {
                timer.invalidate()
            }
        }
    }
    
    func hasSpeakerIcon() -> Bool {
        if !controller.started {
            return true
        } else {
            return false
        }
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                if (controller.started) {
                    HStack(spacing: 12) {
                        AnimatedIcon()
                        
                        Text("Theme: \(NSLocalizedString(controller.theme, comment: "Theme name"))")
                            .font(.system(size: 24))
                            .bold()
                            .foregroundColor(.myDarkGrey)
                        
                    }
                    .padding(.bottom, 24)
                } else {
                    VStack(spacing: 8) {
                        Text("Let's listen the pronunciation!")
                            .font(.system(size: 24))
                            .bold()
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.myDarkGrey)
                        
                        Text("Tap the boxes to hear the word's pronunciation, after you will only be able to read them")
                            .font(.system(size: 16))
                            .multilineTextAlignment(.center)
                            .frame(width: 350)
                            .padding(.bottom, 24)
                            .foregroundColor(.myDarkGrey)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
                
                if (!controller.nouns.isEmpty) {
                    if (controller.isSpeaking) {
                        Text("NOUNS")
                            .font(.myHeader)
                            .foregroundColor(controller.showNouns ? .myDarkBlue : .myGrey)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 8)
                    } else {
                        Text("NOUNS")
                            .font(.myHeader)
                            .foregroundColor(.myDarkBlue)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 8)
                    }
                    
                    LazyVGrid(columns: [GridItem(), GridItem()]) {
                        ForEach(controller.nouns) { element in
                            let isChecked = controller.check(element: element)
                            
                            if (controller.isSpeaking) {
                                IconCard(
                                    text: element.words[0],
                                    icon: element.icon,
                                    color: .myDarkBlue,
                                    type: isChecked ? .disabled : .none
                                )
                            } else {
                                Button {
                                    service.speak(element.words[0])
                                } label: {
                                    IconCard(
                                        text: element.words[0],
                                        icon: element.icon,
                                        color: .myDarkBlue,
                                        type: .none,
                                        hasSpeaker: hasSpeakerIcon()
                                    )
                                }
                            }
                        }
                    }
                    .padding(.bottom, 24)
                    
                }
                
                
                if (!controller.verbs.isEmpty) {
                    if (controller.isSpeaking) {
                        Text("VERBS")
                            .font(.myHeader)
                            .foregroundColor(controller.showVerbs ? .myPurple : .myGrey)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 8)
                    } else {
                        Text("VERBS")
                            .font(.myHeader)
                            .foregroundColor(.myPurple)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 8)
                    }
                    
                    LazyVGrid(columns: [GridItem(), GridItem()]) {
                        ForEach(controller.verbs) { element in
                            let isChecked = controller.check(element: element)
                            
                            if (controller.isSpeaking) {
                                IconCard(
                                    text: element.words[0],
                                    color: .myPurple,
                                    type: isChecked ? .disabled : .none
                                )
                            } else {
                                Button {
                                    service.speak(element.words[0])
                                } label: {
                                    IconCard(
                                        text: element.words[0],
                                        color: .myPurple,
                                        type: .none,
                                        hasSpeaker: hasSpeakerIcon()
                                    )
                                }
                                
                            }
                        }
                    }
                    .padding(.bottom, 24)
                }
                
                if (!controller.characters.isEmpty) {
                    if (controller.isSpeaking) {
                        Text("PEOPLE")
                            .font(.myHeader)
                            .foregroundColor(controller.showsCharacters ? .myReddish : .myGrey)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 8)
                    }
                    else {
                        Text("PEOPLE")
                            .font(.myHeader)
                            .foregroundColor(.myReddish)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 8)
                    }
                    
                    LazyVGrid(columns: [GridItem(), GridItem()]) {
                        ForEach(controller.characters) { element in
                            let isChecked = controller.check(element: element)
                            
                            if (controller.isSpeaking) {
                                IconCard(
                                    text: element.words[0],
                                    color: .myReddish,
                                    type: isChecked ? .disabled : .none
                                )
                            } else {
                                Button {
                                    service.speak(element.words[0])
                                } label: {
                                    IconCard(
                                        text: element.words[0],
                                        color: .myReddish,
                                        type: .none,
                                        hasSpeaker: hasSpeakerIcon()
                                    )
                                }
                                
                            }
                        }
                    }
                    .padding(.bottom, 24)
                    
                }
                
                Spacer()
                
                if (!controller.started) {
                    HStack(spacing: 16) {
                        ElevatedButton(
                            backgroundColor: .myReddish,
                            textColor: .myBackground,
                            text: "QUIT"
                        ) {
                            withAnimation(.spring()) {
                                controller.stop()
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
                            withAnimation(.spring()) {
                                HapticsService.shared.play(.heavy)
                                controller.prepareToPlay()
                                countdown = 3
                                startCountdown()
                            }
                        }
                        .frame(maxWidth: .infinity)
                    }
                    
                } else {
                    HStack(spacing: 16) {
                        ElevatedButton(
                            backgroundColor: .myReddish,
                            textColor: .myBackground,
                            text: "STOP",
                            isDisabled: false
                        ) {
                            withAnimation(.spring()) {
                                HapticsService.shared.notify(.warning)
                                showAlert = true
                                
                                RouterService.shared.showPopUp(
                                    Popup(title: "Do you really want to stop the game?", bodyText: "Any progress you may have made so far won't be saved and the words will be changed", numberOfButtons: 2, buttonText: "NO", action: {
                                        controller.stop()
                                        controller.initialize(
                                            theme: theme,
                                            nounsCount: nounsCount,
                                            verbsCount: verbsCount,
                                            charactersCount: charactersCount
                                        )
                                    })
                                )
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
                            let story = controller.getStory()
                            
                            HapticsService.shared.notify(.success)
                            
                            withAnimation(.spring())
                            {
                                RouterService.shared.navigate(.done(story: story))
                            }
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
            }
            
            .padding(24)
            .background(Color.myBackground)
            .onAppear {
                print("iniciou")
                controller.initialize(
                    theme: theme,
                    nounsCount: nounsCount,
                    verbsCount: verbsCount,
                    charactersCount: charactersCount
                )
            }
            
            if controller.started && countdown > 0 {
                Rectangle()
                    .opacity(0.7)
                    .ignoresSafeArea()
                    .foregroundColor(.myDarkBlue)
                Text("\(countdown)")
                    .font(.myLargeTitle)
                    .foregroundColor(.myBackground)
                    .transition(.scale)
                
                TimerCircleView(timeElapsed: $timeElapsed, totalTime: 1)
                
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
