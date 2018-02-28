//
//  PlayerHand.swift
//  Three-Down
//
//  Created by James HUBER on 2/7/18.
//  Copyright © 2018 James HUBER. All rights reserved.
//

import UIKit

class PlayerHand : CardGroup {
    internal var upCards: CardGroup = CardGroup()
    internal var downCards: CardGroup = CardGroup()
    
    override init() {
        super.init()
    }
    
    override init(cards : [PlayingCard]) {
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
    
    func setUpCards(upCards: CardGroup) {
        self.upCards = upCards
        for x in 0..<upCards.getCardCount() {
            let card = upCards.getCards()[x]
            card.setFacingUp(faceUp: true)
            upCards.getCards()[x].setSelected(cardSelected: false)
            removeCard(newCard: card)
        }
    }
    
    func getUpCards() -> CardGroup {
        return upCards
    }
    
    func setDownCards(downCards: CardGroup) {
        self.downCards = downCards
        for x in 0..<downCards.getCardCount() {
            let card = downCards.getCards()[x]
            downCards.getCards()[x].setSelected(cardSelected: false)
            removeCard(newCard: card)
        }
    }
    
    func flipOverHand() {
        for card in cards {
            card.setFacingUp(faceUp: true)
        }
    }
    
    func getDownCards() -> CardGroup {
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
        if upCards.getCardCount() == 0 {
            result += "Empty"
        } else {
            for x in 0..<upCards.getCardCount(){
                result = "\(result) \(upCards.getCards()[x].toString())"
            }
        }
        //result += "Cards down: \(self.downCards.getCardCount())\n"
        result += "\nCards down: "
        if downCards.getCardCount() == 0 {
            result += "Empty"
        } else {
            for x in 0..<downCards.getCardCount(){
                result = "\(result) \(downCards.getCards()[x].toString())"
            }
        }
        return result
    }
}

