//
//  ContentView.swift
//  MemoryGameApp
//
//  Created by Eligio Cabras on 22/10/23.
//

import SwiftUI

struct ContentView: View {
    
    var emojis : Array<String> = ["🐻","🐶","🐬","🐟","🍀","🚗","🍎","😍","😉","😓","😳","🌟","🎉","🌺","👽","💀","🐵","🐮","🐎","💣"]
    
    var body: some View {
        HStack(content: {
            CardView(text: emojis[0])
            CardView(text: emojis[0])
            CardView(text: emojis[0])
        })
        .foregroundColor(.red)
    }
}


struct CardView: View {
    
    var text: String
    
    var body: some View {
        var card = RoundedRectangle(cornerRadius: 12)
        ZStack(content: {
            card.fill(.white)
            card.strokeBorder(lineWidth: 4)
            Text(text).font(.largeTitle)
        })
        
    }
}

#Preview {
    ContentView()
}
