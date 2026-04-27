//
//  MemoryGame.swift
//  memorize
//
//  Created by yux on 2026/3/30.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    var cards:[Card]
    var score = 0
    
    init(numberOfPairsOfCards : Int ,
        createCardContent: (Int) -> CardContent){
        cards = []
        for index in 0..<numberOfPairsOfCards {
            let cardContent : CardContent = createCardContent(index)
            cards.append(Card(content: cardContent , id : "\(index)a"))
            cards.append(Card(content: cardContent , id : "\(index)b"))
        }
        shuffle()
    }
    
    var lastFaceUpIndex : Int?
    mutating func choose(_ card: Card) {
        if let chosenIndex = index(of : card) {
            if let lastIndex = lastFaceUpIndex {
                if cards[lastIndex].content == cards[chosenIndex].content {
                    cards[lastIndex].isMatched = true
                    cards[chosenIndex].isMatched = true
                    score += 2   // ⭐ match 加分
                } else {
                    // ❗沒 match 扣分
                    if cards[lastIndex].hasBeenSeen {
                        score -= 1
                    }
                    if cards[chosenIndex].hasBeenSeen {
                        score -= 1
                    }
                }

                cards[lastIndex].hasBeenSeen = true
                cards[chosenIndex].hasBeenSeen = true

                lastFaceUpIndex = nil
            }
             else{
                for i in 0..<cards.count {
                    cards[i].isFaceUp = false
                }
                lastFaceUpIndex = chosenIndex
            }
            cards[chosenIndex].isFaceUp.toggle()
        }
        print("cards : \(cards)")
    }
    
    func index(of card: Card) -> Int? {
        for i in 0..<cards.count {
            if cards[i].id == card.id {
                return i
            }
        }
        return nil
    }
    
    mutating func shuffle() {
        cards.shuffle()
        print("shuffle cards : \(cards)")
    }
    
    struct Card : Equatable , Identifiable{
        static func == (lhs : MemoryGame<CardContent>.Card , rhs:
            MemoryGame<CardContent>.Card) -> Bool {
            lhs.content == rhs.content && lhs.isFaceUp == rhs.isFaceUp &&
            lhs.isMatched == rhs.isMatched && lhs.id == rhs.id
    }
        
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        let content: CardContent
        var hasBeenSeen = false
        
        var id : String
    }
}
