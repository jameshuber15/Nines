//
//  DiscardPile.swift
//  Three-Down
//
//  Created by James HUBER on 2/9/18.
//  Copyright © 2018 James HUBER. All rights reserved.
//

import Foundation

class DiscardPile: CardGroup {
    internal var topCard: PlayingCard
    internal var numTopCards: Int
    
    override init() {
        self.topCard = PlayingCard()
        self.numTopCards = 0
        super.init()
    }
    
    func setTopCard(topCard: PlayingCard) {
        self.topCard = topCard
    }
    
    func setNumTopCards(numTopCards: Int) {
        self.numTopCards = numTopCards
    }
    
    func getTopCard() -> PlayingCard{
        return topCard
    }
    
    func getNumTopCards() -> Int {
        return numTopCards
    }
    
    
    func emptyDiscardPile() {
        self.topCard = PlayingCard()
        self.numTopCards = 0
        self.cards = []
    }
    
    override func toString() -> String {
        var result = "Discard Pile: "
        if cards.count == 0 {
            return result + "Empty"
        }
        
        for x in cards.count-1...0{
            result = "\(result) \(cards[x].toString())"
        }
        return result
    }
}

