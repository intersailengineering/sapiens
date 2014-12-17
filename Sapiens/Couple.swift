//
//  Couple.swift
//  Sapiens
//
//  Created by Cristiano Boncompagni on 14/12/14.
//  Copyright (c) 2014 Cristiano Boncompagni. All rights reserved.
//

import Foundation
import SpriteKit

class Couple
{
    var first : SKSpriteNode
    var second : SKSpriteNode
    
    var firstTouched:Bool = false
    var secondTouched:Bool = false
    
    init(firstImageName: String, secondImageName: String) {
        self.first = SKSpriteNode(imageNamed: firstImageName)
        self.second = SKSpriteNode(imageNamed: secondImageName)
    }
    
    init(first : SKSpriteNode, second: SKSpriteNode)
    {
        self.first = first
        self.second = second
    }
    
    func isTouched(node:SKSpriteNode) -> Bool {
        return (node == first && firstTouched) || (node == second && secondTouched)
    }
    
    func touched(node:SKSpriteNode) -> SKSpriteNode? {
        if(node == first && !firstTouched)
        {
            firstTouched = true
            touch(first)
            return first
        }
        if(node == second && !secondTouched)
        {
            secondTouched = true
            touch(second)
            return second
        }
        return nil
    }
    
    private func touch(node: SKSpriteNode) {
        let action1 = SKAction.scaleTo(1.5, duration: 0.5)
        let action2 = SKAction.scaleTo(1, duration: 0.5)
        let action = SKAction.sequence([action1, action2])
        
        node.runAction(SKAction.repeatActionForever(action))
    }
    
    func untouched(node:SKSpriteNode) -> SKSpriteNode? {
        if(node == first && firstTouched)
        {
            firstTouched = false
            untouch(first)
            return first
        }
        if(node == second && secondTouched)
        {
            secondTouched = false
            untouch(second)
            return second
        }
        return nil
    }
    
    func stop() {
        untouch(first)
        untouch(second)
    }
    
    func reset() {
        stop()
        firstTouched=false
        secondTouched=false
    }
    
    private func untouch(node:SKSpriteNode) {
        node.removeAllActions()
        node.setScale(1)
    }
    
    func allTouched() -> Bool {
        return firstTouched && secondTouched
    }
}