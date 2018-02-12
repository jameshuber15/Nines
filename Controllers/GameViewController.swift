//
//  GameController.swift
//  Three-Down
//
//  Created by James HUBER on 2/10/18.
//  Copyright © 2018 James HUBER. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    var numOfPlayers: Int = 0
    var difficulty: Difficulty = Difficulty.None
    var gameBoard : GameBoard!
    var gameBoardMap: [GameView] = []
    
    @IBOutlet weak var player1View: Player1View!
    @IBOutlet weak var player3View: Player3View!
    @IBOutlet weak var player4View: Player4View!
    @IBOutlet weak var player2View: Player2View!
    @IBOutlet weak var gameBoardView: GameBoardView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameBoard = GameBoard()
        gameBoard.startGame(numOfPlayers: numOfPlayers, numHumanPlayers: 1, difficulty: difficulty)
        buildGameViewMap()
        changeColors()
//        self.view.backgroundColor = UIColor(red: 0.42, green: 0.59, blue: 0.88, alpha: 1)
//
//        gameView = GameView()
//        self.view.addSubview(gameView)
//
//        gameView.buildGameViews()
    }
    
    func changeColors() {
        for x in 0..<gameBoardMap.count {
            gameBoardMap[x].changeColor()
        }
        gameBoardView.changeColor()
    }
    
    func buildGameViewMap() {
        switch numOfPlayers {
        case 2:
            gameBoardMap.append(player1View)
            gameBoardMap.append(player3View)
        case 3:
            gameBoardMap.append(player1View)
            gameBoardMap.append(player2View)
            gameBoardMap.append(player3View)
        case 4:
            gameBoardMap.append(player1View)
            gameBoardMap.append(player2View)
            gameBoardMap.append(player3View)
            gameBoardMap.append(player4View)
        default:
            gameBoardMap = []
        }
    }
}
