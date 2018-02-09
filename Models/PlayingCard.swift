//
//  PlayingCard.swift
//  Nines
//
//  Created by James HUBER on 2/6/18.
//  Copyright © 2018 James HUBER. All rights reserved.
//

import UIKit

class PlayingCard : Card {
    internal var rank : Int
    internal var suit : String
    internal var frontImage : UIImage
    internal var clearCards : Bool
    
    override init(){
        self.frontImage = UIImage(named: "cardfront")!
        self.rank = 0
        self.suit = String()
        self.clearCards = false
        super.init()
    }
    
    init(withRank: Int, ofSuit: String, frontImage : String){
        self.frontImage = UIImage(named: frontImage)!
        rank = withRank
        suit = ofSuit
        if (withRank == 10) {
            clearCards = true
        } else {
            clearCards = false
        }
        super.init()
    }
    
    func getRank() -> Int {
        return rank
    }
    
    func setRank(rank: Int) {
        self.rank = rank
    }
    
    func getSuit() -> String {
        return suit
    }
    
    func setSuit(suit: String) {
        self.suit = suit
    }
    
    func setClearCards(clearCards: Bool) {
        self.clearCards = clearCards
    }
    
    func getClearCards() -> Bool {
        return clearCards
    }
    
    class func validRanks() -> [String] {
        return ["??","??","2","3","4","5","6","7","8","9","10","J","Q","K","A"]
    }
    
    class func maxRank() -> Int {
        return validRanks().count - 1
    }
    
    class func validSuits() -> [String] {
        return ["♠️","❤️","♦️","♣️"]
    }
    
    override func toString() -> String {
        var rankStr : String
        switch rank {
        case 11:
            rankStr = "J"
        case 12:
            rankStr = "Q"
        case 13:
            rankStr = "K"
        case 14:
            rankStr = "A"
        default:
            rankStr = String(rank)
        }
        return "\(rankStr)\(suit)"
    }
}
