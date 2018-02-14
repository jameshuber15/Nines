//
//  Card.swift
//  Three-Down
//
//  Created by James HUBER on 2/6/18.
//  Copyright © 2018 James HUBER. All rights reserved.
//

import UIKit

class Card: UIButton{
    internal var backImage : UIImage
    internal var isFaceUp : Bool
    
    required init() {
        backImage = UIImage(named: "back")!
        isFaceUp = false
        super.init(frame: CGRect.zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        backImage = UIImage(named: "back")!
        isFaceUp = false
        super.init(coder: aDecoder)
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
