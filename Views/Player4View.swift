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
        draw(handCards: cards, upCards: upCards, downCards: downCards, moveType: moveType)
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
        var spaceBetweencards = NSNumber(value: -40)
        var fromLeft = NSNumber(value: 0)
        
        switch cardType {
        case CardType.Board:
            spaceBetweencards = NSNumber(value: 30)
            fromLeft = NSNumber(value: 15)
        case CardType.Hand:
            fromLeft = NSNumber(value: -45)
        }
        
        let containerHeight = NSNumber(value: (cards.count * cardWidth.intValue) + (cards.count - 1) * spaceBetweencards.intValue)
        
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        var views = [String : AnyObject]()
        let metrics = ["cardWidth" : cardHeight, "cardHeight" : cardWidth, "spaceBetweencards" : spaceBetweencards, "containerHeight" : containerHeight]
        var format = "V:|-0-"
        
        for i in 0..<cards.count
        {
            cards[i].imageView?.transform = CGAffineTransform(rotationAngle: (.pi/2))
            views["card\(i)"] = cards[i]
            format += "[card\(i)(==cardHeight)]"
            if i != cards.count - 1
            {
                format += "-spaceBetweencards-"
            }
            else
            {
                format += "-0-|"
            }
            containerView.addSubview(cards[i])
            containerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[card\(i)(==cardWidth)]", options: NSLayoutFormatOptions.directionLeftToRight, metrics: metrics, views: views))
        }
        containerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions.directionLeftToRight, metrics: metrics, views: views))
        
        self.addSubview(containerView)
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[containerView(==containerHeight)]", options: NSLayoutFormatOptions.directionLeftToRight, metrics: metrics, views: ["containerView" : containerView]))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[containerView(==cardHeight)]", options: NSLayoutFormatOptions.directionLeftToRight, metrics: metrics, views: ["containerView" : containerView]))
        self.addConstraint(NSLayoutConstraint(item: containerView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: containerView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: CGFloat(truncating: fromLeft)))
    }
}

