//
//  CardGroup.swift
//  Three-Down
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
                if self.cards[y].getRank() < self.cards[lowest].getRank(){
                    lowest = y
                }
            }
            
            if x != lowest {
                self.cards.swapAt(x, lowest)
            }
        }
        print("Before: \(self.toString())\n")
        push2And10ToEnd()
        print("After: \(self.toString())\n\n")
    }
    
    func push2And10ToEnd() {
        var twoAndTen: [PlayingCard] = []
        var count = 0
        for x in 0..<self.cards.count {
            if cards[x].getRank() == 2 || cards[x].getRank() == 10 {
                twoAndTen.append(cards[x])
            } else {
                cards[count] = cards[x]
                count+=1
            }
        }

        for z in 0..<twoAndTen.count {
            cards[count] = twoAndTen[z]
            count+=1
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
        if cards.count == 0 {
            return result + "Empty"
        }
        for x in 0..<cards.count{
            result = "\(result) \(cards[x].toString())"
        }
        return result
    }
}
