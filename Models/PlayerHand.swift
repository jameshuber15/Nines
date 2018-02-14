//
//  PlayerHand.swift
//  Three-Down
//
//  Created by James HUBER on 2/7/18.
//  Copyright © 2018 James HUBER. All rights reserved.
//

import UIKit

class PlayerHand : CardGroup {
    internal var upCards: [PlayingCard]
    internal var downCards: [PlayingCard]

    override init() {
        upCards = []
        downCards = []
        super.init()
    }
    
    override init(cards : [PlayingCard]) {
        upCards = []
        downCards = []
        super.init(cards: cards)
    }
    
    func mergeDiscardPile(discardPile: [PlayingCard]) {
        self.cards.append(contentsOf: discardPile)
        self.sortHandByRank()
    }
    
    func findValidCards(topCard: PlayingCard) -> [PlayingCard] {
        var playableCards : [PlayingCard] = []
        for card in 0 ..< cards.count {
            if topCard.getRank() <= cards[card].getRank() {
                playableCards.append(cards[card])
            } else if cards[card].getRank() == 10 || cards[card].getRank() == 2 {
                playableCards.append(cards[card])
            }
        }
        return playableCards
    }
    
    func setUpCards(upCards: [PlayingCard]) {
        self.upCards = upCards
    }
    
    func getUpCards() -> [PlayingCard] {
        return upCards
    }
    
    func setDownCards(downCards: [PlayingCard]) {
        self.downCards = downCards
    }
    
    func getDownCards() -> [PlayingCard] {
        return downCards
    }
    
    override func toString() -> String {
        var result = "Hand: "
        if cards.count == 0 {
            result += "Empty\n"
        } else {
            for x in 0..<cards.count{
                result = "\(result) \(cards[x].toString())"
            }
        }
        
        result += "\nCards up: "
        if upCards.count == 0 {
            result += "Empty\n"
        } else {
            for x in 0..<upCards.count{
                result = "\(result) \(upCards[x].toString())"
            }
        }
        result += "Number of down cards: \(self.downCards.count)"

        return result
    }
}
