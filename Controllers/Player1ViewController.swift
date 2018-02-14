//
//  Player1ViewController.swift
//  Three-Down
//
//  Created by James HUBER on 2/14/18.
//  Copyright © 2018 James HUBER. All rights reserved.
//

import UIKit

class Player1ViewController: PlayerViewController {
    @IBOutlet weak var playerView: Player1View!
    var selectedCards = CardGroup()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func changeColor() {
        playerView.changeColor()
    }
    
    override func displayPlayer1Cards(player: Player) {
        var cards = [String: PlayingCard]()
        let hand = player.getCardHand().cards
        for x in 0..<hand.count {
            let card = hand[x]
            card.addTarget(self, action: #selector(selectCard), for: .touchUpInside)
            let cardName = "button\(x)"
            cards[cardName] = card
        }
        playerView.drawCardsOnScreen(cards: cards)
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
