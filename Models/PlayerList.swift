//
//  PlayerList.swift
//  Nines
//
//  Created by James HUBER on 2/8/18.
//  Copyright © 2018 James HUBER. All rights reserved.
//

import Foundation

class PlayerList {
    internal var head: PlayerNode?
    internal var tail: PlayerNode?
    internal var count = 0
    
    init(players: [Player]) {
        for x in 0..<players.count {
            append(player: players[x])
        }
    }
    
    func append(player: Player) {
        if self.isEmpty() {
            head = PlayerNode(player: player)
            tail = PlayerNode(player: player)
            head?.setPrevPlayer(prevPlayer: tail!)
            tail?.setNextPlayer(nextPlayer: head!)
            return
        }
        
        let newNode = PlayerNode(player: player, nextPlayer: head!, prevPlayer: tail!)
        tail?.setNextPlayer(nextPlayer: newNode)
        head?.setPrevPlayer(prevPlayer: newNode)
        tail = newNode
    }
    
    func isEmpty() -> Bool {
        return head == nil
    }
    
    func toString() -> String{
        var count: Int = 0
        var temp = head
        var result = ""
        while count < 2 {
            result = "\(result)\n\(temp?.toString() ?? ""))"
            if(temp?.getNextPlayer() === head) {
                count+=1
            }
            temp = temp?.getNextPlayer()
        }
        return result
    }
}
