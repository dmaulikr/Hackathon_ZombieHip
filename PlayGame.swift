//
//  PlayMenu.swift
//  MVP
//
//  Created by Admin on 4/9/17.
//  Copyright © 2017 Huy Pham. All rights reserved.
//

import Foundation
import SpriteKit

class PlayGame : SKScene {
    
    var startGame = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        startGame = self.childNode(withName: "startGame") as! SKSpriteNode
        //self.scaleMode = .aspectFill
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
      
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchLocation = touch.location(in: self)
            if atPoint(touchLocation).name == "startGame" {
                let gameLevel = SKScene(fileNamed: "GameLevels")!
                print("vao game level")
                gameLevel.scaleMode = .aspectFill
                view?.presentScene(gameLevel, transition: SKTransition.doorsOpenHorizontal(withDuration: TimeInterval(2)))
            }
        }
    }


   }
