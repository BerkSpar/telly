//
//  WordsSelection.swift
//  telly
//
//  Created by Heloisa Pereira Machado on 14/09/23.
//

import SwiftUI

struct WordsSelection: View {
    @State var noun2Selection = true
    @State var noun3Selection = false
    @State var noun4Selection = false
    
    @State var verb0Selection = true
    @State var verb1Selection = false
    @State var verb2Selection = false
    
    @State var people0Selection = true
    @State var people1Selection = false
    @State var people2Selection = false
    
    @Binding var nouns: Int
    @Binding var verbs: Int
    @Binding var people: Int
    
    func getNounsCount() -> Int {
        if (noun2Selection) { return 2 }
        if (noun3Selection) { return 3 }
        if (noun4Selection) { return 4 }
        
        return 0
    }
    
    func getVerbsCount() -> Int {
        if (verb0Selection) { return 0 }
        if (verb1Selection) { return 1 }
        if (verb2Selection) { return 2 }
        
        return 0
    }
    
    func getPeopleCount() -> Int {
        if (people0Selection) { return 0 }
        if (people1Selection) { return 1 }
        if (people2Selection) { return 2 }
        
        return 0
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.myGreen)
                .ignoresSafeArea()
            
            VStack(spacing: 32) {
                VStack(spacing: 12) {
                    PageCount(currentPage: 2)
                    
                    SpeechBallon(telly: "tellyIcon", title: "Let's choose how many nouns, verbs, and people for your story.", label: "You'll need to use those words while telling your story. More words, greater challenge.")
                }
                VStack {
                    HStack {
                        Text("Choose the quantity of each type of word:")
                            .font(.myBody)
                            .fixedSize(horizontal: false, vertical: true)
                        Spacer()
                    }
                    .padding(.horizontal, 24)
                    
                    VStack(spacing: 12){
                        HStack(spacing: 4) {
                            Text("NOUNS")
                                .font(.myTitle)
                                .foregroundColor(.myDarkBlue)
                            
                            Spacer()
                            
                            HStack(spacing: 0) {
                                Button {
                                    noun2Selection = true
                                    noun3Selection = false
                                    noun4Selection = false
                                    
                                    HapticsService.shared.play(.medium)
                                } label: {
                                    ElevatedTextCard(text: "2", color: .myDarkBlue, selected: noun2Selection)
                                }
                                
                                Button {
                                    noun2Selection = false
                                    noun3Selection = true
                                    noun4Selection = false
                                    
                                    HapticsService.shared.play(.medium)
                                } label: {
                                    ElevatedTextCard(text: "3", color: .myDarkBlue, selected: noun3Selection)
                                }
                                
                                Button {
                                    noun2Selection = false
                                    noun3Selection = false
                                    noun4Selection = true
                                    
                                    HapticsService.shared.play(.medium)
                                } label: {
                                    ElevatedTextCard(text: "4", color: .myDarkBlue, selected: noun4Selection)
                                }
                            }
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.myDarkBlue, lineWidth: 2))
                        }
                        
                        Divider()
                        
                        HStack(spacing: 4) {
                            Text("VERBS")
                                .font(.myTitle)
                                .foregroundColor(.myPurple)
                            
                            Spacer()
                            
                            HStack(spacing: 0) {
                                Button {
                                    verb0Selection = true
                                    verb1Selection = false
                                    verb2Selection = false
                                    
                                    HapticsService.shared.play(.medium)
                                } label: {
                                    ElevatedTextCard(text: "0", color: .myPurple, selected: verb0Selection)
                                }
                                
                                Button {
                                    verb0Selection = false
                                    verb1Selection = true
                                    verb2Selection = false
                                    
                                    HapticsService.shared.play(.medium)
                                } label: {
                                    ElevatedTextCard(text: "1", color: .myPurple, selected: verb1Selection)
                                }
                                
                                Button {
                                    verb0Selection = false
                                    verb1Selection = false
                                    verb2Selection = true
                                    
                                    HapticsService.shared.play(.medium)
                                } label: {
                                    ElevatedTextCard(text: "2", color: .myPurple, selected: verb2Selection)
                                }
                            }
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.myPurple, lineWidth: 2))
                        }
                        
                        Divider()
                        
                        HStack(spacing: 4) {
                            Text("PEOPLE")
                                .font(.myTitle)
                                .foregroundColor(.myReddish)
                            
                            Spacer()
                            
                            HStack(spacing: 0) {
                                Button {
                                    people0Selection.toggle()
                                    people1Selection = false
                                    people2Selection = false
                                    
                                    HapticsService.shared.play(.medium)
                                } label: {
                                    ElevatedTextCard(text: "0", color: .myReddish, selected: people0Selection)
                                }
                                
                                Button {
                                    people0Selection = false
                                    people1Selection.toggle()
                                    people2Selection = false
                                    
                                    HapticsService.shared.play(.medium)
                                } label: {
                                    ElevatedTextCard(text: "1", color: .myReddish, selected: people1Selection)
                                }
                                
                                Button {
                                    people0Selection = false
                                    people1Selection = false
                                    people2Selection.toggle()
                                    
                                    HapticsService.shared.play(.medium)
                                } label: {
                                    ElevatedTextCard(text: "2", color: .myReddish, selected: people2Selection)
                                }
                            }
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.myReddish, lineWidth: 2))
                        }
                    } .padding(.horizontal, 24)
                    
                    
                }
                .padding(.vertical, 16)
                .padding(.bottom, 8)
                
                .overlay(
                    RoundedRectangle(cornerRadius: 24)
                        .stroke(Color.myDarkBlue, lineWidth: 4))
                
                .background(
                    RoundedRectangle(cornerRadius: 24)
                        .fill(Color.myBackground)
                )
                ElevatedButton(
                    backgroundColor: .myDarkBlue,
                    textColor: .myBackground,
                    text: "NEXT",
                    action: {
                        withAnimation(.spring()) {
                            HapticsService.shared.play(.medium)
                            
                            nouns = getNounsCount()
                            verbs = getVerbsCount()
                            people = getPeopleCount()
                            
                            RouterService.shared.onboarding(.tips)
                            
                        }}
                )}
                    
            
            .padding(32)
            
//            VStack {
//                Spacer()
//                PageCount(currentPage: 2)
//            }
            .ignoresSafeArea()
        }
    }
}
struct WordsSelection_Previews: PreviewProvider {
    static var previews: some View {
        WordsSelection(nouns: .constant(0), verbs: .constant(0), people: .constant(0))
    }
}
