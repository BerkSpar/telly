//
//  ElevatedTextCard.swift
//  telly
//
//  Created by Felipe Passos on 31/08/23.
//

import SwiftUI

struct ElevatedTextCard: View {
    let text: LocalizedStringKey
    var color: Color = .reddish
    var selected: Bool = false
    
    var body: some View {
        ElevatedCard(
            color: color,
            backgroundColor: selected ? color : .background
            ,
            content:  {
                Text(text)
                    .font(.system(size: 20))
                    .fontWidth(.expanded)
                    .bold()
                    .foregroundColor(selected ? Color.background : color)
                    .frame(width: 50, height: 40)
                    
            }
        ) 
    }
}

struct ElevatedTextCard_Previews: PreviewProvider {
    static var previews: some View {
        ElevatedTextCard(text: "1", selected: true)
    }
}
