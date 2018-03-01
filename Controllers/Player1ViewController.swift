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
    
    func myTurn(selectedCards: CardGroup, topCard: PlayingCard) -> Bool {
        switch player.getMoveType() {
        case MoveType.DrawCards:
            print("")
            cardController.redrawView(player: player)
        case MoveType.ThreeCardsDown:
            if player.validateCards(selectedCards: selectedCards, topCard: PlayingCard()) {
                player.getCardHand().setDownCards(downCards: selectedCards.copy())
                player.getCardHand().flipOverHand()
                player.getCardHand().sortHandByRank()
                removeAndRedraw(cards: selectedCards, gameBoard: GameBoard())
            } else {
                return false
            }
        case MoveType.ThreeCardsUp:
            if player.validateCards(selectedCards: selectedCards, topCard: PlayingCard()) {
                player.getCardHand().setUpCards(upCards: selectedCards.copy())
                removeAndRedraw(cards: selectedCards, gameBoard: GameBoard())
            } else {
                return false
            }
        case MoveType.FirstTurn:
            if !player.validateCards(selectedCards: selectedCards, topCard: PlayingCard()) {
                return false
            }
        case MoveType.GamePlay:
            if !player.validateCards(selectedCards: selectedCards, topCard: topCard) {
                return false
            }
        }
        return true
    }
    
    func removeAndRedraw(cards: CardGroup, gameBoard: GameBoard) {
        cardController.removeSelectedCards()
        if player.getCardHand().getCardCount() < 3 {
            let cards = CardGroup()
            for _ in player.getCardHand().getCardCount()..<3 {
                if gameBoard.getDeck().getCardCount() > 0 {
                    let card = gameBoard.getDeck().drawCard()
                    card.setFacingUp(faceUp: true)
                    cards.addCard(newCard: card)
                }
            }
            player.getCardHand().mergeCardGroup(cardGroup: cards)
        }
        cardController.redrawView(player: player)
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

