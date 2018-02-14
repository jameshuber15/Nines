//
//  Player1View.swift
//  Three-Down
//
//  Created by James HUBER on 2/12/18.
//  Copyright © 2018 James HUBER. All rights reserved.
//

import UIKit

class Player1View: UIView {
    var allConstraints = [NSLayoutConstraint]()
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func changeColor() {
        self.backgroundColor = UIColor.blue
    }
    
    func choose3Down(player: Player) {
        drawCardsOnScreen(player: player)
    }
    
    func drawCardsOnScreen(player: Player) {
        var cards = [String: UIButton]()
        let hand = player.getCardHand().cards
        let cardWidth = self.bounds.size.width/10.0
        let cardSpace = (self.bounds.size.width-(cardWidth*9))/10.0
        let cardHeight = (self.bounds.size.height*0.3)/2.0
        
        var horizontalConstraintsString = "H:|-\(cardWidth/2)-"
        for x in 0..<hand.count {
            let card = hand[x].getCardButton()
            let cardName = "button\(x)"
            card.translatesAutoresizingMaskIntoConstraints = false
            card.clipsToBounds = true
            self.addSubview(card)
            cards[cardName] = card
            // add vertical constraints to label
            let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-\(cardHeight)-[\(cardName)]-\(cardHeight)-|", options: [], metrics: nil, views: cards)
            allConstraints.append(contentsOf: verticalConstraints)
            
            // add label to horizontal VFL string
            horizontalConstraintsString += "[\(cardName)(\(cardWidth))]"
            if x<hand.count-1 {
                horizontalConstraintsString += "-\(cardSpace)-"
            }
        }
        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: horizontalConstraintsString, options: [], metrics: nil, views: cards)
        allConstraints.append(contentsOf: horizontalConstraints)
        
        NSLayoutConstraint.activate(allConstraints)
    }
}
