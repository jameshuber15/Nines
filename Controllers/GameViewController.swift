//
//  GameController.swift
//  Nines
//
//  Created by James HUBER on 2/10/18.
//  Copyright © 2018 James HUBER. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    var numOfPlayers: Int = 0
    var difficulty: Difficulty = Difficulty.None
        
    @IBOutlet weak var humanPlayerView: UIView!
    @IBOutlet weak var player1View: UIView!
    @IBOutlet weak var player2View: UIView!
    @IBOutlet weak var player3View: UIView!
    @IBOutlet weak var gameBoardView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gameBoard = GameBoard()
        gameBoard.startGame(numOfPlayers: numOfPlayers, numHumanPlayers: 1, difficulty: difficulty)
    }
}
