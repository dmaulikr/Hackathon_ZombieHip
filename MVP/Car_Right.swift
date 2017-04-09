//
//  Car.swift
//  MVP
//
//  Created by Huy Pham on 4/9/17.
//  Copyright © 2017 Huy Pham. All rights reserved.
//

import Foundation
import SpriteKit

class Car_Right : SKSpriteNode {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        configPhysics()
    }
    
    func configPhysics() -> Void {
        self.physicsBody = SKPhysicsBody(rectangleOf: self.size)
        self.physicsBody?.collisionBitMask = 0
        self.physicsBody?.linearDamping = 0
        self.physicsBody?.categoryBitMask = BitMasks.CAR_RIGHT
        self.physicsBody?.contactTestBitMask = BitMasks.ITEM_RIGHT
    }
    
    func didContact(other: SKNode) -> Void {
        other.removeFromParent()
        self.removeFromParent()
    }
    
}
