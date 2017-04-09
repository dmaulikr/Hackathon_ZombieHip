//
//  GameScene.swift
//  MVP
//
//  Created by Huy Pham on 3/19/17.
//  Copyright © 2017 Huy Pham. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var imageGameover = SKSpriteNode(fileNamed: "gameover.png")
    
    let car_left = Car_Left1(imageNamed: "car_red copy.png")
    let car_right = Car_Right(imageNamed: "blue_car.png")
    
    let background = SKSpriteNode(imageNamed: "backgroun2.png")
    let background2 = SKSpriteNode(imageNamed: "backgroun2.png")
    
    var enemy : [Enemy] = []
    
    var enemy_Left_Manager : Enemy_Left_Manager!
    var enemy_Right_Manager : Enemy_Right_Manager!
    
    var leftCarAtRight = false
    var rightCarAtLeft = false
    
    var leftToMoveLeft = true
    var righToMoveRight = true
    var CenterPoint : CGFloat!
    
    var leftCarMinimumX: CGFloat! //80
    var leftCarMaximumX: CGFloat! //130
    var rightCarMinimumX: CGFloat! //190
    var rightCarMaximumX: CGFloat! //240
    
    
    var left_touched:Bool = false
    var right_touched:Bool = false
    
    override func didMove(to view: SKView) {
        anchorPoint = CGPoint(x: 0, y: 0)
        configPhysics()
        addCar()
        setUp()
        
        enemy_Left_Manager  = Enemy_Left_Manager(scene: self)
        enemy_Right_Manager = Enemy_Right_Manager(scene: self)
        
        
        leftCarMinimumX = self.size.width / 4
        leftCarMaximumX = self.size.width * 0.41
        
        rightCarMaximumX = self.size.width * 0.75
        rightCarMinimumX = self.size.width * 0.59
        
        background.position = CGPoint(x: 0.5 , y: 0.5)
        background.anchorPoint = CGPoint(x: 0, y: 0)
        background.zPosition = -2
        background.size = CGSize(width: self.size.width, height: self.size.height)
        
        background2.anchorPoint = CGPoint(x: 0, y: 0)
        background2.position = CGPoint(x: 0, y: background2.size.height)
        background2.size = CGSize(width: self.size.width, height: self.size.height)
        background2.zPosition = -2
        
        addChild(background)
        addChild(background2)
    }
    
    func configPhysics() -> Void {
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        self.physicsWorld.contactDelegate = self
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        let bodyA = contact.bodyA
        let bodyB = contact.bodyB
        
        guard let nodeA = bodyA.node, let nodeB = bodyB.node else {
            return
        }
        
        if let contactDelegateA = nodeA as? ContactDelegate {
            contactDelegateA.didContact(other: nodeB)
           // afterCollision()
            print("aaaa")
        }
        
        if let contactDelegateB = nodeB as? ContactDelegate {
            contactDelegateB.didContact(other: nodeA)
           // afterCollision()
            print("bbbbb")
        }

    }
    
    
    
    func addCar() -> Void {
        car_left.position = CGPoint(x: self.size.width / 4, y: 70)
        car_left.size = CGSize(width: self.size.width / 10, height: self.size.height / 12)
        
        car_right.position = CGPoint(x: self.size.width * 0.59 , y: 70)
        car_right.size = CGSize(width: self.size.width / 10, height: self.size.height / 12)
        
        self.addChild(car_left)
        self.addChild(car_right)
    }
    
    func car_left_move_right() -> Void {
        let path = CGMutablePath()
        path.move(to: CGPoint(x:  leftCarMinimumX, y: 69))
        path.addCurve(to: CGPoint(x: leftCarMaximumX, y: 69), control1: CGPoint(x: 93, y: 70), control2: CGPoint(x: 100, y: 70))
        car_left.zRotation = CGFloat(-(Double.pi / 7))
        car_left.run(.follow(path, asOffset: false, orientToPath: false, speed: 280)) {
            self.car_left.zRotation = CGFloat(Double.pi / 100)
        }
    }
    
    func car_left_move_left() -> Void {
        let path = CGMutablePath()
        path.move(to: CGPoint(x:  leftCarMaximumX, y: 69))
        path.addCurve(to: CGPoint(x: leftCarMinimumX, y: 69), control1: CGPoint(x: 80, y: 70), control2: CGPoint(x: 83, y: 70))
        car_left.zRotation = CGFloat(Double.pi / 7)
        car_left.run(.follow(path, asOffset: false, orientToPath: false, speed: 280)) {
            self.car_left.zRotation = CGFloat(Double.pi / 100)
        }
    }
    
    func car_right_move_right() -> Void {
        let path = CGMutablePath()
        path.move(to: CGPoint(x:  rightCarMinimumX, y: 69)) // 188 // 240
        path.addCurve(to: CGPoint(x: rightCarMaximumX, y: 69), control1: CGPoint(x: 190, y: 70), control2: CGPoint(x: 209, y: 70))
        car_right.zRotation = CGFloat(-(Double.pi / 7))
        car_right.run(.follow(path, asOffset: false, orientToPath: false, speed: 280)) {
            self.car_right.zRotation = CGFloat(Double.pi / 100)
        }
    }
    
    func car_right_move_left() -> Void {
        let path = CGMutablePath()
        path.move(to: CGPoint(x:  rightCarMaximumX, y: 69))
        path.addCurve(to: CGPoint(x: rightCarMinimumX, y: 69), control1: CGPoint(x: 190, y: 70), control2: CGPoint(x: 209, y: 70))
        car_right.zRotation = CGFloat(Double.pi / 7)
        car_right.run(.follow(path, asOffset: false, orientToPath: false, speed: 280)) {
            self.car_right.zRotation = CGFloat(Double.pi / 100)
        }
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            
            let touchLocation = touch.location(in: self)
            if CGFloat(touchLocation.x) > CenterPoint {
                if rightCarAtLeft {
                    rightCarAtLeft = false
                    righToMoveRight = true
                    right_touched = true
                }
                else {
                    rightCarAtLeft = true
                    righToMoveRight = false
                    right_touched = true
                }
            }
            else {
                if leftCarAtRight {
                    leftCarAtRight = false
                    leftToMoveLeft = true
                    left_touched = true
                }
                else {
                    leftCarAtRight = true
                    leftToMoveLeft = false
                    left_touched = true
                }
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        left_touched = false
        right_touched = false
    }
    
    func setUp() {
        CenterPoint = self.frame.size.width / 2
    }
    
    func moveCarLeft() {
        if leftToMoveLeft {
            if car_left.position.x > leftCarMinimumX {
                car_left_move_left()
            }
        }
        else {
            if car_left.position.x  < leftCarMaximumX {
                car_left_move_right()
            }
        }
    }
    
    func moveCarRight() {
        if righToMoveRight {
            if car_right.position.x > rightCarMinimumX {
                car_right_move_left()
            }
        }
        else {
            if car_right.position.x  < rightCarMaximumX {
                car_right_move_right()            }
        }
    }
    
    func backGround(SpeedBackGround : CGFloat) {
        background.position = CGPoint(x: background.position.x , y: background.position.y - SpeedBackGround)
        background2.position = CGPoint(x: background2.position.x , y: background2.position.y - SpeedBackGround)
        
        if background.position.y < -background2.size.height {
            background.position = CGPoint(x: background2.position.x , y: background2.position.y + background.size.height)
        }
        
        if background2.position.y < -background.size.height {
            background2.position = CGPoint(x: background.position.x , y: background.position.y + background2.size.height)
        }
        
    }
    
    let ITEM_LEFT_NAME = "Item left"
    let ITEM_RIGHT_NAME = "Item right"
    
    var startTime : TimeInterval = -1
    var startTime1 : TimeInterval = -1
    var startTime2 : TimeInterval = -1
    override func update(_ currentTime: TimeInterval) {
        if currentTime - startTime > 2 {
            enemy_Left_Manager.addEnemy()
            startTime = currentTime
        }
        
        if currentTime - startTime1 > 1.5 {
            enemy_Right_Manager.addEnemy()
            startTime1 = currentTime
        }
        
//        if currentTime - startTime2 > 10 {
//            afterCollision()
//            startTime2 = currentTime
//        }

        
        backGround(SpeedBackGround: 10)
        
        if left_touched {
            moveCarLeft()
        }
        
        if right_touched {
            moveCarRight()
        }
        
    
        
        
    }
    
    func afterCollision() -> Void {
        let menuScene = SKScene(fileNamed: "GameOver")!
        menuScene.scaleMode = .aspectFill
        view?.presentScene(menuScene, transition: SKTransition.doorsCloseHorizontal(withDuration: TimeInterval(2)))
    }
}
