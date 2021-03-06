//
//  Globals.swift
//  Three-Down
//
//  Created by James HUBER on 2/8/18.
//  Copyright © 2018 James HUBER. All rights reserved.
//

import Foundation

enum PlayerType {
    case AI
    case Human
    case NA
}

enum MoveType {
    case DrawCards
    case ThreeCardsDown
    case ThreeCardsUp
    case FirstTurn
    case GamePlay
}

enum CardType {
    case Board
    case Hand
}

enum Difficulty {
    case Easy
    case Hard
    case None //For Humans
}

let cardHeight = NSNumber(value: 113)
let cardWidth = NSNumber(value: 65)

