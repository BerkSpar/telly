//
//  DoneView.swift
//  telly
//
//  Created by Heloisa Pereira Machado on 28/08/23.
//

import SwiftUI

struct DoneView: View {
    @State var story: StoryModel
    
    private func reportAchievements() {
        GameService.shared.reportAchievement(identifier: "page_01", progress: 100.00)
        GameService.shared.reportAchievement(identifier: "trilogy", progress: 1/3 * 100.00)
        GameService.shared.reportAchievement(identifier: "each_month", progress: 1/12 * 100.00)
        GameService.shared.reportAchievement(identifier: "a_to_z", progress: 1/26 * 100.00)
        
        if story.theme == "work" { GameService.shared.reportAchievement(identifier: "you_better_work", progress: 100.00) }
        if story.theme == "traveling" { GameService.shared.reportAchievement(identifier: "beachbound", progress: 100.00) }
        if story.theme == "shopping" { GameService.shared.reportAchievement(identifier: "lets_go_shopping", progress: 100.00) }
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.myBackground)
            
            VStack {
                Spacer()
                Image("wave")
                    .resizable()
                    .scaledToFit()
            }
            VStack(spacing: 32) {
                VStack {
                    Image("telly_done")
                    
                    Text("Well done!")
                        .font(.myLargeTitle)
                        .foregroundColor(.myDarkGrey)
                    
                    Text("You made an awesome story!")
                        .font(.title3)
                        .bold()
                        .foregroundColor(.myDarkGrey)
                }
                
                VStack(spacing: 16) {
                    ElevatedButton(backgroundColor: .myDarkBlue, textColor: .myBackground, text: "SAVE MY STORY", action: {
                        
                        RouterService.shared.showSheet(
                            StorySheetView(story: $story) {
                                print("")
                            }
                            .presentationDetents([.height(300)])
                        )
                        
                        HapticsService.shared.play(.heavy)
                        reportAchievements()
                        RouterService.shared.navigate(.home)
                        
                    })
                    .padding(.horizontal, 24)
                    
                    Button {
                        HapticsService.shared.play(.heavy)
                        reportAchievements()
                        RouterService.shared.navigate(.home)
                    } label: {
                        Text("I don't want to save my story")
                            .foregroundColor(.myDarkGrey)
                            .underline()
                    }
                }
            }
        }
        .ignoresSafeArea()
    }
}

struct DoneView_Previews: PreviewProvider {
    static var previews: some View {
        DoneView(story: StoryModel())
    }
}
