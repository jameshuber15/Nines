//
//  DiscardPile.swift
//  Nines
//
//  Created by James HUBER on 2/9/18.
//  Copyright © 2018 James HUBER. All rights reserved.
//

import Foundation

class DiscardPile: CardGroup {
    internal var topCard: PlayingCard?
    internal var numTopCards: Int
    
    override init() {
        self.topCard = nil
        self.numTopCards = 0
        super.init()
    }
}
