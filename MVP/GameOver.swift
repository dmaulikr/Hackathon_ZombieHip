//
//  GameMenu.swift
//  MVP
//
//  Created by Huy Pham on 3/28/17.
//  Copyright © 2017 Huy Pham. All rights reserved.
//

import Foundation
import SpriteKit

class GameMenu : SKScene {
    
    var startGame = SKSpriteNode()
    var mainMenu = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        startGame = self.childNode(withName: "startGame") as! SKSpriteNode
    //    mainMenu = self.childNode(withName: "mainMenu") as! SKSpriteNode
     
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchLocation = touch.location(in: self)
            if atPoint(touchLocation).name == "startGame" {
                let gameScene = SKScene(fileNamed: "GameLevels")!
             gameScene.scaleMode = .aspectFill
                view?.presentScene(gameScene, transition: SKTransition.doorsOpenHorizontal(withDuration: TimeInterval(2)))
            }
            if atPoint(touchLocation).name == "mainMenu" {
                let gameScene = SKScene(fileNamed: "GameLevels")!
                gameScene.scaleMode = .aspectFill
                view?.presentScene(gameScene, transition: SKTransition.doorsOpenHorizontal(withDuration: TimeInterval(2)))
            }

        }
    }
}
