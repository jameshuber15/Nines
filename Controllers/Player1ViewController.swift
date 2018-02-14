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
            card.getCardButton().addTarget(self, action: #selector(selectCard), for: .touchUpInside)
            let cardName = "button\(x)"
            cards[cardName] = card.getCardButton()
        }
        playerView.drawCardsOnScreen(cards: cards)
    }
    
    @objc func selectCard(sender:UIButton!) {
        print("Selected")
//        print(self.toString())
//        self.toggleSelection(button: sender)
    }
    
//    func toggleSelection(button: UIButton) {
//        if self.isSelected() {
//            button.layer.borderColor = UIColor.black.cgColor
//            setSelected(selected: false)
//        } else {
//            button.layer.borderColor = UIColor.red.cgColor
//            setSelected(selected: true)
//        }
//    }
}
