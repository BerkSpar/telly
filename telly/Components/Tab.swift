//
//  Tab.swift
//  telly
//
//  Created by Heloisa Pereira Machado on 31/08/23.
//

import SwiftUI

struct Tab: View {
    
    @Binding var storyIsSelected: Bool
    @Binding var storybookIsSelected: Bool
    
    let firstButtonText: LocalizedStringKey = "NEW STORY"
    let secondButtonText: LocalizedStringKey = "STORYBOOK"
    
    func storyCorner(view: Bool) -> UIRectCorner {
        if view && firstButtonText == "NEW STORY" {
            return [.topRight]
        } else {
            return [.bottomRight]
        }
    }
    
    func storybookCorner(view: Bool) -> UIRectCorner {
        if view && secondButtonText == "STORYBOOK" {
            return [.topLeft]
        } else {
            return [.bottomLeft]
        }
    }
    
    func hasBackground(view: Bool) -> Color {
        if !view {
            return .myBackground
        } else {
            return .clear
        }
    }
    
    var body: some View {
        HStack(spacing: 0) {
            TabLabel(isSelected: $storyIsSelected, text: firstButtonText, corner: storyCorner(view: storyIsSelected))
                .onTapGesture {
                    storyIsSelected = true
                    storybookIsSelected = false
                }
                .background(hasBackground(view: storyIsSelected))
            
            TabLabel(isSelected: $storybookIsSelected, text: secondButtonText, corner: storybookCorner(view: storybookIsSelected))
                .onTapGesture {
                    storyIsSelected = false
                    storybookIsSelected = true
                }
                .background(hasBackground(view: storybookIsSelected))
            
        }
    }
    struct Tab_Previews: PreviewProvider {
        static var previews: some View {
            Tab(storyIsSelected: .constant(true), storybookIsSelected: .constant(false))
        }
    }
}
