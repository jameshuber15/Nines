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
                var suitStr : String
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
                switch suit {
                case "♠️":
                    suitStr = "spades"
                case "❤️":
                    suitStr = "hearts"
                case "♦️":
                    suitStr = "diamonds"
                case "♣️":
                    suitStr = "clubs"
                default:
                    suitStr = ""
                }
                let frontImage = "\(rankStr)_of_\(suitStr)"
                let currentCard = PlayingCard(withRank: rank, ofSuit: suit, frontImage: frontImage)
                self.cards.append(currentCard)
            }
        }
    }
    
    func takeCard() -> PlayingCard {
        return cards.remove(at: 0)
    }
    
    override func toString() -> String {
        var result = "Deck:\n "
        if cards.count == 0 {
            return result + "Empty"
        }
        for x in 0..<cards.count{
            result = "\(result) \(cards[x].toString())"
        }
        return result
    }
}
