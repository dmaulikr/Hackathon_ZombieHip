//
//  FlyManager.swift
//  SwiftLearning
//
//  Created by huynq on 3/23/17.
//  Copyright © 2017 techkidsvn. All rights reserved.
//

import Foundation
import SpriteKit

class Enemy_Left_Manager {
    
    var enemy : [Enemy] = []
    let scene : SKScene
    
    init(scene : SKScene) {
        self.scene = scene
        print( " vao vao ")
    }

    func addEnemy() -> Void {
        let random = arc4random_uniform(2) + 1
        if random == 1 {
            let ItemNode = Enemy(imageNamed: "Untitled-2.png")
            ItemNode.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            ItemNode.position = CGPoint(x: self.scene.size.width / 4, y: self.scene.size.height + self.scene.size.height / 10)
       //     ItemNode.size = CGSize(width: self.scene.size.width / 7, height: self.scene.size.height / 8)
            ItemNode.zRotation = CGFloat(M_PI / 1)
            
            print("vao 1")
            
            self.scene.addChild(ItemNode)
            self.enemy.append(ItemNode)
        }
        else {
            let ItemNode = Enemy(imageNamed: "car3.png")
            ItemNode.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            ItemNode.position = CGPoint(x: self.scene.size.width * 0.4, y: self.scene.size.height + self.scene.size.height / 10)
            ItemNode.size = CGSize(width: self.scene.size.width / 7, height: self.scene.size.height / 8)
            ItemNode.zRotation = CGFloat(M_PI / 1)
            
            print("vao 2")
            
            self.scene.addChild(ItemNode)
            self.enemy.append(ItemNode)
        }

    }
}



