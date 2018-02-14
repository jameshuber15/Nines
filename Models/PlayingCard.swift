//
//  PlayingCard.swift
//  Three-Down
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
    internal var selected : Bool = false
    internal var cardButton : UIButton = UIButton(type: UIButtonType.custom)
    
    override init(){
        self.frontImage = UIImage(named: "cardfront")!
        self.rank = 0
        self.suit = String()
        self.clearCards = false
        super.init()
        createCard()
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
        createCard()
    }
    
    func createCard() {
        //TODO
        //cardButton.setImage(self.isUp() ? self.frontImage : self.backImage, for: UIControlState.normal)
        cardButton.setImage(frontImage, for: UIControlState.normal)
        cardButton.imageEdgeInsets = UIEdgeInsetsMake(4, 4, 4, 4)
        cardButton.backgroundColor = UIColor.white
        cardButton.frame = CGRect(x: 15, y: 50, width: 204, height: 104)
        cardButton.layer.borderWidth = 3.0
        cardButton.layer.borderColor = UIColor.black.cgColor
        cardButton.layer.cornerRadius = 4.0
    }
    
    func isSelected() -> Bool {
        return selected
    }
    
    func setSelected(selected: Bool) {
        self.selected = selected
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
    
    func setCardButton(cardButton: UIButton) {
        self.cardButton = cardButton
    }
    
    func getCardButton() -> UIButton {
        return cardButton
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
    
    func toString() -> String {
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
