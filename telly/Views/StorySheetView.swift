//
//  StorySheetView.swift
//  telly
//
//  Created by Felipe Passos on 12/09/23.
//

import SwiftUI

struct StorySheetView: View {
    @Binding var story: StoryModel
    
    @State private var text = ""
    @State private var isEditing: Bool = false
    
    enum FocusField: Hashable {
        case title
    }
    @FocusState private var focused: FocusField?
    
    var body: some View {
        VStack(spacing: 0) {
            Text(story.date)
                .multilineTextAlignment(.center)
                .padding(.bottom, 8)
                .font(.system(size: 14))
                .foregroundColor(.myGrey)
            
            if (isEditing) {
                HStack {
                    TextField(text: $text) {
                        Text("Title")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 16)
                    .font(.myHeader)
                    .focused($focused, equals: .title)
                    .onAppear {
                        self.focused = .title
                    }
                    
                    Spacer()
                    
                    Button {
                        story.title = text
                        
                        StorageService.shared.update(story: story)
                        
                        isEditing = false
                    } label: {
                        Image(systemName: "checkmark.circle")
                            .padding(.bottom, 16)
                            .font(.myHeader)
                    }
                }
            } else {
                HStack {
                    Text(story.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 16)
                        .font(.myHeader)
                        .onAppear {
                            self.focused = .none
                        }
                    
                    Spacer()
                    
                    Button {
                        text = story.title
                        isEditing = true
                    } label: {
                        Image(systemName: "square.and.pencil")
                            .padding(.bottom, 16)
                            .font(.myHeader)
                    }

                }
            }
            
            
            Group {
                Text("Theme: ")
                    .font(.system(size: 14))
                    .foregroundColor(.myGrey)
                    .bold() +
                Text(story.theme)
                    .font(.system(size: 14))
                    .foregroundColor(.myGrey)
                    
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 8)
            
            Group {
                Text("Words: ")
                    .font(.system(size: 14))
                    .foregroundColor(.myGrey)
                    .bold() +
                Text(story.words.joined(separator: ", "))
                    .font(.system(size: 14))
                    .foregroundColor(.myGrey)
                    
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 16)
            
            Button {
                print(story.audioPath)
                AudioService().playAudio(withPath: story.audioPath)
            } label: {
                ElevatedCard(color: .myDarkBlue, content:  {
                    HStack {
                        Text("Play Audio")
                            .foregroundColor(.myDarkBlue)
                        
                        Spacer()
                        
                        Image(systemName: "play.circle.fill")
                            .foregroundColor(.myDarkBlue)
                    }
                    .padding(16)
                })
            }
            .padding(.bottom, 16)
            
            HStack {
                ShareLink(
                    item: Image("AppIcon"),
                    preview: SharePreview(
                        "Check out \"\(story.title)\" on Telly, my favorite app for learning English through stories! 📖\n",
                        image: Image("AppIcon")
                    )
                ) {
                    IconCard(
                        icon: "square.and.arrow.up",
                        iconSize: 20,
                        color: .myDarkBlue,
                        type: .enabled
                    )
                }
                
                Button {
                    StorageService.shared.remove(byID: story.id)
                    RouterService.shared.hideSheet()
                } label: {
                    IconCard(
                        icon: "trash",
                        iconSize: 20,
                        color: .myReddish,
                        type: .enabled
                    )
                }

            }
        }
        .padding([.leading, .trailing], 32)
    }
}

struct StorySheetView_Previews: PreviewProvider {
    static var previews: some View {
        StorySheetView(story: .constant(StoryModel(title: "Branca de Neve", date: "Today")))
    }
}
