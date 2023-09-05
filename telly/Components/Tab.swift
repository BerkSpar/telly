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
    
    var firstButtonText = "NEW STORY"
    var secondButtonText = "STORYBOOK"
    
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
            return .white
        } else {
            return .clear
        }
    }
    
    var body: some View {
        HStack(spacing: 0) {
            Button {
                storyIsSelected.toggle()
                storybookIsSelected.toggle()
                
            } label: {
                TabLabel(isSelected: $storyIsSelected, text: firstButtonText, corner: storyCorner(view: storyIsSelected))
                
            }
            .background(hasBackground(view: storyIsSelected))
            .buttonStyle(PlainButtonStyle())
            
            Button {
                storyIsSelected.toggle()
                storybookIsSelected.toggle()
                
            } label: {
                TabLabel(isSelected: $storybookIsSelected, text: secondButtonText, corner: storybookCorner(view: storybookIsSelected))
                
            }
            .background(hasBackground(view: storybookIsSelected))
            .buttonStyle(PlainButtonStyle())
            
        }
    }
    struct Tab_Previews: PreviewProvider {
        static var previews: some View {
            Tab(storyIsSelected: .constant(true), storybookIsSelected: .constant(false))
        }
    }
}
