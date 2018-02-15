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
    
    func displayCards(player: Player) {
        var cards = [String: PlayingCard]()
        let hand = player.getCardHand().cards
        for x in 0..<hand.count {
            let card = hand[x]
            card.addTarget(self, action: #selector(selectCard), for: .touchUpInside)
            let cardName = "button\(x)"
            cards[cardName] = card
        }
        cardView.drawCardsOnScreen(cards: cards)
    }
    
    func getSelectedCards() -> CardGroup {
            return selectedCards
    }
    
    @objc func selectCard(sender:PlayingCard!) {
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
