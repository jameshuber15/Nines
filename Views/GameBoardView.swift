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
        self.backgroundColor = UIColor.green

        let spaceBetweenDecks = NSNumber(value: 55)
        let containerWidth = NSNumber(value: (2 * cardWidth.intValue) + spaceBetweenDecks.intValue)
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        var views = [String : AnyObject]()
        
        let discardView = UIView()
        discardView.translatesAutoresizingMaskIntoConstraints = false

        let deckView = UIView()
        deckView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(deckView)
        views["deckView"] = deckView
        containerView.addSubview(discardView)
        views["discardView"] = discardView
        
        let metrics = ["cardWidth" : cardWidth, "cardHeight" : cardHeight, "containerWidth" : containerWidth, "spaceBetweenDecks" : spaceBetweenDecks]
        containerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[discardView(==cardHeight)]", options: NSLayoutFormatOptions.directionLeftToRight, metrics: metrics, views: views))
        containerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[deckView(==cardHeight)]", options: NSLayoutFormatOptions.directionLeftToRight, metrics: metrics, views: views))
        
        let format = "H:|-0-[discardView(==cardWidth)]-spaceBetweenDecks-[deckView(==cardWidth)]-0-|"
        var deckFormat = "H:|-0-"
        var deckViews = [String : AnyObject]()
        var discardFormat = "H:|-0-"
        var discardViews = [String : AnyObject]()
        
        if discardPile.count > 0 {
            discardViews["button\(0)"] = discardPile[0]
            discardFormat += "[button\(0)(==cardWidth)]-"
            discardView.addSubview(discardPile[0])
            discardView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[button\(0)(==cardHeight)]", options: NSLayoutFormatOptions.directionLeftToRight, metrics: metrics, views: discardViews))
            discardFormat += "0-|"
            discardView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: discardFormat, options: NSLayoutFormatOptions.directionLeftToRight, metrics: metrics, views: discardViews))
        } else {
            discardView.layer.borderWidth = 3.0
            discardView.layer.cornerRadius = 4.0
            discardView.layer.borderColor = UIColor.blue.cgColor
        }

        if deck.count > 0 {
            deckViews["button\((deck.count-1))"] = deck[(deck.count-1)]
            deckFormat += "[button\((deck.count-1))(==cardWidth)]-"
            deckView.addSubview(deck[(deck.count-1)])
            deckView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[button\((deck.count-1))(==cardHeight)]", options: NSLayoutFormatOptions.directionLeftToRight, metrics: metrics, views: deckViews))
            deckFormat += "0-|"
            deckView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: deckFormat, options: NSLayoutFormatOptions.directionLeftToRight, metrics: metrics, views: deckViews))
        } else {
            deckView.layer.borderWidth = 3.0
            deckView.layer.cornerRadius = 4.0
            deckView.layer.borderColor = UIColor.blue.cgColor
        }
        
        containerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions.directionLeftToRight, metrics: metrics, views: views))
        
        self.addSubview(containerView)
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[containerView(==cardHeight)]", options: NSLayoutFormatOptions.directionLeftToRight, metrics: metrics, views: ["containerView" : containerView]))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[containerView(==containerWidth)]", options: NSLayoutFormatOptions.directionLeftToRight, metrics: metrics, views: ["containerView" : containerView]))
        self.addConstraint(NSLayoutConstraint(item: containerView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: containerView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0.0))
    }
}

