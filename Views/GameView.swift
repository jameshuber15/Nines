//
//  GameView.swift
//  Nines
//
//  Created by James HUBER on 2/12/18.
//  Copyright © 2018 James HUBER. All rights reserved.
//

import UIKit

class GameView: UIView {
   
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func changeColor() {
        self.backgroundColor = UIColor.black
    }
}
