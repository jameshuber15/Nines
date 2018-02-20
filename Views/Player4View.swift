//
//  Player4View.swift
//  Three-Down
//
//  Created by James HUBER on 2/12/18.
//  Copyright © 2018 James HUBER. All rights reserved.
//

import UIKit

class Player4View: UIView {
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func changeColor() {
        self.backgroundColor = UIColor.red
    }
    
    func redrawCards(cards: [UIButton], upCards: [UIButton], downCards: [UIButton], moveType: MoveType) {
        self.delete()
        switch moveType {
        case MoveType.ThreeCardsDown:
            print("Drawing cards for ThreeCardsDown for AI")
            draw(handCards: cards, upCards: upCards, downCards: downCards)
        case MoveType.ThreeCardsUp:
            print("Drawing cards for ThreeCardsUp for AI")
            self.delete()
            draw(handCards: cards, upCards: upCards, downCards: downCards)
        case MoveType.GamePlay:
            print("Drawing cards for Game Play for AI")
            self.delete()
            draw(handCards: cards, upCards: upCards, downCards: downCards)
        default:
            print("")
        }
    }
    
    func delete() {
        let subviews = self.subviews as [UIView]
        for v in subviews {
            v.removeFromSuperview()
        }
    }
    
    func draw(handCards: [UIButton],upCards: [UIButton],downCards: [UIButton]) {
        if downCards.count > 0 {
            drawHand(cards: downCards, cardType: CardType.Board)
        }
        if upCards.count > 0 {
            drawHand(cards: upCards, cardType: CardType.Board)
        }
        if handCards.count > 0 {
            drawHand(cards: handCards, cardType: CardType.Hand)
        }
    }
    
    func drawHand(cards: [UIButton], cardType: CardType) {
        
    }
}
