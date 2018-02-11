//
//  GameVIew.swift
//  Nines
//
//  Created by James HUBER on 2/10/18.
//  Copyright © 2018 James HUBER. All rights reserved.
//

import UIKit

class GameView: UIView {
    var shouldSetupConstraints = true
    
    var playerView: UIImageView!
    var aiGameView: UIImageView!
    var gameBoardView: UIImageView!
    
    let screenSize = UIScreen.main.bounds

    override init(frame: CGRect){
        super.init(frame: frame)
        buildGameViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildGameViews() {
        buildPlayerView()
        buildAIGameView()
        buildGameBoardView()
    }
    
    func buildPlayerView() {
        playerView = UIImageView(frame: CGRect.zero)
        playerView.backgroundColor = UIColor.gray
        
        self.addSubview(playerView)
        
    }
    
    func buildAIGameView() {
        aiGameView = UIImageView(frame: CGRect.zero)
        aiGameView.backgroundColor = UIColor.gray
    }
    
    func buildGameBoardView() {
        
    }
    
    override func updateConstraints() {
        if(shouldSetupConstraints) {
            // AutoLayout constraints
            shouldSetupConstraints = false
        }
        super.updateConstraints()
    }
}
