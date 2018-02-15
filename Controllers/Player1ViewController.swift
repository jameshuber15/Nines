//
//  Player1ViewController.swift
//  Three-Down
//
//  Created by James HUBER on 2/14/18.
//  Copyright © 2018 James HUBER. All rights reserved.
//

import UIKit

class Player1ViewController: PlayerViewController {
    @IBOutlet weak var playerView: Player1View!
    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var buttonLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playButton.layer.cornerRadius = 4
    }
    
    override func changeColor() {
        print(player.toString())
        cardController.changeColor()
    }
    
    override func displayPlayer1Cards() {
        cardController.displayCards(player: player)
    }
    
    @IBAction func playCards(_ sender: UIButton) {
        let selectedCards = cardController.getSelectedCards()
        if selectedCards.getCardCount() != 3 {
            print("Please select 3 cards")
        } else {
            print("Playing cards:\n\(selectedCards.toString())")
        }
    }
    
    private lazy var cardController: CardController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "CardController") as! CardController
        
        // Add View Controller as Child View Controller
        self.add(asChildViewController: viewController)
        
        let width = NSLayoutConstraint(item: viewController.view, attribute: .width, relatedBy: .equal, toItem: cardView, attribute: .width, multiplier: 1.0, constant: 0)
        let height = NSLayoutConstraint(item: viewController.view, attribute: .height, relatedBy: .equal, toItem: cardView, attribute: .height, multiplier: 1.0, constant: 0)
        let top = NSLayoutConstraint(item: viewController.view, attribute: .top, relatedBy: .equal, toItem: cardView, attribute: .top, multiplier: 1.0, constant: 0)
        let leading = NSLayoutConstraint(item: viewController.view, attribute: .leading, relatedBy: .equal, toItem: cardView, attribute: .leading, multiplier: 1.0, constant: 0)
        
        NSLayoutConstraint.activate([width,height,top,leading])
        
        return viewController
    }()
    
//    private lazy var buttonController: ButtonController = {
//        // Load Storyboard
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//
//        // Instantiate View Controller
//        var viewController = storyboard.instantiateViewController(withIdentifier: "ButtonController") as! ButtonController
//
//        // Add View Controller as Child View Controller
//        self.add(asChildViewController: viewController)
//
//        let width = NSLayoutConstraint(item: viewController.view, attribute: .width, relatedBy: .equal, toItem: buttonView, attribute: .width, multiplier: 1.0, constant: 0)
//        let height = NSLayoutConstraint(item: viewController.view, attribute: .height, relatedBy: .equal, toItem: buttonView, attribute: .height, multiplier: 1.0, constant: 0)
//        let top = NSLayoutConstraint(item: viewController.view, attribute: .top, relatedBy: .equal, toItem: buttonView, attribute: .top, multiplier: 1.0, constant: 0)
//        let leading = NSLayoutConstraint(item: viewController.view, attribute: .leading, relatedBy: .equal, toItem: buttonView, attribute: .leading, multiplier: 1.0, constant: 0)
//
//        NSLayoutConstraint.activate([width,height,top,leading])
//
//        return viewController
//    }()
    
    private func add(asChildViewController viewController: UIViewController) {
        // Add Child View Controller
        addChildViewController(viewController)
        viewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        // Configure Child View
        viewController.view.frame = view.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Add Child View as Subview
        view.addSubview(viewController.view)
        
        // Notify Child View Controller
        viewController.didMove(toParentViewController: self)
    }
}
