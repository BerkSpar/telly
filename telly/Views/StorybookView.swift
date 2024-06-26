//
//  StorybookView.swift
//  telly
//
//  Created by Heloisa Pereira Machado on 31/08/23.
//

import SwiftUI
import AVFAudio

struct StorybookView: View {
    @State var stories:[StoryModel] = StorageService.shared.listAll().reversed()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                if (GameService.shared.player.isAuthenticated) {
                    ElevatedButton(backgroundColor: .darkBlue,
                                   textColor: .background,
                                   text: "ACHIEVEMENTS") {
                        HapticsService.shared.play(.medium)
                        GameService.shared.showAchievements()
                    }
                }
                
                if (!stories.isEmpty) {
                    VStack {
                        HStack {
                            Text("MY STORIES")
                                .font(.myTitle)
                                .foregroundColor(.darkBlue)
                            
                            Spacer()
                        }
                        
                        VStack(spacing: 16) {
                            ForEach(stories, id: \.id) { story in
                                Story(storyModel: story) {
                                    stories = StorageService.shared.listAll().reversed()
                                }
                            }
                        }
                    }
                }
            }
            .padding(.vertical, 32)
            .padding(.horizontal, 24)
        }
        .background(Color.background)
    }
}

struct StorybookView_Previews: PreviewProvider {
    static var previews: some View {
        StorybookView()
    }
}
