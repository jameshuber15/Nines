//
//  PlayingCard.swift
//  Nines
//
//  Created by James HUBER on 2/6/18.
//  Copyright © 2018 James HUBER. All rights reserved.
//

import UIKit

class PlayingCard : Card {
    internal var rank : Int
    internal var suit : String
    internal var color : UIColor
    internal var frontImage : UIImage
    internal var clearCards : Bool
    
    override init(){
        self.frontImage = UIImage(named: "cardfront")!
        self.color = UIColor.red
        self.rank = 0
        self.suit = String()
        self.clearCards = false
        super.init()
    }
    
    init(withRank: Int, ofSuit: String, cardColor: UIColor){
        frontImage = UIImage(named: "cardfront")!
        color = cardColor
        rank = withRank
        suit = ofSuit
        if (withRank == 10) {
            clearCards = true
        } else {
            clearCards = false
        }
        super.init()
    }
    
    override func toString() -> String {
        let facing : String
        if self.isFaceUp {
            facing = " is face up"
        } else {
            facing = " is face down"
        }
        
        return "This PlayingCard is the \(color) : \(rank) of \(suit), the back is \(self.backImage), and \(facing)"
    }
}
