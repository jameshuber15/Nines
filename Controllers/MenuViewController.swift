//
//  ViewController.swift
//  Nines
//
//  Created by James HUBER on 2/7/18.
//  Copyright © 2018 James HUBER. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    //UI: Objects
    @IBOutlet weak var playerSelector: UISegmentedControl!
    @IBOutlet weak var difficultySwitch: UISwitch!
    
    lazy var gameTitle: UILabel! = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.borderStyle = .RoundedRect
        view.textAlignment = .Center
        
        return view
    }()
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        print("Start Game")
        let numOfPlayers = playerSelector.selectedSegmentIndex+2
        print("Number of Players: \(numOfPlayers)")
        let difficulty = !difficultySwitch.isOn ? Difficulty.Easy : Difficulty.Hard
        print("Difficulty: \(difficulty)")
        if let gvc = segue.destination as? GameViewController
        {
            gvc.difficulty = difficulty
            gvc.numOfPlayers = numOfPlayers
        }
    }

}
