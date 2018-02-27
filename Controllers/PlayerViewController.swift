//
//  PlayerViewController.swift
//  Three-Down
//
//  Created by James HUBER on 2/14/18.
//  Copyright © 2018 James HUBER. All rights reserved.
//

import UIKit

class PlayerViewController: UIViewController {
    internal var player: Player!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func changeColor(){}
    func setPlayer(player: Player) {
        self.player = player
    }
    
    func getPlayer() -> Player {
        return player
    }
}

