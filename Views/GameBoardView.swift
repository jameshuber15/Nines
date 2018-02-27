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
        drawBoard(deck: deck, discardPile: discardPile)
    }
    
    func delete() {
        let subviews = self.subviews as [UIView]
        for v in subviews {
            v.removeFromSuperview()
        }
    }
    
    func drawBoard(deck: [UIButton], discardPile: [UIButton]) {
        let spaceBetweenDecks = NSNumber(value: 55)
        
        let containerWidth = NSNumber(value: (2 * cardWidth.intValue) + spaceBetweenDecks.intValue)
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        var views = [String : AnyObject]()
        
        let deckLabel = UILabel(frame: CGRect(x: 0, y: 0, width: cardWidth.intValue, height: cardHeight.intValue))
        deckLabel.textAlignment = .center
        deckLabel.translatesAutoresizingMaskIntoConstraints = false
        deckLabel.layer.borderWidth = 3.0
        deckLabel.layer.cornerRadius = 4.0
        deckLabel.layer.borderColor = UIColor.blue.cgColor
        deckLabel.adjustsFontSizeToFitWidth = true
        deckLabel.text = "Deck"
        
        let discardLabel = UILabel(frame: CGRect(x: 0, y: 0, width: cardWidth.intValue, height: cardHeight.intValue))
        discardLabel.textAlignment = .center
        discardLabel.translatesAutoresizingMaskIntoConstraints = false
        discardLabel.layer.borderWidth = 3.0
        discardLabel.layer.cornerRadius = 4.0
        discardLabel.layer.borderColor = UIColor.blue.cgColor
        discardLabel.adjustsFontSizeToFitWidth = true
        discardLabel.text = "Discard"
        
        containerView.addSubview(deckLabel)
        views["deckLabel"] = deckLabel
        containerView.addSubview(discardLabel)
        views["discardLabel"] = discardLabel
        
        let metrics = ["cardWidth" : cardWidth, "cardHeight" : cardHeight, "containerWidth" : containerWidth, "spaceBetweenDecks" : spaceBetweenDecks]
        containerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[discardLabel(==cardHeight)]", options: NSLayoutFormatOptions.directionLeftToRight, metrics: metrics, views: views))
        containerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[deckLabel(==cardHeight)]", options: NSLayoutFormatOptions.directionLeftToRight, metrics: metrics, views: views))
        
        var format = "H:|-0-[discardLabel(==cardWidth)]-"
//        var deckFormat = ""
//        var discardFormat = ""
//
//        for i in 0..<discardPile.count
//        {
//            views["button\(i)"] = discardPile[i]
//            discardFormat += "[button\(i)(==buttonWidth)]-"
//            if i != deck.count - 1
//            {
//                format += "0-"
//            }
//            containerView.addSubview(discardPile[i])
//            containerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[button\(i)(==buttonHeight)]", options: NSLayoutFormatOptions.directionLeftToRight, metrics: metrics, views: views))
//        }
//
//        for i in stride(from: deck.count-1, through: deck.count-1, by: -1)
//        {
//            views["button\(i)"] = deck[i]
//            deckFormat += "[button\(i)(==buttonWidth)]-"
//            if i != deck.count-1
//            {
//                deckFormat += "0-"
//            }
//            containerView.addSubview(deck[i])
//            containerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[button\(i)(==buttonHeight)]", options: NSLayoutFormatOptions.directionLeftToRight, metrics: metrics, views: views))
//        }
        
//        if discardFormat != "" {
//            format += discardFormat
//        }
        format += "spaceBetweenDecks-[deckLabel(==cardWidth)]-"

//        if deckFormat != "" {
//            format += deckFormat
//        }
        format += "0-|"
        print(format)
        containerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions.directionLeftToRight, metrics: metrics, views: views))
        
        
        self.addSubview(containerView)
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[containerView(==cardHeight)]", options: NSLayoutFormatOptions.directionLeftToRight, metrics: metrics, views: ["containerView" : containerView]))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[containerView(==containerWidth)]", options: NSLayoutFormatOptions.directionLeftToRight, metrics: metrics, views: ["containerView" : containerView]))
        self.addConstraint(NSLayoutConstraint(item: containerView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: containerView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0.0))
    }
}

