//
//  PlayerViewController.swift
//  Three-Down
//
//  Created by James HUBER on 2/13/18.
//  Copyright © 2018 James HUBER. All rights reserved.
//

import UIKit

class Player4ViewController: AIViewController {
    @IBOutlet weak var playerView: Player4View!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func changeColor() {
        playerView.changeColor()
    }
    
    func delete() {
        playerView.delete()
    }
    
    override func myTurn(discardPile: DiscardPile) -> CardGroup {
        var cardHand = CardGroup()
        switch player.getMoveType() {
        case MoveType.DrawCards:
            player.getCardHand().sortHandByRank()
        case MoveType.ThreeCardsDown:
            cardHand = select3Cards()
            player.getCardHand().setDownCards(downCards: cardHand.copy())
        case MoveType.ThreeCardsUp:
            cardHand = select3Cards()
            player.getCardHand().setUpCards(upCards: cardHand.copy())
        case MoveType.FirstTurn:
            if player.getGoesFirst() {
                cardHand = forcePlayLowestCards()
            }
        case MoveType.GamePlay:
            cardHand = selectPlayingCard(discardPile: discardPile)
        }
        redrawView()
        return cardHand
    }
    
    func redrawView() {
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

