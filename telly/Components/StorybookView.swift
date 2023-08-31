//
//  StorybookView.swift
//  telly
//
//  Created by Heloisa Pereira Machado on 31/08/23.
//

import SwiftUI

struct StorybookView: View {
    var body: some View {
        VStack {
            HStack{
                Text(":)")
                Spacer()
            }
            Text("StorybookView para ver suas histórias")
                .background(.white)
            
            Spacer()
        }
        .background(.white)
    }
}

struct StorybookView_Previews: PreviewProvider {
    static var previews: some View {
        StorybookView()
    }
}
