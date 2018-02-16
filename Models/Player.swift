//
//  PlayerHand.swift
//  Three-Down
//
//  Created by James HUBER on 2/7/18.
//  Copyright © 2018 James HUBER. All rights reserved.
//

import Foundation

class Player {
    
    internal var cardHand : PlayerHand
    internal var playerType : PlayerType
    internal var difficulty : Difficulty
    internal var moveType : MoveType
    internal var playerNum : Int
    
    init(playerNum: Int) {
        cardHand = PlayerHand()
        playerType = PlayerType.NA
        difficulty = Difficulty.None
        moveType = MoveType.ThreeCardsDown
        self.playerNum = playerNum
    }
    
    init(cardHand: PlayerHand, playerType: PlayerType) {
        self.cardHand = cardHand
        self.cardHand.sortHandByRank()
        self.playerType = playerType
        self.difficulty = Difficulty.None
        moveType = MoveType.ThreeCardsDown
        playerNum = 0
    }
    
    func selectCardToPlay(topCard: PlayingCard) -> PlayingCard? {
        var playingCard : PlayingCard?
        playingCard = nil
        if difficulty == Difficulty.Easy {
            let validCards = cardHand.findValidCards(topCard: topCard)
            if validCards.count < 1 {
                playingCard = validCards[0]
            }
        } else {
            //TODO Make AI smarter
            let validCards = cardHand.findValidCards(topCard: topCard)
            if validCards.count < 1 {
                playingCard = validCards[0]
            }
        }
        return playingCard
    }
    
    func turnOver() {
        switch self.moveType {
        case MoveType.ThreeCardsDown:
            self.moveType = MoveType.ThreeCardsUp
            getCardHand().sortHandByRank()
        case MoveType.ThreeCardsUp:
            self.moveType = MoveType.GamePlay
        case MoveType.GamePlay:
            self.moveType = MoveType.GamePlay
        }
    }
    
    func pickupOrSortHand(discardPile: [PlayingCard]) {
        cardHand.mergeDiscardPile(discardPile: discardPile)
    }
    
    func findValidCardsToPlay(topCard: PlayingCard) -> [PlayingCard] {
        return cardHand.findValidCards(topCard: topCard)
    }
    
    func getPlayerType() -> PlayerType{
        return playerType
    }
    
    func setPlayerType(playerType: PlayerType) {
        self.playerType = playerType
    }
    
    func getCardHand() -> PlayerHand{
        return cardHand
    }
    
    func setCardHand(cardHand: PlayerHand) {
        self.cardHand = cardHand
    }
    
    func getDifficulty() -> Difficulty{
        return difficulty
    }
    
    func setDifficulty(difficulty: Difficulty) {
        self.difficulty = difficulty
    }
    
    func getMoveType() -> MoveType {
        return moveType
    }
    
    func setMoveType(moveType: MoveType) {
        self.moveType = moveType
    }
    
    func getPlayerNum() -> Int {
        return playerNum
    }
    
    func setPlayerNum(playerNum: Int) {
        self.playerNum = playerNum
    }
    
    func toString() -> String {
        return "Player \(self.getPlayerNum()) (\(self.moveType)): \(self.cardHand.toString())\n"
    }
}
