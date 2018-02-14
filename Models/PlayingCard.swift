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
    internal var cardSelected : Bool = false
    //internal var cardButton : UIButton = UIButton(type: UIButtonType.custom)
    
    required init(){
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
    
    required init?(coder aDecoder: NSCoder) {
        self.frontImage = UIImage(named: "cardfront")!
        self.rank = 0
        self.suit = String()
        self.clearCards = false
        super.init(coder: aDecoder)
        createCard()
    }
    
    func createCard() {
        //TODO
        //self.setImage(self.isUp() ? self.frontImage : self.backImage, for: UIControlState.normal)
        self.setImage(frontImage, for: UIControlState.normal)
        self.imageEdgeInsets = UIEdgeInsetsMake(4, 4, 4, 4)
        self.backgroundColor = UIColor.white
        self.frame = CGRect(x: 15, y: 50, width: 204, height: 104)
        self.layer.borderWidth = 3.0
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = 4.0
    }
    
    func toggleSelection(button: UIButton, cardCount: Int) -> Bool{
        var addCard = false
        if self.isSelected() {
            button.layer.borderColor = UIColor.black.cgColor
            setSelected(cardSelected: false)
        } else {
            if cardCount < 3 {
                button.layer.borderColor = UIColor.red.cgColor
                setSelected(cardSelected: true)
                addCard = true
            } else {
                print("Already selected 3 cards")
                addCard = false
            }
        }
        return addCard
    }
    
    func isSelected() -> Bool {
        return cardSelected
    }
    
    func setSelected(cardSelected: Bool) {
        self.cardSelected = cardSelected
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
