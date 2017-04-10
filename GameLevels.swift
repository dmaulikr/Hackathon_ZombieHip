//
//  GameLevels.swift
//  MVP
//
//  Created by Admin on 4/11/17.
//  Copyright © 2017 Huy Pham. All rights reserved.
//

import Foundation
import SpriteKit

class GameLevels : SKScene {
    
    var easyMode = SKSpriteNode()
    var mediumMode = SKSpriteNode()
    var hardMode = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        easyMode = self.childNode(withName: "easyMode") as! SKSpriteNode
        
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchLocation = touch.location(in: self)
            
            if atPoint(touchLocation).name == "easyMode" {
                let gameScene = SKScene(fileNamed: "GameScene")!
                // gameScene.scaleMode = .aspectFill
                self.view?.presentScene(gameScene, transition: SKTransition.doorsOpenHorizontal(withDuration: TimeInterval(2)))
            }
            
            if atPoint(touchLocation).name == "mediumMode" {
                let gameScene = SKScene(fileNamed: "GameScene")!
                // gameScene.scaleMode = .aspectFill
                self.view?.presentScene(gameScene, transition: SKTransition.doorsOpenHorizontal(withDuration: TimeInterval(2)))
            }
            
            if atPoint(touchLocation).name == "hardMode" {
                let gameScene = SKScene(fileNamed: "GameScene")!
                // gameScene.scaleMode = .aspectFill
                self.view?.presentScene(gameScene, transition: SKTransition.doorsOpenHorizontal(withDuration: TimeInterval(2)))
            }
        }
    }
    
}
