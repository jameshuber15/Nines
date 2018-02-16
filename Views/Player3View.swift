//
//  Player3View.swift
//  Three-Down
//
//  Created by James HUBER on 2/12/18.
//  Copyright © 2018 James HUBER. All rights reserved.
//

import UIKit

class Player3View: UIView {
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func changeColor() {
        self.backgroundColor = UIColor.purple
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
        var spaceBeetweenButtons = NSNumber(value: 0)
        var buttonWidth = NSNumber(value: 0)
        var buttonHeight = NSNumber(value: 0)
        var fromTop = NSNumber(value: 0)
        
        switch cardType {
        case CardType.Board:
            spaceBeetweenButtons = NSNumber(value: 30)
            buttonWidth = NSNumber(value: 55)
            buttonHeight = NSNumber(value: 94)
            fromTop = NSNumber(value: 20)
        case CardType.Hand:
            spaceBeetweenButtons = NSNumber(value: -40)
            buttonWidth = NSNumber(value: 55)
            buttonHeight = NSNumber(value: 94)
            fromTop = NSNumber(value: -20)
        }
        
        let containerWidth = NSNumber(value: (cards.count * buttonWidth.intValue) + (cards.count - 1) * spaceBeetweenButtons.intValue)
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        var views = [String : AnyObject]()
        let metrics = ["buttonWidth" : buttonWidth, "buttonHeight" : buttonHeight, "spaceBeetweenButtons" : spaceBeetweenButtons, "containerWidth" : containerWidth]
        var format = "H:|-0-"
        
        for i in 0..<cards.count
        {
            views["button\(i)"] = cards[i]
            format += "[button\(i)(==buttonWidth)]"
            if i != cards.count - 1
            {
                format += "-spaceBeetweenButtons-"
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
