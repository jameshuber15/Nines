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
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var buttonLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func changeColor() {
        cardController.changeColor()
    }
    
    func myTurn(selectedCards: CardGroup) -> Bool {
        switch player.getMoveType() {
        case MoveType.DrawCards:
            print("")
        case MoveType.ThreeCardsDown:
            if selectedCards.getCardCount() == 3 {
                player.getCardHand().setDownCards(downCards: selectedCards.copy())
                player.getCardHand().flipOverHand()
                cardController.removeSelectedCards()
                player.getCardHand().sortHandByRank()
            } else {
                return false
            }
        case MoveType.ThreeCardsUp:
            if selectedCards.getCardCount() == 3 {
                player.getCardHand().setUpCards(upCards: selectedCards.copy())
                player.getCardHand().flipOverHand()
                cardController.removeSelectedCards()
            } else {
                return false
            }
        case MoveType.FirstTurn:
            print("")
        case MoveType.GamePlay:
            if selectedCards.getCardCount() == 3 {
                player.getCardHand().playCards(selectedCards: selectedCards.copy())
                player.getCardHand().flipOverHand()
                cardController.removeSelectedCards()
            } else {
                return false
            }
        }
        cardController.redrawView(player: player)
        return true
    }
    
    func getCardController() -> CardController {
        return cardController
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

