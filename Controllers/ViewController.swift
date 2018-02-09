//
//  ViewController.swift
//  Nines
//
//  Created by James HUBER on 2/7/18.
//  Copyright © 2018 James HUBER. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        // Do any additional setup after loading the view, typically from a nib.
        let gameBoard = GameBoard(numOfPlayers: 4, difficulty: Difficulty.Easy)
        gameBoard.setDeck(deck: Deck())
        print("Created \(gameBoard.getDeck().toString()) \n")
        gameBoard.getDeck().shuffleDeck()
        print("Shuffled \(gameBoard.getDeck().toString()) \n")
        gameBoard.getDeck().cutDeck(cutAt: 25)
        print("Cut \(gameBoard.getDeck().toString()) \n")
        gameBoard.deal()
        print(gameBoard.getPlayerList().toString())
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.landscapeLeft
    }
    
    override var shouldAutorotate: Bool {
        return false
    }

    override func viewDidDisappear(_ animated: Bool) {
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
    }
} 
