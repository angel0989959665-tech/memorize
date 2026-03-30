//
//  ContentView.swift
//  memorize
//
//  Created by yux on 2026/3/16.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J" , "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T"]
    
    @State var emojicount = 6
    
    var body: some View {
        VStack{
            cardList
            Spacer()
            actionButtons
            .font(Font.largeTitle)
        }
        .padding()
        .foregroundStyle(.blue)
    }
    
    var cardList: some View{
        ScrollView{
            LazyVGrid(columns: [GridItem(.adaptive(minimum:85), spacing: 0)], spacing: 0){
                ForEach(emojis[0..<emojicount], id: \.self) { emojis in
                        CardView(content: emojis)
                        .aspectRatio(2/3 , contentMode: .fit)
                        .padding(4)
                }
            }
        }
    }
    
    var actionButtons: some View{
        HStack{
            remove
            Spacer()
            add
        }
    }
    
    var remove : some View{
        Button(action: {
            if emojicount > 1{
                emojicount -= 1
            }
        }, label: {
            Image(systemName: "minus.circle")
        })
    }
    var add : some View{
        Button(action: {
            if emojicount < emojis.count{
                emojicount += 1
            }
        }, label: {
            Image(systemName: "plus.circle")
        })
    }
}

struct CardView : View{
    @State var isFaceUp : Bool = true
    var content : String
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            Group{
                shape.fill(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content)
                    .font(Font.system(size: 300))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1 , contentMode: .fit)
            }
            .opacity(isFaceUp ? 1 : 0)
            
            shape.opacity(isFaceUp ? 0 : 1)
            
        }
        .onTapGesture(perform: {
            isFaceUp = !isFaceUp
        })
    }
}

#Preview {
    ContentView()
}
