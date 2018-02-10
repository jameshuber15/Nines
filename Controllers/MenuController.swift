//
//  ViewController.swift
//  Nines
//
//  Created by James HUBER on 2/7/18.
//  Copyright © 2018 James HUBER. All rights reserved.
//

import UIKit

class MenuController: UIViewController {
    //UI: Objects
    @IBOutlet weak var playerSelector: UISegmentedControl!
    @IBOutlet weak var difficultySwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let value = UIInterfaceOrientation.landscapeRight.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.landscapeRight
    }
    
    override var shouldAutorotate: Bool {
        return true
    }

    override func viewDidDisappear(_ animated: Bool) {
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
    }
    
    @IBAction func playGame(_ sender: UIButton) {
        print("Start Game")
        let gameBoard = GameBoard()
        let numOfPlayers = playerSelector.selectedSegmentIndex+2
        let difficulty = !difficultySwitch.isOn ? Difficulty.Easy : Difficulty.Hard
        print("Number of Players: \(numOfPlayers)")
        print("Difficulty: \(difficulty)")
        gameBoard.startGame(numOfPlayers: numOfPlayers, numHumanPlayers: 1, difficulty: difficulty)

    }
}
