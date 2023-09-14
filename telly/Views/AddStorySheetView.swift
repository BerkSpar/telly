//
//  StorySheetView.swift
//  telly
//
//  Created by Felipe Passos on 12/09/23.
//

import SwiftUI

struct AddStorySheetView: View {
    @State var showAlert = false
    
    @Binding var story: StoryModel
    var onDelete: () -> Void
    
    @State private var text = ""
    @State private var isEditing: Bool = false
    
    let shareText = NSLocalizedString("Check out my story on Telly, my favorite app for learning English through stories! 📖\n", comment: "Share text")
    
    let service = AudioService()
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    enum FocusField: Hashable {
        case title
    }
    @FocusState private var focused: FocusField?
    
    var body: some View {
        VStack(spacing: 0) {
            Text(story.date)
                .multilineTextAlignment(.center)
                .padding(.bottom, 8)
                .padding(.top, 16)
                .font(.system(size: 14))
                .foregroundColor(.myGrey)
            
            Spacer()
            
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
                let path = getDocumentsDirectory().appendingPathComponent("\(story.id).m4a").path()
                service.playAudio(withPath: path)
            } label: {
                ElevatedCard(color: .myDarkBlue, hasStroke: true, content:  {
                    HStack {
                        Text("Play Audio")
                            .foregroundColor(.myDarkBlue)
                        
                        Spacer()
                        
                        Image(systemName: "play.circle.fill")
                            .font(.system(size: 32))
                            .foregroundColor(.myDarkBlue)
                    }
                    .padding(16)
                })
            }
            .padding(.bottom, 16)
        }
        .padding([.leading, .trailing], 32)
    }
}

struct AddStorySheetView_Previews: PreviewProvider {
    static var previews: some View {
        AddStorySheetView(story: .constant(StoryModel(title: "Branca de Neve", date: "Today"))) {}
    }
}
