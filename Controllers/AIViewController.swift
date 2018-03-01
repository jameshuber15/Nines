//
//  AIViewController.swift
//  Three-Down
//
//  Created by James HUBER on 2/27/18.
//  Copyright © 2018 James HUBER. All rights reserved.
//

import UIKit

class AIViewController: PlayerViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func myTurn(discardPile: DiscardPile, gameBoard: GameBoard) -> CardGroup {return CardGroup()}
    func forcePlayLowestCards() -> CardGroup {
        let result = CardGroup()
        let cardHand = player.getCardHand().cards
        let lowRank = cardHand[0].getRank()
        for  i in 0..<cardHand.count {
            if cardHand[i].getRank() == lowRank {
                result.addCard(newCard: cardHand[i])
                player.getCardHand().removeCard(newCard: cardHand[i])
            } else {
                break
            }
        }
        return result
    }
    
    func selectPlayingCard(discardPile: DiscardPile) -> CardGroup {
        //TODO Make AI Worthy
        let result = CardGroup()
        if player.getCardHand().getCardCount() > 0 {
            for card in player.getCardHand().cards {
                if card.getRank() == 2 || card.getRank() == 10 || card.getRank() >= discardPile.getTopCard().getRank() {
                    result.addCard(newCard: card.copy())
                    player.getCardHand().removeCard(newCard: card)
                    return result
                }
            }
        }
        return result
    }
    
    func select3Cards() -> CardGroup {
        //TODO Make AI Worthy
        let result = CardGroup()
        let rand:UInt32 = arc4random_uniform(UInt32(player.getCardHand().getCardCount()))
        var num:Int = Int(rand)
        
        result.addCard(newCard: player.getCardHand().cards[num])
        
        var rand2:UInt32 = arc4random_uniform(UInt32(player.getCardHand().getCardCount()))
        while rand2 == rand {
            rand2 = arc4random_uniform(UInt32(player.getCardHand().getCardCount()))
        }
        num = Int(rand2)
        result.addCard(newCard: player.getCardHand().cards[num])
        
        var rand3:UInt32 = arc4random_uniform(UInt32(player.getCardHand().getCardCount()))
        while rand3 == rand || rand3 == rand2 {
            rand3 = arc4random_uniform(UInt32(player.getCardHand().getCardCount()))
        }
        num = Int(rand3)
        result.addCard(newCard: player.getCardHand().cards[num])
        return result
    }
    
    func pickUpDiscardPile(discardPile: DiscardPile) {
        player.pickupDiscardPile(discardPile: discardPile)
    }
}
