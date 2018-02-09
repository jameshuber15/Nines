//
//  PlayerHand.swift
//  Nines
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
    
    init() {
        cardHand = PlayerHand()
        playerType = PlayerType.NA
        difficulty = Difficulty.None
        moveType = MoveType.ThreeCardsDown
        playerNum = 0
    }
    
    init(cardHand: PlayerHand, playerType: PlayerType) {
        self.cardHand = cardHand
        self.cardHand.sortHandByRank()
        self.playerType = playerType
        self.difficulty = Difficulty.None
        moveType = MoveType.ThreeCardsDown
        playerNum = 0
    }
    
    func playersTurn() {
        switch moveType {
        case MoveType.ThreeCardsDown:
            print("State: ThreeCardsDown")
            self.setMoveType(moveType: MoveType.ThreeCardsUp)
        case MoveType.ThreeCardsUp:
            print("State: ThreeCardsUp")
            self.setMoveType(moveType: MoveType.GamePlay)
        case MoveType.GamePlay:
            print("State: GamePlay")
        }
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
        return "\(self.playerType) \(self.getPlayerNum()): \(self.cardHand.toString())"
    }
}
