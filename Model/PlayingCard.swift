//
//  PlayingCard.swift
//  Three-Down
//
//  Created by James HUBER on 2/6/18.
//  Copyright © 2018 James HUBER. All rights reserved.
//

import UIKit

class PlayingCard : UIButton {
    internal var rank : Int
    internal var suit : String
    internal var frontImage : UIImage
    internal var clearCards : Bool
    internal var cardSelected : Bool = false
    internal var backImage : UIImage
    internal var isFaceUp : Bool
    //internal var cardButton : UIButton = UIButton(type: UIButtonType.custom)
    
    required init?(coder aDecoder: NSCoder) {
        self.frontImage = UIImage(named: "cardfront")!
        backImage = UIImage(named: "back")!
        isFaceUp = false
        self.rank = -1
        self.suit = String()
        self.clearCards = false
        super.init(coder: aDecoder)
        createCard()
    }
    
    required init(){
        self.frontImage = UIImage(named: "cardfront")!
        backImage = UIImage(named: "back")!
        isFaceUp = false
        self.rank = -1
        self.suit = String()
        self.clearCards = false
        super.init(frame: CGRect.zero)
        createCard()
    }
    
    init(withRank: Int, ofSuit: String, frontImage : UIImage){
        self.frontImage = frontImage
        backImage = UIImage(named: "back")!
        isFaceUp = false
        rank = withRank
        suit = ofSuit
        if (withRank == 10) {
            clearCards = true
        } else {
            clearCards = false
        }
        super.init(frame: CGRect.zero)
        createCard()
    }
    
    func createCard() {
        self.setImage(self.isUp() ? self.frontImage : self.backImage, for: UIControlState.normal)
        self.imageEdgeInsets = UIEdgeInsetsMake(4, 4, 4, 4)
        self.backgroundColor = UIColor.white
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.borderWidth = 3.0
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = 4.0
        self.adjustsImageWhenDisabled = false
    }
    
    func toggleSelection(button: UIButton, selectable: Bool) -> Bool{
        var addCard = false
        if self.isSelected() {
            button.layer.borderColor = UIColor.black.cgColor
            setSelected(cardSelected: false)
        } else {
            if selectable {
                button.layer.borderColor = UIColor.red.cgColor
                setSelected(cardSelected: true)
                addCard = true
            } else {
                addCard = false
            }
        }
        return addCard
    }
    
    func copy() -> PlayingCard {
        let card = PlayingCard(withRank: self.rank, ofSuit: self.suit, frontImage : self.frontImage)
        card.setFacingUp(faceUp: self.isFaceUp)
        return card
    }
    func isSelected() -> Bool {
        return cardSelected
    }
    
    func setSelected(cardSelected: Bool) {
        self.cardSelected = cardSelected
    }
    
    func getBackImage() -> UIImage {
        return backImage
    }
    
    func setBackImage(backImage : UIImage) {
        self.backImage = backImage
    }
    
    func isUp() -> Bool {
        return isFaceUp
    }
    
    func setFacingUp(faceUp : Bool) {
        self.setImage(faceUp ? self.frontImage : self.backImage, for: UIControlState.normal)
        self.isFaceUp = faceUp
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

