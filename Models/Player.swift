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
    internal var difficulty : String
    
    init() {
        cardHand = PlayerHand()
        playerType = PlayerType.NA
        difficulty = ""
    }
    
    init(cardHand: PlayerHand, playerType: PlayerType) {
        self.cardHand = cardHand
        self.cardHand.sortHandByRank()
        self.playerType = playerType
        self.difficulty = "Easy"
    }
    
    func selectCardToPlay(topCard: PlayingCard) -> PlayingCard? {
        var playingCard : PlayingCard?
        playingCard = nil
        if difficulty == "Easy" {
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
    
    func getDifficulty() -> String{
        return difficulty
    }
    
    func setDifficulty(difficulty: String) {
        self.difficulty = difficulty
    }
    
    func toString() -> String {
        return "\(self.playerType): \(self.cardHand.toString())"
    }
}
