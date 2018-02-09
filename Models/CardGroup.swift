//
//  CardGroup.swift
//  Nines
//
//  Created by James HUBER on 2/8/18.
//  Copyright © 2018 James HUBER. All rights reserved.
//

import Foundation

class CardGroup {
    internal var cards : [PlayingCard]
    
    init() {
        cards = []
    }
    
    init(cards : [PlayingCard]) {
        self.cards = cards
    }
    
    func sortHandByRank() {
        guard self.cards.count > 1 else { return }
        
        for x in 0 ..< self.cards.count - 1 {
            var lowest = x
            for y in x + 1 ..< self.cards.count {
                if self.cards[y].rank < self.cards[lowest].rank {
                    lowest = y
                }
            }
            
            if x != lowest {
                self.cards.swapAt(x, lowest)
            }
        }
        push2And10ToEnd()
    }
    
    func push2And10ToEnd() {
        for x in 0..<self.cards.count-1 {
            if cards[x].rank == 2 {
                cards.append(cards.remove(at: x))
            }
        }
        for y in 0..<self.cards.count-1 {
            if cards[y].rank == 10 {
                cards.append(cards.remove(at: y))
            }
        }
    }
    
    func shuffleDeck() {
        for currentCard in 0..<cards.count {
            let randomNum:UInt32 = arc4random_uniform(52)
            let num:Int = Int(randomNum)
            (cards[currentCard], cards[num]) = (cards[num], cards[currentCard])
        }
    }
    
    func cutDeck(cutAt: Int) {
        let tempCards = Array(cards[0...cutAt])
        cards.removeSubrange(ClosedRange(uncheckedBounds: (lower: 0, upper: cutAt)))
        cards.append(contentsOf: tempCards)
    }
    
    func getCards() -> [PlayingCard]{
        return cards
    }
    
    func toString() -> String {
        var result = "Hand: "
        for x in 0..<cards.count{
            result = "\(result) \(cards[x].toString())"
        }
        return result
    }
}
