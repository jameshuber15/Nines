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
        let loadingController = storyboard?.instantiateViewController(withIdentifier: "LoadingController") as! LoadingController
        
        let numOfPlayers = playerSelector.selectedSegmentIndex+2
        print("Number of Players: \(numOfPlayers)")
        print("Difficulty: \(!difficultySwitch.isOn ? Difficulty.Easy : Difficulty.Hard)")
        
        loadingController.intPassed = numOfPlayers
        loadingController.boolPassed = difficultySwitch.isOn

        navigationController?.pushViewController(myVC, animated: true)

        let difficulty = !difficultySwitch.isOn ? Difficulty.Easy : Difficulty.Hard
        let gameBoard = GameBoard()
        gameBoard.startGame(numOfPlayers: numOfPlayers, numHumanPlayers: 1, difficulty: !difficulty ? Difficulty.Easy : Difficulty.Hard)

    }
}
