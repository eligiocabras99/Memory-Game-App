//
//  ContentView.swift
//  MemoryGameApp
//
//  Created by Eligio Cabras on 22/10/23.
//

import SwiftUI

struct ContentView: View {
    //["🐻","🐶","🐬","🐟","🍀","🚗","🍎","😍","😉","😓","😳","🌟","🎉","🌺","👽","💀","🐵","🐮","🐎","💣"]
    
    @State var emojis : Array<String> = []
    
    @State var cardCount: Int = 0
    
    var body: some View {
        VStack{
            Text("Memorize!").font(.largeTitle).bold()
            ScrollView{
                cards
            }
            Spacer()
            //AdjustedBar
            themeBar
        }
        .padding()
    }
    
    var cards: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 60))]) {
            
            ForEach(0..<emojis.count, id: \.self){ index in
                CardView(text: emojis[index], isFaceUp: true)
                    .aspectRatio(2/3, contentMode: .fit)
            }
            
        }
        .foregroundColor(.red)
    }
    
    var themeBar: some View{
        HStack{
            Spacer()
            faceTheme
            Spacer()
            animalTheme
            Spacer()
            fruitTheme
            Spacer()
        }.imageScale(.large)
        
    }
    
    
    func themeChoser(array: Array<String>, symbol: String, theme: String) -> some View{
        Button(action: {
            
            emojis = array + array
            emojis.shuffle()
            
        }, label: {
            VStack{
                Image(systemName: symbol).bold()
                    
                Text(theme).font(.body)
            }
            
        })
        
    }
    
    var faceTheme: some View{
        themeChoser(array: ["😍","😉","😓","😳","👽","💀","😎"], symbol: "face.dashed", theme: "Faces")
    }
    
    var animalTheme: some View{
        themeChoser(array: ["🐵","🐮","🐎","🐻","🐶","🐬","🐟"], symbol: "teddybear", theme: "Animals")
    }
    
    var fruitTheme: some View{
        themeChoser(array: ["🍎","🍌","🍐","🍍","🍏","🥝","🍑"], symbol: "fork.knife", theme: "Food")
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
