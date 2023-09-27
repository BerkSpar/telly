//
//  PageCount.swift
//  telly
//
//  Created by Heloisa Pereira Machado on 14/09/23.
//

import SwiftUI

struct PageCount: View {
    var currentPage: Int
    var totalPages = 3
    
    var body: some View {
        
        Text("\(currentPage) of \(totalPages)")
            .font(.system(size: 12))
            .fontWidth(.expanded)
            .fontWeight(.bold)
            .foregroundColor(.darkGrey)
            .padding(.vertical, 12)
            .padding(.horizontal, 24)
//            .background(
//                RoundedRectangle(cornerRadius: 24)
//                    .stroke(Color.darkBlue, lineWidth: 5))
//            .cornerRadius(24, corners: .allCorners)
    }
}

struct PageCount_Previews: PreviewProvider {
    static var previews: some View {
        PageCount(currentPage: 1)
    }
}
