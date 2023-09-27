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
                StoryView()
                    .transition(.move(edge: .leading))
            } else if storybookViewIsSelected {
                StorybookView()
                    .transition(.move(edge: .trailing))
            }
        }
        .background(Color.background)
        .padding(.top, 40)
        .ignoresSafeArea()
        .gesture(dragGesture)
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
