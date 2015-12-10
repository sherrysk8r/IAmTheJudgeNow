//
//  ThrowJump.swift
//  LetMeBeTheJudge
//
//  Created by Sherry Chen on 12/8/15.
//  Copyright (c) 2015 67442. All rights reserved.
//

import Foundation

class ThrowJump {
    var jumpType: JumpType
    var revolutions: Int
    var baseValue: Float = 0.0
    var jumpManager = JumpManager()
    
    init(jumpType: JumpType, revolutions: Int){
        self.jumpType = jumpType
        self.revolutions = revolutions
        self.baseValue = getBaseValue()
    }
    
    func getBaseValue() -> Float{
        baseValue = jumpManager.getBaseValue(false, revolutions: revolutions, jumpType: jumpType)
        return baseValue
    }
    
    func getAbbrev() -> String {
        return "\(revolutions)\(jumpType.getAbbrev())Th"
    }
    
    func getName() -> String {
        return "\(Revolutions.revolutions[revolutions]!) \(jumpType.rawValue) Throw"
    }
}