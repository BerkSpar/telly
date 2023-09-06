//
//  DoneView.swift
//  telly
//
//  Created by Heloisa Pereira Machado on 28/08/23.
//

import SwiftUI

struct DoneView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.myGreen)
            VStack(spacing: 32) {
                VStack {
                    Text("Well done!")
                        .font(.myLargeTitle)
                        .foregroundColor(.myDarkGrey)
                    
                    Text("You made an awesome story!")
                        .font(.title3)
                        .bold()
                        .foregroundColor(.myDarkGrey)
                }
                
                ElevatedButton(backgroundColor: .myDarkBlue, textColor: .myGreen, text: "RETURN TO\nMAIN PAGE", action: {
                    RouterService.shared.navigate(.home)
                    
                })
            }
            
        }
        .ignoresSafeArea()
    }
}

struct DoneView_Previews: PreviewProvider {
    static var previews: some View {
        DoneView()
    }
}
