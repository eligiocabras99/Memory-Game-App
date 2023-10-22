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
            HStack{
                ForEach(0..<cardCount, id: \.self){ index in
                    CardView(text: emojis[index], isFaceUp: true)
                }
            }
            .foregroundColor(.red)
            HStack{
                addCard
                Spacer()
                removeCard
            }
        }
        .padding()
    }
    
    
    var addCard: some View{
        //Label("Add Folder", systemImage: "rectangle.stack.badge.plus.fill")
        Button(action: {
            if cardCount < emojis.count{
                cardCount += 1
            }
        }, label: {
            Image(systemName: "rectangle.stack.badge.plus.fill")
        }).font(.largeTitle)
    }
    
    var removeCard: some View{
        //Label("Add Folder", systemImage: "rectangle.stack.badge.plus.fill")
        Button(action: {
            if cardCount > 1{
                cardCount -= 1
            }
        }, label: {
            Image(systemName: "rectangle.stack.badge.minus.fill")
        }).font(.largeTitle)
    }
    
    
}


struct CardView: View {
    
    var text: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        let card = RoundedRectangle(cornerRadius: 12)
        
        ZStack{
            if isFaceUp == true{
                card.fill(.white)
                card.strokeBorder(lineWidth: 4)
                Text(text).font(.largeTitle)
            }else{
                card.fill(.red)
            }
        }.onTapGesture {
            isFaceUp.toggle() //isFaceUp = !isFaceUp
        }
        
    }
}

#Preview {
    ContentView()
}
