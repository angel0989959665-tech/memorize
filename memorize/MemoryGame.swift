//
//  MemoryGame.swift
//  memorize
//
//  Created by yux on 2026/3/30.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards:[Card]
    
    init(numberOfPairsOfCards : Int ,
        createCardContent: (Int) -> CardContent){
        cards = []
        for index in 0..<numberOfPairsOfCards {
            var CardContent : CardContent = createCardContent(index)
            cards.append(Card(content: CardContent))
            cards.append(Card(content: CardContent))
        }
    }
    
    func choose(card: Card) {
        
    }
    
    struct Card{
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}
