//
//  PlayingCardDeck.swift
//  Nines
//
//  Created by James HUBER on 2/6/18.
//  Copyright © 2018 James HUBER. All rights reserved.
//

import UIKit

class PlayingCardDeck : Deck {
    override init() {
        super.init()
        
        for suit in PlayingCard.validSuits() {
            for rank in 2 ... PlayingCard.maxRank() {
                var suitName:String
                switch suit {
                    case "♠️":
                        suitName = "spades"
                    case "❤️":
                        suitName = "hearts"
                    case "♣️":
                        suitName = "clubs"
                    case "♦️":
                        suitName = "diamonds"
                    default:
                        suitName = ""
                }
                
                let frontImage = "\(rank)_of_\(suitName)"
                let currentCard = PlayingCard(withRank: rank, ofSuit: suit, frontImage: frontImage)
                self.cards.append(currentCard)
            }
        }
    }
    
    func sortDeckByRank() {
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
    }
}
