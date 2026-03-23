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
            HStack{
                ForEach(emojis[0..<emojicount] , id: \.self) { emoji in
                    CardView(content : emoji)
                }
            }
            
            HStack{
                remove
                Spacer()
                add
            }
            .font(Font.largeTitle)
        }
        .padding()
        .foregroundStyle(.blue)
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
            if isFaceUp{
                shape.strokeBorder(lineWidth: 3)
                shape.fill(.white)
                Text(content).font(.largeTitle)
            }
            else{
                RoundedRectangle(cornerRadius: 20)
            }
        }
        .onTapGesture(perform: {
            isFaceUp = !isFaceUp
        })
    }
}

#Preview {
    ContentView()
}
