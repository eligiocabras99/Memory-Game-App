//
//  ContentView.swift
//  MemoryGameApp
//
//  Created by Eligio Cabras on 22/10/23.
//

import SwiftUI

struct ContentView: View {
    //["🐻","🐶","🐬","🐟","🍀","🚗","🍎","😍","😉","😓","😳","🌟","🎉","🌺","👽","💀","🐵","🐮","🐎","💣"]
    var emojis : Array<String> = ["🐻","🐶","🐬","🐟","🍀","🚗","😳"]
    
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack{
            ScrollView{
                cards
            }
            Spacer()
            AdjustedBar
        }
        .padding()
    }
    
    var cards: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self){ index in
                CardView(text: emojis[index], isFaceUp: true)
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.red)
    }
    
    var AdjustedBar: some View{
        HStack{
            removeCard
            Spacer()
            addCard
        }
    }
    
    func cardAdjuster(value: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += value
        }, label: {
            Image(systemName: symbol)
        })
        .imageScale(.large)
        .font(.largeTitle)
        .disabled(cardCount + value < 0 || cardCount + value > emojis.count)
    }
    
    
    var addCard: some View{
        //Label("Add Folder", systemImage: "rectangle.stack.badge.plus.fill")
        cardAdjuster(value: 1, symbol: "rectangle.stack.badge.plus.fill")
    }
    
    var removeCard: some View{
        //Label("Add Folder", systemImage: "rectangle.stack.badge.plus.fill")
        cardAdjuster(value: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    
    
}


struct CardView: View {
    
    var text: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        let card = RoundedRectangle(cornerRadius: 12)
        
        ZStack{
            Group{
                card.fill(.white)
                card.strokeBorder(lineWidth: 4)
                Text(text).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            card.fill(.red).opacity(isFaceUp ? 0 : 1)
        }.onTapGesture {
            isFaceUp.toggle() //isFaceUp = !isFaceUp
        }
        
    }
}

#Preview {
    ContentView()
}
