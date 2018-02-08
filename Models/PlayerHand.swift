//
//  PlayerHand.swift
//  Nines
//
//  Created by James HUBER on 2/7/18.
//  Copyright © 2018 James HUBER. All rights reserved.
//

import Foundation

class PlayerHand : CardGroup {
    
    override init(cards : [PlayingCard]) {
        super.init(cards: cards)
    }
    
    func mergeDiscardPile(discardPile: [PlayingCard]) {
        self.cards.append(contentsOf: discardPile)
        self.sortHandByRank()
    }
    
    func findValidCards(topCard: PlayingCard) -> [PlayingCard] {
        var playableCards : [PlayingCard] = []
        for card in 0 ..< self.cards.count {
            if topCard.getRank() <= cards[card].getRank() {
                playableCards.append(cards[card])
            } else if cards[card].getRank() == 10 || cards[card].getRank() == 2 {
                playableCards.append(cards[card])
            }
        }
        return playableCards
    }
}
