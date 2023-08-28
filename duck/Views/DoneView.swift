//
//  DoneView.swift
//  duck
//
//  Created by Heloisa Pereira Machado on 28/08/23.
//

import SwiftUI

struct DoneView: View {
    var body: some View {
        VStack {
            Text("Boa, tá falando inglês já")
            
            Button("Fazer outra história") {
                RouterService.shared.navigate(.home)
            }
        }
    }
}

struct DoneView_Previews: PreviewProvider {
    static var previews: some View {
        DoneView()
    }
}
