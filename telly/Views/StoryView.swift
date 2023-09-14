//
//  StoryView.swift
//  telly
//
//  Created by Heloisa Pereira Machado on 31/08/23.
//

import SwiftUI
import Speech
import AVFAudio

struct StoryView: View {
    
    @State var workSelection = false
    @State var travellingSelection = false
    @State var shoppingSelection = false
    
    @State var noun2Selection = true
    @State var noun3Selection = false
    @State var noun4Selection = false
    
    @State var verb0Selection = true
    @State var verb1Selection = false
    @State var verb2Selection = false
    
    @State var people0Selection = true
    @State var people1Selection = false
    @State var people2Selection = false
    
    @State private var currentElements: [ElementModel] = []

    func getThemeName() -> String {
        if (workSelection) { return "work" }
        if (travellingSelection) { return "traveling" }
        if (shoppingSelection) { return "shopping" }
        
        return ""
    }
    
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
    
    func verifyAuthentication(_ completion: @escaping () -> Void) {
        if (SFSpeechRecognizer.authorizationStatus() != .authorized || AVAudioSession.sharedInstance().recordPermission != .granted) {
            RouterService.shared.navigate(.authorization(completion: completion))
            return;
        }
        
        completion()
    }
    
    var body: some View {
        VStack(spacing: 24) {

            VStack {
                HStack {
                    Text("Choose the story theme:")
                        .font(.myBody)
                    Spacer()
                }
                .padding(.horizontal, 24)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        Button {
                            workSelection.toggle()
                            travellingSelection = false
                            shoppingSelection = false

                            HapticsService.shared.play(.medium)
                        } label: {
                            ImageCard(title: "WORKSPACE", image: "category_workspace", isSelected: $workSelection)
                        }

                        Button {
                            travellingSelection.toggle()
                            workSelection = false
                            shoppingSelection = false
                            
                            HapticsService.shared.play(.medium)
                        } label: {
                            ImageCard(title: "TRAVELLING", image: "category_travelling", isSelected: $travellingSelection)
                        }
                        
                        Button {
                            shoppingSelection.toggle()
                            travellingSelection = false
                            workSelection = false
                            
                            HapticsService.shared.play(.medium)
                        } label: {
                            ImageCard(title: "SHOPPING", image: "category_shopping", isSelected: $shoppingSelection)
                        }
                        
                    }
                    .padding(.horizontal, 24)
                    .padding(.vertical, 2)
                }
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
                    HStack(spacing: 12) {
                        Text("NOUNS")
                            .font(.myTitle)
                            .foregroundColor(.myDarkBlue)
                        
                        Spacer()
                        
                        HStack(spacing: 0) {
                            Button {
                                withAnimation(.spring()){
                                    noun2Selection = true
                                    noun3Selection = false
                                    noun4Selection = false
                                    
                                    HapticsService.shared.play(.medium)
                                }
                            } label: {
                                ElevatedTextCard(text: "2", color: .myDarkBlue, selected: noun2Selection)
                                
                            }
                            
                            Button {
                                withAnimation(.spring()){
                                    noun2Selection = false
                                    noun3Selection = true
                                    noun4Selection = false
                                    
                                    HapticsService.shared.play(.medium)
                                }
                            } label: {
                                ElevatedTextCard(text: "3", color: .myDarkBlue, selected: noun3Selection)
                                    
                            }
                            
                            Button {
                                withAnimation(.spring()){
                                    noun2Selection = false
                                    noun3Selection = false
                                    noun4Selection = true
                                    
                                    HapticsService.shared.play(.medium)
                                }
                            } label: {
                                ElevatedTextCard(text: "4", color: .myDarkBlue, selected: noun4Selection)
//
                            }
                        }
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.myDarkBlue, lineWidth: 2))
                    }
                    
                    
                    
                    Divider()
                    
                    HStack(spacing: 12) {
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
                    
                    HStack(spacing: 12) {
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

            ElevatedButton(
                backgroundColor: .myDarkBlue,
                textColor: .myBackground,
                text: "START",
                action: {
                    withAnimation(.spring()) {
                        HapticsService.shared.play(.medium)
                        
                        if (getThemeName() == "") {
                            RouterService.shared.showPopUp(Popup(title: "You need to select one theme", bodyText: "", numberOfButtons: 1, buttonText: "OK", action: {
                                print("ok")
                            }))
                            return
                        }
                        
                        if (getNounsCount() == 0) {
                            RouterService.shared.showAlert(Alert(title: Text("You need to select the nouns")))
                            return
                        }
                        
                        verifyAuthentication {
                            RouterService.shared.navigate(.game(
                                theme: getThemeName(),
                                nouns: getNounsCount(),
                                verbs: getVerbsCount(),
                                characters: getPeopleCount()
                            ))
                            
                        }
                    }
                }
            )
            .padding(.horizontal, 24)
            
            Spacer()
        }
        .padding(.top, 16)
        .background(Color.myBackground)

    }
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView()
    }
}
