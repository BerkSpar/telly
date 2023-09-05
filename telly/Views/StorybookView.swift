//
//  StorybookView.swift
//  telly
//
//  Created by Heloisa Pereira Machado on 31/08/23.
//

import SwiftUI

struct StorybookView: View {
    var body: some View {
        VStack(spacing: 32) {
            VStack {
            HStack{
                Text("UNDER MAINTENACE")
                    .font(.myTitle)
                    .foregroundColor(.myDarkBlue)
                    .background(.white)
                
                Spacer()
            }
            
                HStack {
                    Text("Soon we will have a page where you can view your stories")
                        .font(.myBody)
                    
                    Spacer()
                }
            }
            
            Image("telly")
            
            Spacer()
        }
        .padding(32)
        .background(.white)
    }
}

struct StorybookView_Previews: PreviewProvider {
    static var previews: some View {
        StorybookView()
    }
}
