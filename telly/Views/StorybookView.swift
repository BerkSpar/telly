//
//  StorybookView.swift
//  telly
//
//  Created by Heloisa Pereira Machado on 31/08/23.
//

import SwiftUI
import AVFoundation

struct StorybookView: View {
    
    private var audioPlayer: AVAudioPlayer?
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func play() {
        print("PLAY")
        
        let audioFilename = getDocumentsDirectory().appendingPathComponent("voiceRecording.m4a")
        
        if FileManager.default.fileExists(atPath: audioFilename.path) {
            print("File exists!")
        } else {
            print("File not found!")
        }
        
        let player = AudioService()
        player.playAudio(withPath: audioFilename.path)
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                if (GameService.shared.player.isAuthenticated) {
                    ElevatedButton(backgroundColor: .myDarkBlue, textColor: .myGreen, text: "ACHIEVEMENTS") {
                        GameService.shared.showAchievements()
                    }
                }
                
                VStack {
                    HStack {
                        Text("MY STORIES")
                            .font(.myTitle)
                            .foregroundColor(.myDarkBlue)
                            .onTapGesture {
                                play()
                            }
                        
                        Spacer()
                    }
                        VStack(spacing: 16) {
                            ForEach(StoryData.myStories, id: \.self) { story in
                                Story(storyModel: story)
                                    
                            
                        }
                    }
                    
                }
            }
            .padding(.vertical, 32)
            .padding(.horizontal, 32)
        }
        .background(Color.myBackground)
    }
}

struct StorybookView_Previews: PreviewProvider {
    static var previews: some View {
        StorybookView()
    }
}
