//
//  Player3ViewController.swift
//  Three-Down
//
//  Created by James HUBER on 2/14/18.
//  Copyright © 2018 James HUBER. All rights reserved.
//

import UIKit

class Player3ViewController: PlayerViewController {
    @IBOutlet weak var playerView: Player3View!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func changeColor() {
        playerView.changeColor()
    }
    
    func delete() {
        playerView.delete()
    }
    
    override func myTurn() {
        switch player.getMoveType() {
        case MoveType.DrawCards:
            print(player.toString())
        case MoveType.ThreeCardsDown:
            let downCards = select3Cards()
            player.getCardHand().setDownCards(downCards: downCards.copy())
            print(player.toString())
        case MoveType.ThreeCardsUp:
            let upCards = select3Cards()
            player.getCardHand().setUpCards(upCards: upCards.copy())
            print(player.toString())
        case MoveType.GamePlay:
            print("3")
        }
        redrawView(player: player)
    }
    
    func select3Cards() -> CardGroup{
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
        print(result.toString())
        return result
    }
    
    func redrawView(player: Player) {
        var cards = [UIButton]()
        let cardHand = player.getCardHand().cards
        for x in 0..<cardHand.count {
            let card = cardHand[x]
            card.isEnabled = false
            cards.append(card)
        }
        var upCards = [UIButton]()
        let upHand = player.getCardHand().getUpCards().getCards()
        for x in 0..<upHand.count {
            let card = upHand[x]
            card.isEnabled = false
            upCards.append(card)
        }
        var downCards = [UIButton]()
        let downHand = player.getCardHand().getDownCards().getCards()
        for x in 0..<downHand.count {
            let card = downHand[x]
            card.isEnabled = false
            downCards.append(card)
        }
        playerView.redrawCards(cards: cards, upCards: upCards, downCards: downCards, moveType: player.getMoveType())
    }
}
