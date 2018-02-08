//
//  PlayerNode.swift
//  Nines
//
//  Created by James HUBER on 2/8/18.
//  Copyright © 2018 James HUBER. All rights reserved.
//

import Foundation

class PlayerNode {
    internal var player: Player
    internal var prevPlayer: PlayerNode?
    internal var nextPlayer: PlayerNode?
    
    init(player: Player) {
        self.player = player
        self.prevPlayer = nil
        self.nextPlayer = nil
    }
    
    init(player: Player, prevPlayer: PlayerNode) {
        self.player = player
        self.prevPlayer = prevPlayer
        self.nextPlayer = nil
    }
    
    init(player: Player, nextPlayer: PlayerNode) {
        self.player = player
        self.nextPlayer = nextPlayer
        self.prevPlayer = nil
    }
    
    init(player: Player, nextPlayer: PlayerNode, prevPlayer: PlayerNode) {
        self.player = player
        self.nextPlayer = nextPlayer
        self.prevPlayer = prevPlayer
    }
    
    func getPlayer() -> Player {
        return player
    }
    
    func setPlayer(player: Player) {
        self.player = player
    }
    
    func getNextPlayer() -> PlayerNode {
        return nextPlayer!
    }
    
    func setNextPlayer(nextPlayer: PlayerNode) {
        self.nextPlayer = nextPlayer
    }
    
    func getPrevPlayer() -> PlayerNode {
        return prevPlayer!
    }
    
    func setPrevPlayer(prevPlayer: PlayerNode) {
        self.prevPlayer = prevPlayer
    }
    
    func toString() -> String {
        return player.toString()
    }
}
