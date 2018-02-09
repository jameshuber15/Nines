//
//  PlayerList.swift
//  Nines
//
//  Created by James HUBER on 2/8/18.
//  Copyright © 2018 James HUBER. All rights reserved.
//

import Foundation

class PlayerList {
    internal var head: PlayerNode? = nil
    internal var tail: PlayerNode? = nil
    internal var size = 0

    init(players: [Player]) {
        for x in 0..<players.count-1 {
            append(player: players[x])
        }
    }
    
    func append(player: Player) {
        size+=1
        print("Adding player \(size)")
        if self.isEmpty() {
            print("Adding First Player")
            head = PlayerNode(player: player)
            tail = PlayerNode(player: player)
            head?.setPrevPlayer(prevPlayer: tail!)
            tail?.setNextPlayer(nextPlayer: head!)
            return
        }
        
        let newNode = PlayerNode(player: player, nextPlayer: head!, prevPlayer: tail!)
        if(tail?.getPlayer() === head?.getPlayer()) {
            head?.setNextPlayer(nextPlayer: newNode)
            tail?.setPrevPlayer(prevPlayer: newNode)
        }
        tail?.setNextPlayer(nextPlayer: newNode)
        head?.setPrevPlayer(prevPlayer: newNode)
        tail = newNode
    }
    
    func getSize() -> Int {
        return size
    }
    
    func isEmpty() -> Bool {
        return head == nil
    }
    
    func toString() -> String{
        var count: Int = 0
        var temp = head
        var result = ""
        while count < 1 {
            result = "\(result)\n\(temp?.toString() ?? ""))"
            if(temp?.getNextPlayer() === head) {
                count+=1
            }
            temp = temp?.getNextPlayer()
        }
        return result
    }
}
