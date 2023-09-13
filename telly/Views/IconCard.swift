//
//  IconCard.swift
//  telly
//
//  Created by Felipe Passos on 31/08/23.
//

import SwiftUI

enum IconCardType {
    case none
    case disabled
    case enabled
}

struct IconCard: View {
    var text: String?
    var icon: String?
    var iconSize: CGFloat = 40.0
    var color: Color = .myReddish
    var type: IconCardType = .none
    
    func getColor() -> Color {
        switch(type) {
        case .none: return color
        case .enabled: return .myBackground
        case .disabled: return .myGrey
        }
    }
    
    func getIconColor() -> Color {
        switch(type) {
        case .none: return color
        case .enabled: return .myBackground
        case .disabled: return .myGrey
        }
    }
    
    var body: some View {
        ElevatedCard(
            color: getColor(),
            backgroundColor: type == .enabled ? color : .myBackground, hasStroke: true
        ) {
            VStack(spacing: 16) {
                if (text != nil) {
                    HStack {
                        Text(text!)
                            .font(.myCard)
                            .foregroundColor(getColor())
                        
                        
                        Spacer()
                        
    //                    Image(systemName: "speaker.wave.3.fill")
    //                        .foregroundColor(getColor())
                    }
                }
                
                if (icon != nil) {
                    Image(systemName: icon!)
                        .resizable()
                        .scaledToFit()
                        .frame(height: iconSize)
                        .font(.system(size: iconSize))
                        .foregroundColor(getIconColor())
                        
                    
                }
            }
            .padding(16)
        }
    }
}

struct IconCard_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 16) {
            HStack(spacing: 16) {
                IconCard(
                    text: "Schedule",
                    icon: "book",
                    type: .disabled
                )
                
                IconCard(
                    text: "Schedule",
                    icon: "book",
                    type: .enabled
                )
            }
            .padding([.leading, .trailing], 16)
            
            HStack(spacing: 16) {
                IconCard(
                    text: "Schedule",
                    icon: "book",
                    type: .none
                )
                
                IconCard(
                    icon: "book",
                    iconSize: 16,
                    type: .enabled
                )
            }
            .padding([.leading, .trailing], 16)
        }
    }
}
