//
//  ManHinh2Scene.swift
//  MVP
//
//  Created by Huy Pham on 4/5/17.
//  Copyright © 2017 Huy Pham. All rights reserved.
//

import SpriteKit

class ManHinh2Scene: SKScene {
    let imageGameover = SKSpriteNode(imageNamed: "gameover.png")
    var playLabel:SKLabelNode!
    
    override func didMove(to view: SKView) {
        anchorPoint = CGPoint(x: 0, y: 0)
        
        imageGameover.size = CGSize(width: self.frame.size.width, height: self.frame.size.height)
        imageGameover.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        imageGameover.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        imageGameover.zPosition = -2
        
        
        playLabel = SKLabelNode(text: "PLAY AGAIN")
        playLabel.position = CGPoint(x: self.size.width / 2 , y: 50)
        playLabel.fontSize = 40
        playLabel.fontColor = UIColor.white
        
        
        addChild(playLabel)
        addChild(imageGameover)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchLocation = touch.location(in: self)
            if touchLocation == playLabel.position {
                let gameScene = SKScene(fileNamed: "GameScene")!
                gameScene.scaleMode = scaleMode
                let reveal = SKTransition.fade(withDuration: 2)
                view?.presentScene(gameScene, transition: reveal)
            }
        }
    }
}
