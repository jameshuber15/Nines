//
//  PlayingCardButton.swift
//  Nines
//
//  Created by James HUBER on 2/10/18.
//  Copyright © 2018 James HUBER. All rights reserved.
//

import UIKit

class PlayingCardButton {
    internal var card: PlayingCard
    internal var cardButton: UIButton
    
    init(card: PlayingCard, cardButton: UIButton) {
        self.card = card
        self.cardButton = cardButton
    }
    
    func getCardButton() -> UIButton {
        return cardButton
    }
    
    func setCardButton(cardButton: UIButton) {
        self.cardButton = cardButton
    }
    
    func getCard() -> PlayingCard {
        return card
    }
    
    func setCard(card: PlayingCard) {
        self.card = card
    }
}
