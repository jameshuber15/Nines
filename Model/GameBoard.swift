//
//  GameBoard.swift
//  Three-Down
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
        self.getDeck().shuffleDeck()
        self.getDeck().cutDeck(cutAt: 25)
        self.deal()
    }
    
    func findWhoGoesFirst() {
        var goFirst = false
        while !goFirst {
            for rank in 3 ... PlayingCard.maxRank() {
                for suit in PlayingCard.validSuits() {
                    for player in playerArray {
                        if player.checkForCard(suit: suit, rank: rank) {
                            player.goesFirst(goFirst: true)
                            goFirst = true
                            print("Player \(player.playerNum) goes first!\n")
                            break
                        }
                    }
                    if goFirst {
                        break
                    }
                }
                if goFirst {
                    break
                }
            }
        }
    }
    
    func deal() {
        for _ in 0...8{
            for y in 0..<playerArray.count {
                let dealtCard = deck.takeCard()
                playerArray[y].getCardHand().addCard(newCard: dealtCard)
            }
        }
    }
    
    func playCards(cards: CardGroup, player: Player) -> Bool {
        var turnAgain = false
        for x in 0..<cards.getCardCount() {
            let card = cards.getCards()[x]
            discardPile.addCard(newCard: card.copy())
            player.getCardHand().removeCard(newCard: card)
            if card.getRank() == 10 {
                discardPile.setTopCard(topCard: PlayingCard())
                discardPile.setNumTopCards(numTopCards: 0)
                turnAgain = true
            } else {
                if discardPile.getTopCard().getRank() == card.getRank() {
                    let newNum = cards.getCardCount() + discardPile.getNumTopCards()
                    if newNum == 4 {
                        discardPile.setTopCard(topCard: PlayingCard())
                        discardPile.setNumTopCards(numTopCards: 0)
                        turnAgain = true
                    } else {
                        discardPile.setTopCard(topCard: card)
                        discardPile.setNumTopCards(numTopCards: newNum)
                    }
                } else {
                    discardPile.setTopCard(topCard: card)
                    discardPile.setNumTopCards(numTopCards: cards.getCardCount())
                }
            }
        }
        return turnAgain
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
        var result = "Cards left in deck: \(deck.getCardCount())\n\n"
        result += "Cards in discard pile(top->bottom): \n\(discardPile.toString())\n\n"
        result += "Player's Hands: \n\(logPlayersHands())"
        return result
    }
}

