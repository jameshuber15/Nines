//
//  Player2View.swift
//  Three-Down
//
//  Created by James HUBER on 2/12/18.
//  Copyright © 2018 James HUBER. All rights reserved.
//

import UIKit

class Player2View: UIView {
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func changeColor() {
        self.backgroundColor = UIColor.yellow
    }
    
    func redrawCards(cards: [UIButton], upCards: [UIButton], downCards: [UIButton], moveType: MoveType) {
        self.delete()
        switch moveType {
        case MoveType.DrawCards:
            print("Drawing cards for ThreeCardsDown for AI")
            draw(handCards: cards, upCards: upCards, downCards: downCards, moveType: moveType)
        case MoveType.ThreeCardsDown:
            print("Drawing cards for ThreeCardsDown for AI")
            draw(handCards: cards, upCards: upCards, downCards: downCards, moveType: moveType)
        case MoveType.ThreeCardsUp:
            print("Drawing cards for ThreeCardsUp for AI")
            self.delete()
            draw(handCards: cards, upCards: upCards, downCards: downCards, moveType: moveType)
        case MoveType.GamePlay:
            print("Drawing cards for Game Play for AI")
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
        var spaceBetweenButtons = NSNumber(value: -30)
        let buttonWidth = NSNumber(value: 94)
        let buttonHeight = NSNumber(value: 55)
        var fromLeft = NSNumber(value: 0)
        
        switch cardType {
        case CardType.Board:
            spaceBetweenButtons = NSNumber(value: 30)
            fromLeft = NSNumber(value: -20)
        case CardType.Hand:
            fromLeft = NSNumber(value: 20)
        }
        
        let containerHeight = NSNumber(value: (cards.count * buttonHeight.intValue) + (cards.count - 1) * spaceBetweenButtons.intValue)
        
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        var views = [String : AnyObject]()
        let metrics = ["buttonWidth" : buttonWidth, "buttonHeight" : buttonHeight, "spaceBetweenButtons" : spaceBetweenButtons, "containerHeight" : containerHeight]
        var format = "V:|-0-"
        
        for i in 0..<cards.count
        {
            cards[i].imageView?.transform = CGAffineTransform(rotationAngle: (-.pi/2))
            views["button\(i)"] = cards[i]
            format += "[button\(i)(==buttonHeight)]"
            if i != cards.count - 1
            {
                format += "-spaceBetweenButtons-"
            }
            else
            {
                format += "-0-|"
            }
            containerView.addSubview(cards[i])
            containerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[button\(i)(==buttonWidth)]", options: NSLayoutFormatOptions.directionLeftToRight, metrics: metrics, views: views))
        }
        containerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions.directionLeftToRight, metrics: metrics, views: views))
        
        self.addSubview(containerView)
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[containerView(==containerHeight)]", options: NSLayoutFormatOptions.directionLeftToRight, metrics: metrics, views: ["containerView" : containerView]))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[containerView(==buttonHeight)]", options: NSLayoutFormatOptions.directionLeftToRight, metrics: metrics, views: ["containerView" : containerView]))
        self.addConstraint(NSLayoutConstraint(item: containerView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: containerView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: CGFloat(truncating: fromLeft)))
    }
}

