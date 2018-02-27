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
    @IBOutlet var gameView: UIView!
    @IBOutlet weak var player1View: UIView!
    @IBOutlet weak var player2View: UIView!
    @IBOutlet weak var player3View: UIView!
    @IBOutlet weak var player4View: UIView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var playButtonLabel: UILabel!
    @IBOutlet weak var gameBoardView: GameBoardView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameBoard = GameBoard()
        gameBoard.startGame(numOfPlayers: numOfPlayers, numHumanPlayers: 1, difficulty: difficulty)
        playButton.layer.cornerRadius = 4
        buildPlayerControllers()
        startGame()
    }
    
    func startGame() {
        print("Player 1's turn\n\(player1Controller.getPlayer().toString())")
        player1Controller.myTurn(selectedCards: CardGroup())
        player1Controller.getPlayer().turnOver()
        
        aiTurn()
        drawBoard()
    }
    
    @IBAction func play(_ sender: UIButton) {
        let selectedCards = player1Controller.getCardController().getSelectedCards()
        player1Controller.myTurn(selectedCards: selectedCards)
        player1Controller.getPlayer().turnOver()
        aiTurn()
        if player1Controller.getPlayer().getMoveType() == MoveType.FirstTurn {
            firstTurn()
        }
    }
    
    func drawBoard() {
        var deck = [UIButton]()
        let deckCards = gameBoard.getDeck()
        for x in 0..<deckCards.getCardCount() {
            let card = deckCards.cards[x]
            card.isEnabled = false
            deck.append(card)
        }
        var discardPile = [UIButton]()
        let discardCards = gameBoard.getDiscardPile()
        for x in 0..<discardCards.getCardCount() {
            let card = discardCards.cards[x]
            card.addTarget(self, action: #selector(pressPile), for: .touchUpInside)
            discardPile.append(card)
        }
        gameBoardView.redrawBoard(deck: deck, discardPile: discardPile)
    }
    
    @IBAction func pressPile(_ sender: UIButton) {
        print("DISCARD PILE")
    }
    
    func aiTurn() {
        var controller: AIViewController!
        var playedCards = CardGroup()
        if numOfPlayers == 2 {
            controller = player3Controller
            print("Player 2's turn\n\(controller.getPlayer().toString())")
            playedCards = controller.myTurn()
            print("Player 2 is playing : \(playedCards.toString())\n")
            controller.getPlayer().turnOver()
        } else {
            controller = player2Controller
            print("Player 2's turn\n\(controller.getPlayer().toString())")
            playedCards = controller.myTurn()
            print("Player 2 is playing : \(playedCards.toString())\n")
            controller.getPlayer().turnOver()
        }
        
        if numOfPlayers >= 3 {
            controller = player3Controller
            print("Player 3's turn\n\(controller.getPlayer().toString())")
            playedCards = controller.myTurn()
            print("Player 3 is playing : \(playedCards.toString())\n")
            controller.getPlayer().turnOver()
        }
        
        if numOfPlayers == 4 {
            controller = player4Controller
            print("Player 4's turn\n\(controller.getPlayer().toString())")
            playedCards = controller.myTurn()
            print("Player 4 is playing : \(playedCards.toString())\n")
            controller.getPlayer().turnOver()
        }
        print("Player 1's turn\n\(player1Controller.getPlayer().toString())")
    }
    
    func buildPlayerControllers() {
        player1Controller.setPlayer(player: gameBoard.getPlayerArray()[0])
        switch numOfPlayers {
        case 2:
            player3Controller.setPlayer(player: gameBoard.getPlayerArray()[1])
        case 3:
            player2Controller.setPlayer(player: gameBoard.getPlayerArray()[1])
            player3Controller.setPlayer(player: gameBoard.getPlayerArray()[2])
        case 4:
            player2Controller.setPlayer(player: gameBoard.getPlayerArray()[1])
            player3Controller.setPlayer(player: gameBoard.getPlayerArray()[2])
            player4Controller.setPlayer(player: gameBoard.getPlayerArray()[3])
        default:
            return
        }
    }
    
    func playCards(cards: CardGroup, player: Player) {
        if cards.getCardCount() > 0 {
            if validateCards(cards: cards) {
                gameBoard.playCards(cards: cards, player: player)
            }
        }
    }
    
    func validateCards(cards: CardGroup) -> Bool {
        let rank = cards.getCards()[0].getRank()
        //Make sure all cards the same rank
        for i in 0..<cards.getCardCount() {
            if rank != cards.getCards()[i].getRank() {
                return false
            }
        }
        //If no cards down, put down anything
        if gameBoard.getDiscardPile().getCardCount() > 0 {
            //Make sure card is at or above top card
            if rank < gameBoard.getDiscardPile().getCards()[0].getRank() {
                //10's and 2's don't care what card on top
                if !(rank == 10 || rank == 2) {
                    return false
                }
            }
        }
        return true
    }
    
    func firstTurn() {
        gameBoard.findWhoGoesFirst()
        switch numOfPlayers {
        case 2:
            if player1Controller.getPlayer().getGoesFirst() {
                player3Controller.getPlayer().turnOver()
            } else {
                player1Controller.getPlayer().turnOver()
                
                let playedCards = player3Controller.myTurn()
                print("Player 2 is playing : \(playedCards.toString())\n")
                playCards(cards: playedCards, player: player3Controller.getPlayer())
                player3Controller.getPlayer().turnOver()
            }
        case 3:
            if player1Controller.getPlayer().getGoesFirst() {
                player2Controller.getPlayer().turnOver()
                player3Controller.getPlayer().turnOver()
            } else if player2Controller.getPlayer().getGoesFirst(){
                player1Controller.getPlayer().turnOver()
                
                var playedCards = player2Controller.myTurn()
                print("Player 2 is playing : \(playedCards.toString())\n")
                playCards(cards: playedCards, player: player2Controller.getPlayer())
                player2Controller.getPlayer().turnOver()
                
                playedCards = player3Controller.myTurn()
                print("Player 3 is playing : \(playedCards.toString())\n")
                playCards(cards: playedCards, player: player3Controller.getPlayer())
                player3Controller.getPlayer().turnOver()
                
            } else {
                player1Controller.getPlayer().turnOver()
                player2Controller.getPlayer().turnOver()
                
                let playedCards = player3Controller.myTurn()
                print("Player 3 is playing : \(playedCards.toString())\n")
                playCards(cards: playedCards, player: player3Controller.getPlayer())
                player3Controller.getPlayer().turnOver()
            }
        case 4:
            if player1Controller.getPlayer().getGoesFirst() {
                player2Controller.getPlayer().turnOver()
                player3Controller.getPlayer().turnOver()
                player4Controller.getPlayer().turnOver()
            } else if player2Controller.getPlayer().getGoesFirst() {
                player1Controller.getPlayer().turnOver()
                
                var playedCards = player2Controller.myTurn()
                print("Player 2 is playing : \(playedCards.toString())\n")
                playCards(cards: playedCards, player: player2Controller.getPlayer())
                player2Controller.getPlayer().turnOver()
                
                playedCards = player3Controller.myTurn()
                print("Player 3 is playing : \(playedCards.toString())\n")
                playCards(cards: playedCards, player: player3Controller.getPlayer())
                player3Controller.getPlayer().turnOver()
                
                playedCards = player4Controller.myTurn()
                print("Player 4 is playing : \(playedCards.toString())\n")
                playCards(cards: playedCards, player: player4Controller.getPlayer())
                player4Controller.getPlayer().turnOver()
            } else if player3Controller.getPlayer().getGoesFirst() {
                player1Controller.getPlayer().turnOver()
                player2Controller.getPlayer().turnOver()
                
                var playedCards = player3Controller.myTurn()
                print("Player 3 is playing : \(playedCards.toString())\n")
                playCards(cards: playedCards, player: player3Controller.getPlayer())
                player3Controller.getPlayer().turnOver()
                
                playedCards = player4Controller.myTurn()
                print("Player 4 is playing : \(playedCards.toString())\n")
                playCards(cards: playedCards, player: player4Controller.getPlayer())
                player4Controller.getPlayer().turnOver()
            } else {
                player1Controller.getPlayer().turnOver()
                player2Controller.getPlayer().turnOver()
                player3Controller.getPlayer().turnOver()
                
                let playedCards = player4Controller.myTurn()
                print("Player 4 is playing : \(playedCards.toString())\n")
                playCards(cards: playedCards, player: player4Controller.getPlayer())
                player4Controller.getPlayer().turnOver()
            }
        default:
            print("")
        }
    }
        
    private lazy var player1Controller: Player1ViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "Player1ViewController") as! Player1ViewController
        
        // Add View Controller as Child View Controller
        self.add(asChildViewController: viewController)
        
        let width = NSLayoutConstraint(item: viewController.view, attribute: .width, relatedBy: .equal, toItem: player1View, attribute: .width, multiplier: 1.0, constant: 0)
        let height = NSLayoutConstraint(item: viewController.view, attribute: .height, relatedBy: .equal, toItem: player1View, attribute: .height, multiplier: 1.0, constant: 0)
        let top = NSLayoutConstraint(item: viewController.view, attribute: .top, relatedBy: .equal, toItem: player1View, attribute: .top, multiplier: 1.0, constant: 0)
        let leading = NSLayoutConstraint(item: viewController.view, attribute: .leading, relatedBy: .equal, toItem: player1View, attribute: .leading, multiplier: 1.0, constant: 0)
        
        NSLayoutConstraint.activate([width,height,top,leading])
        
        return viewController
    }()
    
    private lazy var player2Controller: Player2ViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "Player2ViewController") as! Player2ViewController
        
        // Add View Controller as Child View Controller
        self.add(asChildViewController: viewController)
        
        let width = NSLayoutConstraint(item: viewController.view, attribute: .width, relatedBy: .equal, toItem: player2View, attribute: .width, multiplier: 1.0, constant: 0)
        let height = NSLayoutConstraint(item: viewController.view, attribute: .height, relatedBy: .equal, toItem: player2View, attribute: .height, multiplier: 1.0, constant: 0)
        let top = NSLayoutConstraint(item: viewController.view, attribute: .top, relatedBy: .equal, toItem: player2View, attribute: .top, multiplier: 1.0, constant: 0)
        let leading = NSLayoutConstraint(item: viewController.view, attribute: .leading, relatedBy: .equal, toItem: player2View, attribute: .leading, multiplier: 1.0, constant: 0)
        
        NSLayoutConstraint.activate([width,height,top,leading])
        
        return viewController
    }()
    
    private lazy var player3Controller: Player3ViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "Player3ViewController") as! Player3ViewController
        
        // Add View Controller as Child View Controller
        self.add(asChildViewController: viewController)
        
        let width = NSLayoutConstraint(item: viewController.view, attribute: .width, relatedBy: .equal, toItem: player3View, attribute: .width, multiplier: 1.0, constant: 0)
        let height = NSLayoutConstraint(item: viewController.view, attribute: .height, relatedBy: .equal, toItem: player3View, attribute: .height, multiplier: 1.0, constant: 0)
        let top = NSLayoutConstraint(item: viewController.view, attribute: .top, relatedBy: .equal, toItem: player3View, attribute: .top, multiplier: 1.0, constant: 0)
        let leading = NSLayoutConstraint(item: viewController.view, attribute: .leading, relatedBy: .equal, toItem: player3View, attribute: .leading, multiplier: 1.0, constant: 0)
        
        NSLayoutConstraint.activate([width,height,top,leading])
        
        return viewController
    }()
    
    private lazy var player4Controller: Player4ViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "Player4ViewController") as! Player4ViewController
        
        // Add View Controller as Child View Controller
        self.add(asChildViewController: viewController)
        
        let width = NSLayoutConstraint(item: viewController.view, attribute: .width, relatedBy: .equal, toItem: player4View, attribute: .width, multiplier: 1.0, constant: 0)
        let height = NSLayoutConstraint(item: viewController.view, attribute: .height, relatedBy: .equal, toItem: player4View, attribute: .height, multiplier: 1.0, constant: 0)
        let top = NSLayoutConstraint(item: viewController.view, attribute: .top, relatedBy: .equal, toItem: player4View, attribute: .top, multiplier: 1.0, constant: 0)
        let leading = NSLayoutConstraint(item: viewController.view, attribute: .leading, relatedBy: .equal, toItem: player4View, attribute: .leading, multiplier: 1.0, constant: 0)
        
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

