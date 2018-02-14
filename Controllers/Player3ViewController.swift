//
//  Player3ViewController.swift
//  Three-Down
//
//  Created by James HUBER on 2/14/18.
//  Copyright © 2018 James HUBER. All rights reserved.
//

import UIKit

class Player3ViewController: PlayerViewController {
    
    @IBOutlet weak var playerView: Player3View!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func changeColor() {
        playerView.changeColor()
    }
}
