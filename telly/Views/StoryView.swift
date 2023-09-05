//
//  StoryView.swift
//  telly
//
//  Created by Heloisa Pereira Machado on 31/08/23.
//

import SwiftUI

struct StoryView: View {
    @State var workSelection = false
    @State var travellingSelection = false
    @State var shoppingSelection = false
    
    @State var noun2Selection = false
    @State var noun3Selection = false
    @State var noun4Selection = false
    
    @State var verb0Selection = false
    @State var verb1Selection = false
    @State var verb2Selection = false
    
    @State var people0Selection = false
    @State var people1Selection = false
    @State var people2Selection = false
    
    @State private var currentElements: [ElementModel] = []
    
    var body: some View {
        VStack(spacing: 24) {
            VStack {
                HStack {
                    Text("Choose the story theme")
                        .font(.myBody)
                    Spacer()
                }
                .padding(.horizontal, 32)
                
                ScrollView(.horizontal) {
                    HStack(spacing: 16) {
                        Button {
                            workSelection.toggle()
                            travellingSelection = false
                            shoppingSelection = false
                            
                            
                        } label: {
                            ImageCard(title: "WORKSPACE", image: "category_workspace", isSelected: $workSelection)
                        }
                        
                        Button {
                            travellingSelection.toggle()
                            workSelection = false
                            shoppingSelection = false
                            
                        } label: {
                            ImageCard(title: "TRAVELLING", image: "category_travelling", isSelected: $travellingSelection)
                        }
                        
                        Button {
                            shoppingSelection.toggle()
                            travellingSelection = false
                            workSelection = false
                            
                        } label: {
                            ImageCard(title: "SHOPPING", image: "category_shopping", isSelected: $shoppingSelection)
                        }
                        
                    }
                    .padding(.horizontal, 32)
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
                .padding(.horizontal, 32)
                
                VStack{
                    HStack(spacing: 12) {
                        Text("NOUNS")
                            .font(.myTitle)
                            .foregroundColor(.myDarkBlue)
                        
                        Spacer()
                        
                        Button {
                            noun2Selection.toggle()
                            noun3Selection = false
                            noun4Selection = false
                            
                        } label: {
                            ElevatedTextCard(text: "2", color: .myDarkBlue, selected: noun2Selection)
                        }
                        
                        Button {
                            noun2Selection = false
                            noun3Selection.toggle()
                            noun4Selection = false
                            
                        } label: {
                            ElevatedTextCard(text: "3", color: .myDarkBlue, selected: noun3Selection)
                        }
                        
                        Button {
                            noun2Selection = false
                            noun3Selection = false
                            noun4Selection.toggle()
                            
                        } label: {
                            ElevatedTextCard(text: "4", color: .myDarkBlue, selected: noun4Selection)
                        }
                    }
                    
                    Divider()
                    
                    HStack(spacing: 12) {
                        Text("VERBS")
                            .font(.myTitle)
                            .foregroundColor(.myPurple)
                        
                        Spacer()
                        
                        Button {
                            verb0Selection.toggle()
                            verb1Selection = false
                            verb2Selection = false
                            
                        } label: {
                            ElevatedTextCard(text: "0", color: .myPurple, selected: verb0Selection)
                        }
                        
                        Button {
                            verb0Selection = false
                            verb1Selection.toggle()
                            verb2Selection = false
                            
                        } label: {
                            ElevatedTextCard(text: "1", color: .myPurple, selected: verb1Selection)
                        }
                        
                        Button {
                            verb0Selection = false
                            verb1Selection = false
                            verb2Selection.toggle()
                            
                        } label: {
                            ElevatedTextCard(text: "2", color: .myPurple, selected: verb2Selection)
                        }
                    }
                    
                    Divider()
                    
                    HStack(spacing: 12) {
                        Text("PEOPLE")
                            .font(.myTitle)
                            .foregroundColor(.myReddish)
                        
                        Spacer()
                        
                        Button {
                            people0Selection.toggle()
                            people1Selection = false
                            people2Selection = false
                            
                        } label: {
                            ElevatedTextCard(text: "0", color: .myReddish, selected: people0Selection)
                        }
                        
                        Button {
                            people0Selection = false
                            people1Selection.toggle()
                            people2Selection = false
                            
                        } label: {
                            ElevatedTextCard(text: "1", color: .myReddish, selected: people1Selection)
                        }
                        
                        Button {
                            people0Selection = false
                            people1Selection = false
                            people2Selection.toggle()
                            
                        } label: {
                            ElevatedTextCard(text: "2", color: .myReddish, selected: people2Selection)
                        }
                    }
                } .padding(.horizontal, 32)
            }
            ElevatedButton(backgroundColor: .myDarkBlue, textColor: .myGreen, text: "START", action: { RouterService.shared.navigate(.game)
                
            })
            
            Spacer()
        }
        .padding(.top, 16)
        .background(.white)
        
    }
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView()
    }
}
