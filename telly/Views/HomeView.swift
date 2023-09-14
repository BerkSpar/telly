//
//  HomeView.swift
//  telly
//
//  Created by Felipe Passos on 24/08/23.
//

import SwiftUI

struct HomeView: View {
    @State var storyViewIsSelected = true
    @State var storybookViewIsSelected = false
    
    @State var showAlert = false
    
    @GestureState private var dragOffset: CGSize = .zero
    
    var body: some View {
        let dragGesture = DragGesture()
            .updating($dragOffset) { dragValue, state, _ in
                state = dragValue.translation
            }
            .onEnded { dragValue in
                withAnimation {
                    if dragValue.translation.width < -50 { // Swipe to the left
                        if storyViewIsSelected {
                            storyViewIsSelected = false
                            storybookViewIsSelected = true
                        }
                    } else if dragValue.translation.width > 50 { // Swipe to the right
                        if storybookViewIsSelected {
                            storyViewIsSelected = true
                            storybookViewIsSelected = false
                        }
                    }
                }
            }
        
        return VStack(spacing: 0) {
            Header()
            
            Tab(storyIsSelected: $storyViewIsSelected, storybookIsSelected: $storybookViewIsSelected)
            
            if storyViewIsSelected {
                StoryView(alert: $showAlert)
                    .transition(.move(edge: .leading))
            } else if storybookViewIsSelected {
                StorybookView()
                    .transition(.move(edge: .trailing))
            }
        }
        .background(Color.myBackground)
        .padding(.top, 40)
        .ignoresSafeArea()
        .gesture(dragGesture)
        .overlay{
            Popup(alert: $showAlert, title: "You need to select one theme", bodyText: "", numberOfButtons: 1, buttonText: "OK", action: {
                print("ok")
            })
        }
        .overlay{
            Popup(alert: $showAlert, title: "Are you sure that you want to delete your story?", bodyText: "You won't be able to recover your audio afterwards", numberOfButtons: 2, buttonText: "NO", action: {
                print("ok")
            })
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
