//
//  PlayerHand.swift
//  Nines
//
//  Created by James HUBER on 2/7/18.
//  Copyright © 2018 James HUBER. All rights reserved.
//

import Foundation

class PlayerHand {
    
    internal var hand : [PlayingCard]
    
    init(hand : [PlayingCard]) {
        self.hand = hand
    }
    
    func mergeDiscardPile(discardPile: [PlayingCard]) {
        self.hand.append(contentsOf: discardPile)
        self.sortHandByRank()
    }
    
    func sortHandByRank() {
        guard self.hand.count > 1 else { return }
        
        for x in 0 ..< self.hand.count - 1 {
            var lowest = x
            for y in x + 1 ..< self.hand.count {
                if self.hand[y].rank < self.hand[lowest].rank {
                    lowest = y
                }
            }
    
            if x != lowest {
                self.hand.swapAt(x, lowest)
            }
        }
    }
    
    func findValidCards(topCard: PlayingCard) -> [PlayingCard] {
        var playableCards : [PlayingCard] = []
        for card in 0 ..< self.hand.count {
            if topCard.getRank() <= hand[card].getRank() {
                playableCards.append(hand[card])
            } else if hand[card].getRank() == 10 || hand[card].getRank() == 2 {
                playableCards.append(hand[card])
            }
        }
        return playableCards
    }
}
