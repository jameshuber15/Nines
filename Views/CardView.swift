//
//  CardView.swift
//  Three-Down
//
//  Created by James HUBER on 2/15/18.
//  Copyright © 2018 James HUBER. All rights reserved.
//

import UIKit

class CardView: UIView {

    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func changeColor() {
        self.backgroundColor = UIColor.orange
    }
    
    
    func redrawCards(cards: [UIButton], upCards: [UIButton], downCards: [UIButton], moveType: MoveType) {
        self.delete()
        switch moveType {
        case MoveType.DrawCards:
            draw(handCards: cards, upCards: upCards, downCards: downCards, moveType: moveType)
        case MoveType.ThreeCardsDown:
            draw(handCards: cards, upCards: upCards, downCards: downCards, moveType: moveType)
        case MoveType.ThreeCardsUp:
            self.delete()
            draw(handCards: cards, upCards: upCards, downCards: downCards, moveType: moveType)
        case MoveType.GamePlay:
            self.delete()
            draw(handCards: cards, upCards: upCards, downCards: downCards, moveType: moveType)
        }
    }

    func delete() {
        let subviews = self.subviews as [UIView]
        for v in subviews {
            v.removeFromSuperview()
        }
    }
    
    func draw(handCards: [UIButton],upCards: [UIButton],downCards: [UIButton], moveType: MoveType) {
        if downCards.count > 0 {
            drawHand(cards: downCards, cardType: CardType.Board, moveType: moveType)
        }
        if upCards.count > 0 {
            drawHand(cards: upCards, cardType: CardType.Board, moveType: moveType)
        }
        if handCards.count > 0 {
            drawHand(cards: handCards, cardType: CardType.Hand, moveType: moveType)
        }
    }
    
    func drawHand(cards: [UIButton], cardType: CardType, moveType: MoveType) {
        var spaceBetweenButtons = NSNumber(value: 0)
        var buttonWidth = NSNumber(value: 0)
        var buttonHeight = NSNumber(value: 0)
        var fromTop = NSNumber(value: 0)
        
        switch cardType {
        case CardType.Board:
            spaceBetweenButtons = NSNumber(value: 30)
            buttonWidth = NSNumber(value: 55)
            buttonHeight = NSNumber(value: 94)
            fromTop = NSNumber(value: -20)
        case CardType.Hand:
            if moveType == MoveType.GamePlay {
                spaceBetweenButtons = NSNumber(value: -30)
            } else {
                spaceBetweenButtons = NSNumber(value: -20)
            }
            buttonWidth = NSNumber(value: 55)
            buttonHeight = NSNumber(value: 94)
            fromTop = NSNumber(value: 20)
        }
        
        let containerWidth = NSNumber(value: (cards.count * buttonWidth.intValue) + (cards.count - 1) * spaceBetweenButtons.intValue)
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        var views = [String : AnyObject]()
        let metrics = ["buttonWidth" : buttonWidth, "buttonHeight" : buttonHeight, "spaceBetweenButtons" : spaceBetweenButtons, "containerWidth" : containerWidth]
        var format = "H:|-0-"
        
        for i in 0..<cards.count
        {
            views["button\(i)"] = cards[i]
            format += "[button\(i)(==buttonWidth)]"
            if i != cards.count - 1
            {
                format += "-spaceBetweenButtons-"
            }
            else
            {
                format += "-0-|"
            }
            containerView.addSubview(cards[i])
            containerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[button\(i)(==buttonHeight)]", options: NSLayoutFormatOptions.directionLeftToRight, metrics: metrics, views: views))
        }
        
        containerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions.directionLeftToRight, metrics: metrics, views: views))
        
        self.addSubview(containerView)
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[containerView(==buttonHeight)]", options: NSLayoutFormatOptions.directionLeftToRight, metrics: metrics, views: ["containerView" : containerView]))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[containerView(==containerWidth)]", options: NSLayoutFormatOptions.directionLeftToRight, metrics: metrics, views: ["containerView" : containerView]))
        self.addConstraint(NSLayoutConstraint(item: containerView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: containerView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: CGFloat(truncating: fromTop)))
    }
}
