//
//  Player2ViewController.swift
//  Three-Down
//
//  Created by James HUBER on 2/14/18.
//  Copyright © 2018 James HUBER. All rights reserved.
//

import UIKit

class Player2ViewController: PlayerViewController {
    
    @IBOutlet weak var playerView: Player2View!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func changeColor() {
        print(player.toString())
        playerView.changeColor()
    }
}
