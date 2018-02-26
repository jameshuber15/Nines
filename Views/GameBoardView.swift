//
//  GameBoardView.swift
//  Three-Down
//
//  Created by James HUBER on 2/12/18.
//  Copyright © 2018 James HUBER. All rights reserved.
//

import UIKit

class GameBoardView: UIView {
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func changeColor() {
        self.backgroundColor = UIColor.green
    }
    
    func redrawBoard(deck: [UIButton], discardPile: [UIButton]) {
        self.delete()
        //drawBoard(deck: deck, discardPile: discardPile)
    }
    
    func delete() {
        let subviews = self.subviews as [UIView]
        for v in subviews {
            v.removeFromSuperview()
        }
    }
    
    func drawBoard(deck: [UIButton], discardPile: [UIButton]) {
        let spaceBetweenDecks = NSNumber(value: 55)
        let buttonWidth = NSNumber(value: 55)
        let buttonHeight = NSNumber(value: 94)
        let fromTop = NSNumber(value: 5)
        
        let containerWidth = NSNumber(value: (2 * buttonWidth.intValue) + spaceBetweenDecks.intValue)
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        var views = [String : AnyObject]()
        let metrics = ["buttonWidth" : buttonWidth, "buttonHeight" : buttonHeight, "containerWidth" : containerWidth, "spaceBetweenDecks" : spaceBetweenDecks]
        var format = "H:|-0-"
        var deckFormat = ""
        var discardFormat = ""
        
        for i in stride(from: deck.count-1, through: deck.count-1, by: -1)
        {
            views["button\(i)"] = deck[i]
            deckFormat += "[button\(i)(==buttonWidth)]"
            if i != deck.count-1
            {
                deckFormat += "-0-"
            }
            containerView.addSubview(deck[i])
            containerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[button\(i)(==buttonHeight)]", options: NSLayoutFormatOptions.directionLeftToRight, metrics: metrics, views: views))
        }
        
        format += "spaceBetweenDecks-|"
        
        for i in 0..<discardPile.count
        {
            views["button\(i)"] = discardPile[i]
            discardFormat += "[button\(i)(==buttonWidth)]"
            if i != deck.count - 1
            {
                format += "-0-"
            }
            containerView.addSubview(discardPile[i])
            containerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[button\(i)(==buttonHeight)]", options: NSLayoutFormatOptions.directionLeftToRight, metrics: metrics, views: views))
        }
        
        if deckFormat != "" {
            format += deckFormat
        }
        if discardFormat != "" {
            format += "-spaceBetweenDecks-"
            format += discardFormat
        }
        format += "-0-|"
        print(format)
        containerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions.directionLeftToRight, metrics: metrics, views: views))
        
        self.addSubview(containerView)
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[containerView(==buttonHeight)]", options: NSLayoutFormatOptions.directionLeftToRight, metrics: metrics, views: ["containerView" : containerView]))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[containerView(==containerWidth)]", options: NSLayoutFormatOptions.directionLeftToRight, metrics: metrics, views: ["containerView" : containerView]))
        self.addConstraint(NSLayoutConstraint(item: containerView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: containerView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: CGFloat(truncating: fromTop)))
    }
}

