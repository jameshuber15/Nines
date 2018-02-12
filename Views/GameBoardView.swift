//
//  GameVIew.swift
//  Nines
//
//  Created by James HUBER on 2/10/18.
//  Copyright © 2018 James HUBER. All rights reserved.
//

import UIKit

class GameBoardView: GameView {
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func changeColor() {
        self.backgroundColor = UIColor.green
    }
}
