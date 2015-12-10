//
//  Jump.swift
//  LetMeBeTheJudge
//
//  Created by Sherry Chen on 12/2/15.
//  Copyright (c) 2015 67442. All rights reserved.
//

import Foundation

class Jump{
    var jumpType: JumpType
    var revolutions: Int
    var secondHalf: Bool
    var baseValue: Float = 0.0
    var jumpManager = JumpManager()
    
    init(jumpType: JumpType, revolutions: Int, secondHalf: Bool){
        self.jumpType = jumpType
        self.revolutions = revolutions
        self.secondHalf = secondHalf
        baseValue = getBaseValue()
    }
    
    func getBaseValue() -> Float{
        baseValue = jumpManager.getBaseValue(true, revolutions: revolutions, jumpType: jumpType)
        
        if secondHalf{
            baseValue = baseValue*1.1
        }
        return baseValue
    }
    
    func getAbbrev() -> String {
        return "\(revolutions)\(jumpType.getAbbrev())"
    }
    
    func getName() -> String {
        return "\(Revolutions.revolutions[revolutions]!) \(jumpType.rawValue)"
    }
}