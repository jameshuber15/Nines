//
//  GameBoard.swift
//  Nines
//
//  Created by James HUBER on 2/9/18.
//  Copyright © 2018 James HUBER. All rights reserved.
//

import Foundation

class GameBoard {
    internal var playerList: PlayerList?
    internal var deck: Deck
    internal var discardPile: DiscardPile
    
    init(numOfPlayers: Int, difficulty: Difficulty){
        self.deck = Deck()
        discardPile = DiscardPile()
        let players = createPlayers(numOfPlayers: numOfPlayers, difficulty: difficulty)
        self.playerList = PlayerList(players: players)
    }
    
    func createPlayers(numOfPlayers: Int, difficulty: Difficulty) -> [Player]{
        var gamePlayers: [Player] = []
        for x in 0...numOfPlayers {       
            let player = Player()
            if x==0 {
                player.setPlayerType(playerType: PlayerType.Human)
            } else {
                player.setPlayerType(playerType: PlayerType.AI)
                player.setDifficulty(difficulty: difficulty)
            }
            player.setPlayerNum(playerNum: x+1)
            gamePlayers.append(player)
        }
        return gamePlayers
    }
    
    func deal() {
        var cardCount = playerList!.getSize()*9
        var currentPlayer = playerList!.head
        while cardCount > 0 {
            let dealtCard = deck.takeCard()
            currentPlayer!.getPlayer().getCardHand().addCard(newCard: dealtCard)
            if(currentPlayer?.getPlayer().getCardHand().getCards().count == 9) {
                currentPlayer?.getPlayer().getCardHand().sortHandByRank()
            }
            currentPlayer = currentPlayer!.getNextPlayer()
            cardCount-=1
        }
    }
    
    func getPlayerList() -> PlayerList {
        return playerList!
    }
    
    func setPlayerList(playerList: PlayerList) {
        self.playerList = playerList
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
}
