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
                let frontImage = "\(rank)_of_\(suit)"
                let currentCard = PlayingCard(withRank: rank, ofSuit: suit, frontImage: frontImage)
                self.cards.append(currentCard)
            }
        }
    }
}
