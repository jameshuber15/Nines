//
//  GameBoard.swift
//  Nines
//
//  Created by James HUBER on 2/9/18.
//  Copyright © 2018 James HUBER. All rights reserved.
//

import Foundation

class GameBoard {
    internal var playerArray: [Player] = []
    internal var deck: Deck
    internal var discardPile: DiscardPile
    
    init(){
        self.deck = Deck()
        discardPile = DiscardPile()
    }
    
    func createPlayers(numOfPlayers: Int, numHumanPlayers: Int, difficulty: Difficulty) {
        for x in 0..<numOfPlayers {
            let player = Player(playerNum: x+1)
            if x<numHumanPlayers {
                player.setPlayerType(playerType: PlayerType.Human)
            } else {
                player.setPlayerType(playerType: PlayerType.AI)
                player.setDifficulty(difficulty: difficulty)
            }
            self.playerArray.append(player)
        }
    }
    
    func startGame(numOfPlayers: Int, numHumanPlayers: Int, difficulty: Difficulty) {
        createPlayers(numOfPlayers: numOfPlayers, numHumanPlayers: numHumanPlayers, difficulty: difficulty)
        self.setDeck(deck: Deck())
        print("Created \(self.getDeck().toString()) \n")
        self.getDeck().shuffleDeck()
        print("Shuffled \(self.getDeck().toString()) \n")
        self.getDeck().cutDeck(cutAt: 25)
        print("Cut \(self.getDeck().toString()) \n")
        self.deal()
        print(self.toString())
    }
    
    func deal() {
        for _ in 0...8{
            for y in 0..<playerArray.count {
                let dealtCard = deck.takeCard()
                playerArray[y].getCardHand().addCard(newCard: dealtCard)
            }
        }
        sortPlayersHands()
    }
    
    func sortPlayersHands() {
        for y in 0..<playerArray.count {
            playerArray[y].getCardHand().sortHandByRank()
        }
    }
    
    func getPlayerArray() -> [Player] {
        return playerArray
    }
    
    func setPlayerArray(playerArray: [Player]) {
        self.playerArray = playerArray
    }
    
    func getDeck() -> Deck {
        return deck
    }
    
    func setDeck(deck: Deck) {
        self.deck = deck
    }
    
    func getDiscardPile() -> DiscardPile {
        return discardPile
    }
    
    func SetDiscardPile(discardPile: DiscardPile) {
        self.discardPile = discardPile
    }
    
    func logPlayersHands() -> String {
        var result = ""
        for x in 0..<self.playerArray.count {
            result += "\(playerArray[x].toString())\n"
        }
        return result
    }
    
    func toString() -> String {
        var result = "Cards left in deck: \(deck.cards.count)\n\n"
        result += "Cards in discard pile(top->bottom): \n\(discardPile.toString())\n\n"
        result += "Player's Hands: \n\(logPlayersHands())"
        return result
    }
}