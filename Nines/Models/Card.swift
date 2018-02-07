//
//  Card.swift
//  Nines
//
//  Created by James HUBER on 2/6/18.
//  Copyright © 2018 James HUBER. All rights reserved.
//

import UIKit

class Card {
    internal var backImage : UIImage
    internal var isFaceUp : Bool
    
    init() {
        backImage = UIImage(named: "cardback")!
        isFaceUp = false
    }
    
    func toString() -> String {
        return "The card is \(isFaceUp)"
    }
    
    func getBackImage() -> UIImage {
        return backImage
    }
    
    func setBackImage(backImage : UIImage) {
        self.backImage = backImage
    }
    
    func isUp() -> Bool {
        return isFaceUp
    }
    
    func setFacingUp(faceUp : Bool) {
        self.isFaceUp = faceUp
    }
}
