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
        var cards = [String: PlayingCard]()
        var upCards = [String: PlayingCard]()
        var downCards = [String: PlayingCard]()
        
        let cardHand = player.getCardHand().cards
        for x in 0..<cardHand.count {
            let card = cardHand[x]
            card.addTarget(self, action: #selector(selectFromHand), for: .touchUpInside)
            let cardName = "button\(x)"
            cards[cardName] = card
        }
        
        let upHand = player.getCardHand().getUpCards()
        for x in 0..<upHand.getCardCount() {
            let card = upHand.getCards()[x]
            card.addTarget(self, action: #selector(selectFromHand), for: .touchUpInside)
            let cardName = "button\(x)"
            upCards[cardName] = card
        }
        
        let downHand = player.getCardHand().getDownCards()
        for x in 0..<downHand.getCardCount() {
            let card = downHand.getCards()[x]
            card.addTarget(self, action: #selector(selectFromHand), for: .touchUpInside)
            let cardName = "button\(x)"
            downCards[cardName] = card
        }
        
        cardView.redrawCards(cards: cards, upCards: upCards, downCards: downCards, moveType: player.getMoveType())
    }
    
    func getSelectedCards() -> CardGroup {
            return selectedCards
    }
    
    @objc func selectFromHand(sender:PlayingCard!) {
        print("Selected: \(sender.toString())")
        let addCard = sender.toggleSelection(button: sender, cardCount: selectedCards.getCardCount())
        if addCard {
            selectedCards.addCard(newCard: sender)
        } else {
            selectedCards.removeCard(newCard: sender)
        }
        print("Currently Selected: \(self.selectedCards.toString())")
    }
}
