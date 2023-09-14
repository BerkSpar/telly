//
//  AnimatedIcon.swift
//  telly
//
//  Created by Felipe Passos on 13/09/23.
//

import SwiftUI

struct AnimatedIcon: View {
    @State var animate: Bool = false
    
    let animationDuration: Double = 1.0

    var body: some View {
        Image(systemName: "mic.fill")
            .font(.system(size: 12))
            .padding(8)
            .background(Color.myGreen)
            .opacity(animate ? 1 : 0.5)
            .cornerRadius(100)
            .animation(.easeInOut(duration: animationDuration), value: animate)
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: animationDuration, repeats: true) { _ in
                    self.animate.toggle()
                }
            }
    }
}

struct AnimatedIcon_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedIcon()
    }
}
