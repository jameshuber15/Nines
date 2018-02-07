//
//  Deck.swift
//  Nines
//
//  Created by James HUBER on 2/6/18.
//  Copyright © 2018 James HUBER. All rights reserved.
//

import Foundation

class Deck {
    lazy var cards = [PlayingCard]()
    
    func shuffleDeck() {
        for currentCard in 0...cards.count {
            let randomNum:UInt32 = arc4random_uniform(52)
            let num:Int = Int(randomNum)
            (cards[currentCard], cards[num]) = (cards[num], cards[currentCard])
        }
    }
    
    func cutDeck() {
        let randomNum:UInt32 = arc4random_uniform(52)
        let num:Int = Int(randomNum)
        let tempCards = Array(cards[0...num])
        cards.removeSubrange(ClosedRange(uncheckedBounds: (lower: 0, upper: num)))
        cards.append(contentsOf: tempCards)
    }
}
