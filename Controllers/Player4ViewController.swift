//
//  PlayerViewController.swift
//  Three-Down
//
//  Created by James HUBER on 2/13/18.
//  Copyright © 2018 James HUBER. All rights reserved.
//

import UIKit

class Player4ViewController: PlayerViewController {

    @IBOutlet weak var playerView: Player4View!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func changeColor() {
        print(player.toString())
        playerView.changeColor()
    }
}
