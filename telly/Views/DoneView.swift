//
//  DoneView.swift
//  telly
//
//  Created by Heloisa Pereira Machado on 28/08/23.
//

import SwiftUI

struct DoneView: View {
    var theme: String
    
    private func reportAchievements() {
        GameService.shared.reportAchievement(identifier: "page_01", progress: 100.00)
        GameService.shared.reportAchievement(identifier: "trilogy", progress: 1/3 * 100.00)
        GameService.shared.reportAchievement(identifier: "each_month", progress: 1/12 * 100.00)
        GameService.shared.reportAchievement(identifier: "a_to_z", progress: 1/26 * 100.00)
        
        if theme == "work" { GameService.shared.reportAchievement(identifier: "you_better_work", progress: 100.00) }
        if theme == "traveling" { GameService.shared.reportAchievement(identifier: "beachbound", progress: 100.00) }
        if theme == "shopping" { GameService.shared.reportAchievement(identifier: "lets_go_shopping", progress: 100.00) }
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.myGreen)
            VStack(spacing: 32) {
                VStack {
                    Text("Well done!")
                        .font(.myLargeTitle)
                        .foregroundColor(.myDarkGrey)
                    
                    Text("You made an awesome story!")
                        .font(.title3)
                        .bold()
                        .foregroundColor(.myDarkGrey)
                }
                
                ElevatedButton(backgroundColor: .myDarkBlue, textColor: .myGreen, text: "RETURN TO\nMAIN PAGE", isDisabled: false, action: {
                    HapticsService.shared.play(.heavy)
                    
                    reportAchievements()
                    
                    RouterService.shared.navigate(.home)
                    
                })
                .padding(.horizontal, 24)
            }
            
        }
        .ignoresSafeArea()
    }
}

struct DoneView_Previews: PreviewProvider {
    static var previews: some View {
        DoneView(theme: "workspace")
    }
}
