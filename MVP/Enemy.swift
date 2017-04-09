//
//  Enemy.swift
//  MVP
//
//  Created by Huy Pham on 4/9/17.
//  Copyright © 2017 Huy Pham. All rights reserved.
//

import Foundation
import SpriteKit

class Enemy : SKSpriteNode, ContactDelegate {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        self.name = Names.ENEMY_LEFT
        configPhysics()
    }
    
    func configPhysics() -> Void {
        self.physicsBody = SKPhysicsBody(rectangleOf: self.size)
        
        self.physicsBody?.collisionBitMask = 0
        self.physicsBody?.linearDamping = 0
        self.physicsBody?.categoryBitMask = BitMasks.ITEM_LEFT
        self.physicsBody?.contactTestBitMask = BitMasks.CAR_LEFT
        self.physicsBody?.velocity = CGVector(dx: 0, dy: -300)
        self.physicsBody?.mass = 0

    }
    
    func didContact(other: SKNode) {
        
    }
    
}
