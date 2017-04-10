//
//  Car.swift
//  MVP
//
//  Created by Huy Pham on 4/9/17.
//  Copyright © 2017 Huy Pham. All rights reserved.
//

import Foundation
import SpriteKit

class Car_Left1 : SKSpriteNode, ContactDelegate {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        self.name = Names.CAR_LEFT_1
        print("vao a")
        configPhysics()
    }
    
    func configPhysics() -> Void {
        print("configPhysics");
        self.physicsBody = SKPhysicsBody(rectangleOf: SKTexture(imageNamed: "car_red copy").size())
        self.physicsBody?.collisionBitMask = 0
        self.physicsBody?.linearDamping = 0
        self.physicsBody?.categoryBitMask = BitMasks.CAR_LEFT
        self.physicsBody?.contactTestBitMask = BitMasks.ITEM_LEFT
        print(self.position.x)
        print(self.position.y)
    }

    
    func didContact(other: SKNode) {
        
    }
    

}
