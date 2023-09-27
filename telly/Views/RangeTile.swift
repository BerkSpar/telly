//
//  SelectableTile.swift
//  telly
//
//  Created by Felipe Passos on 31/08/23.
//

import SwiftUI

struct RangeTile: View {
    var range: ClosedRange<Int>
    var color: Color = .reddish
    var text: LocalizedStringKey
    
    @Binding var selected: Int?
    
    var body: some View {
        HStack {
            Text(text)
                .font(.myTitle)
                .foregroundColor(color)
            
            Spacer()
            
            HStack(spacing: 16) {
                ForEach(range, id: \.hashValue) { value in
                    ElevatedTextCard(
                        text: "\(value)",
                        color: color,
                        selected: selected == value
                    )
                    .onTapGesture {
                        selected = value
                    }
                }
            }
        }
    }
}

struct RangeTile_Previews: PreviewProvider {
    static var previews: some View {
        RangeTile(
            range: 0...2,
            text: "NOUNS",
            selected: .constant(0)
        )
        .padding(16)
    }
}
