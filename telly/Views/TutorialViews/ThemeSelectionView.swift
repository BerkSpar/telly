//
//  ThemeSelectionView.swift
//  telly
//
//  Created by Heloisa Pereira Machado on 14/09/23.
//

import SwiftUI

struct ThemeSelectionView: View {
    @State var showAlert = false
    
    @State var workSelection = false
    @State var travellingSelection = false
    @State var shoppingSelection = false
    
    @Binding var themeSelected: String
    
    func getThemeName() -> String {
        if (workSelection) { return "work" }
        if (travellingSelection) { return "traveling" }
        if (shoppingSelection) { return "shopping" }
        
        return ""
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.myGreen)
                .ignoresSafeArea()
            
            VStack(spacing: 32) {
                VStack(spacing: 12) {
                    PageCount(currentPage: 1)
                    SpeechBallon(telly: "tellyIcon", title: "So, to start your storytelling, we’ll choose the theme!", label: "Tap on one of the themes to select it!")
                }
                VStack(spacing: 12) {
                    HStack {
                        Text("Choose the story theme:")
                            .font(.myBody)
                        Spacer()
                    }
                    .padding(.horizontal, 32)
                    
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
                        withAnimation(.spring()){
                            HapticsService.shared.play(.medium)
                            
                            themeSelected = getThemeName()
                            
                            
                            
                            if (getThemeName() == "") {
                                showAlert = true
                                
                                return
                            }
                            RouterService.shared.onboarding(.wordsSelection)
                        }
                    }
                )}
            
            .padding(32)
            .ignoresSafeArea()
            
        }
        .overlay{
            Popup(alert: $showAlert, title: "You need to select one theme", bodyText: "", numberOfButtons: 1, buttonText: "OK", action: {
                print("ok")
            })
        }
        
    }
}

struct ThemeSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeSelectionView(themeSelected: .constant("work"))
    }
}
