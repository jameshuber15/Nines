//
//  PlayerHand.swift
//  Nines
//
//  Created by James HUBER on 2/7/18.
//  Copyright © 2018 James HUBER. All rights reserved.
//

import Foundation

class Player {
    lazy var cardHand = [PlayingCard]()
    internal var turn : Bool
    internal var nextPlayer : Player
    
    func sortDeckByRank() {
        guard self.cardHand.count > 1 else { return }
        
        for x in 0 ..< self.cardHand.count - 1 {
            var lowest = x
            for y in x + 1 ..< self.cardHand.count {
                if self.cardHand[y].rank < self.cardHand[lowest].rank {
                    lowest = y
                }
            }
            
            if x != lowest {
                self.cardHand.swapAt(x, lowest)
            }
        }
    }
}
