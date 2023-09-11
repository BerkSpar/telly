//
//  ProgressBar.swift
//  telly
//
//  Created by Felipe Passos on 06/09/23.
//

import SwiftUI

struct ProgressBar: View {
    @Binding var progress: Double
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(.myBackground)
                    .frame(maxWidth: geo.size.width)
                    .cornerRadius(16)
                    
                
                Rectangle()
                    .foregroundColor(.myDarkBlue)
                    .frame(maxWidth: geo.size.width * progress)
                    .cornerRadius(16, corners: [.topLeft, .bottomLeft])
            }
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.myDarkBlue, lineWidth: 4)
            )
        }
        .frame(height: 16)
        .animation(.linear, value: progress)
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(progress: .constant(0.1))
            .padding(16)
    }
}
