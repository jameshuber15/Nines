//
//  PlayingCardDeck.swift
//  Nines
//
//  Created by James HUBER on 2/6/18.
//  Copyright © 2018 James HUBER. All rights reserved.
//

import UIKit

class Deck: CardGroup {
    
    override init() {
        super.init()
        
        for suit in PlayingCard.validSuits() {
            for rank in 2 ... PlayingCard.maxRank() {
                var rankStr : String
                switch rank {
                case 11:
                    rankStr = "jack"
                case 12:
                    rankStr = "queen"
                case 13:
                    rankStr = "king"
                case 14:
                    rankStr = "ace"
                default:
                    rankStr = String(rank)
                }
                let frontImage = "\(rankStr)_of_\(suit)"
                let currentCard = PlayingCard(withRank: rank, ofSuit: suit, frontImage: frontImage)
                self.cards.append(currentCard)
            }
        }
    }
}
