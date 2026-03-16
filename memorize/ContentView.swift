//
//  ContentView.swift
//  memorize
//
//  Created by yux on 2026/3/16.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        HStack{
            CardView(isFaceUp: true)
            CardView(isFaceUp: false)
            CardView()
            CardView()
        }
        
        .padding()
    }
}

struct CardView : View{
    var isFaceUp : Bool = true
    var body: some View {
        ZStack {
            if isFaceUp{
                RoundedRectangle(cornerRadius: 20)
                    .strokeBorder(lineWidth: 3)
                Text("www")
            }
            else{
                RoundedRectangle(cornerRadius: 20)
            }
        }
    }
}

#Preview {
    ContentView()
}
