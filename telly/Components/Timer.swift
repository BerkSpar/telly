//
//  Timer.swift
//  telly
//
//  Created by Heloisa Pereira Machado on 14/09/23.
//

import SwiftUI

struct TimerCircleView: View {
    @Binding var timeElapsed: Double
        let totalTime: Double
        @State private var isAnimating: Bool = false

        init(timeElapsed: Binding<Double>, totalTime: Double) {
            self._timeElapsed = timeElapsed
            self.totalTime = totalTime
        }

        var body: some View {
            Circle()
                .trim(from: 0, to: CGFloat(timeElapsed / totalTime))
                .stroke(Color.myBackground, lineWidth: 10)
                .frame(width: 150, height: 150)
                .rotationEffect(.degrees(-90))
                .onAppear {
                    startAnimation()
                }
        }

        private func startAnimation() {
            withAnimation(Animation.linear(duration: totalTime)) {
                timeElapsed = totalTime
                isAnimating = true
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + totalTime) {
                // Reset the timer when it completes
                timeElapsed = 0
                isAnimating = false
                startAnimation()
            }
        }
    

    struct TimerCircleView_Previews: PreviewProvider {
        static var previews: some View {
            TimerCircleView(timeElapsed: .constant(0), totalTime: 1)
        }
    }
}
