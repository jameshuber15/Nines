//
//  Player1CardController.swift
//  Three-Down
//
//  Created by James HUBER on 2/15/18.
//  Copyright © 2018 James HUBER. All rights reserved.
//

import UIKit

class CardController: UIViewController {
    @IBOutlet weak var cardView: CardView!
    var selectedCards = CardGroup()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func changeColor() {
        cardView.changeColor()
    }
    
    func delete() {
        cardView.delete()
    }
    
    func redrawView(player: Player) {
        var cards = [UIButton]()
        let cardHand = player.getCardHand().cards
        for x in 0..<cardHand.count {
            let card = cardHand[x]
            card.addTarget(self, action: #selector(selectFromHand), for: .touchUpInside)
            cards.append(card)
        }
        var upCards = [UIButton]()
        let upHand = player.getCardHand().getUpCards().getCards()
        for x in 0..<upHand.count {
            let card = upHand[x]
            if cardHand.count > 0 {
                card.isEnabled = false
            }
            card.addTarget(self, action: #selector(selectFromHand), for: .touchUpInside)
            upCards.append(card)
        }
        var downCards = [UIButton]()
        let downHand = player.getCardHand().getDownCards().getCards()
        for x in 0..<downHand.count {
            let card = downHand[x]
            if cardHand.count > 0  || upHand.count > 0{
                card.isEnabled = false
            }
            card.addTarget(self, action: #selector(selectFromHand), for: .touchUpInside)
            downCards.append(card)
        }
        cardView.redrawCards(cards: cards, upCards: upCards, downCards: downCards, moveType: player.getMoveType())
    }
    
    func getSelectedCards() -> CardGroup {
        return selectedCards
    }
    
    func removeSelectedCards() {
        for card in selectedCards.getCards() {
            selectedCards.removeCard(newCard: card)
        }
    }
    
    @objc func selectFromHand(sender:PlayingCard!) {
        let addCard = sender.toggleSelection(button: sender, selectable: selectedCards.getCardCount() < 3)
        if addCard {
            print("Selecting on \(sender.toString())\n")
            selectedCards.addCard(newCard: sender)
        } else {
            print("Deselecting on \(sender.toString())\n")
            selectedCards.removeCard(newCard: sender)
        }
    }
}

