//
//  PlayerViewController.swift
//  Three-Down
//
//  Created by James HUBER on 2/13/18.
//  Copyright © 2018 James HUBER. All rights reserved.
//

import UIKit
class PlayerViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func changeColor(){}
    func displayPlayer1Cards(player: Player) {}
}

class Player1ViewController: PlayerViewController {
    @IBOutlet weak var playerView: Player1View!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func changeColor() {
        playerView.changeColor()
    }
    
    override func displayPlayer1Cards(player: Player) {
        playerView.choose3Down(player: player)
    }
}

class Player2ViewController: PlayerViewController {

    @IBOutlet weak var playerView: Player2View!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func changeColor() {
        playerView.changeColor()
    }
}

class Player3ViewController: PlayerViewController {

    @IBOutlet weak var playerView: Player3View!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func changeColor() {
        playerView.changeColor()
    }
}

class Player4ViewController: PlayerViewController {

    @IBOutlet weak var playerView: Player4View!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func changeColor() {
        playerView.changeColor()
    }
}
