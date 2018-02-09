//
//  GameBoard.swift
//  Nines
//
//  Created by James HUBER on 2/9/18.
//  Copyright © 2018 James HUBER. All rights reserved.
//

import Foundation

class GameBoard {
    internal var players: PlayerList
    internal var deck: Deck
    internal var discardPile: DiscardPile
    
    init(players: PlayerList, deck: Deck){
        self.players = players
        self.deck = deck
        discardPile = DiscardPile()
    }
}
