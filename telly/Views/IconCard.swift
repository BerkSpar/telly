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
    let text: String
    var icon: String?
    var color: Color = .myReddish
    var type: IconCardType = .none
    
    func getColor() -> Color {
        switch(type) {
            case .none: return color
            case .enabled: return .myBackground
            case .disabled: return .myGrey
        }
    }
    
    var body: some View {
        ElevatedCard(
            color: getColor(),
            backgroundColor: type == .enabled ? color : .myBackground
        ) {
            VStack(spacing: 16) {
                HStack {
                    Text(text)
                        .font(.myCard)
                        .foregroundColor(getColor())
                    
                    Spacer()
                    
                    Image(systemName: "speaker.wave.3.fill")
                        .foregroundColor(getColor())
                }
                
                if (icon != nil) {
                    Text("✈️")
                        .font(.system(size: 40))
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
                    text: "Airplane",
                    icon: "🛩️",
                    type: .none
                )
                
                IconCard(
                    text: "Airplane",
                    icon: "🛩️",
                    type: .enabled
                )
            }
            .padding([.leading, .trailing], 16)
            
            HStack(spacing: 16) {
                IconCard(
                    text: "Airplane",
                    type: .disabled
                )
                
                IconCard(
                    text: "To eat",
                    type: .disabled
                )
            }
            .padding([.leading, .trailing], 16)
        }
    }
}
