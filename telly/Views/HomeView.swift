//
//  HomeView.swift
//  telly
//
//  Created by Felipe Passos on 24/08/23.
//

import SwiftUI

struct HomeView: View {
    @State private var text = "Home View"
    @State var storyViewIsSelected = true
    @State var storybookViewIsSelected = false
    
    var body: some View {
        VStack(spacing: 0) {
            Header()
            
            Tab(storyIsSelected: $storyViewIsSelected, storybookIsSelected: $storybookViewIsSelected)
            
            if storyViewIsSelected {
                StoryView()
            } else if storybookViewIsSelected {
                StorybookView()
            }
        }
        
        .background(Color.myDarkBlue)
        .padding(.top, 32)
        .ignoresSafeArea()
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

