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
    
    override func toString() -> String {
        var result = "Discard Pile: "
        if cards.count == 0 {
            return result + "Empty"
        }
        
        for x in cards.count-1...0{
            result = "\(result) \(cards[x].toString())"
            print(result)
        }
        return result
    }
}
