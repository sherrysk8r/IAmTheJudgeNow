//
//  StepSequence.swift
//  LetMeBeTheJudge
//
//  Created by Sherry Chen on 12/7/15.
//  Copyright (c) 2015 67442. All rights reserved.
//

import Foundation

class StepSequence{
    var baseValues: BaseValueLevels
    var abbrev:String?
    var level: String?
    var featuresMet: Int
    init (level: String, featuresMet: Int) {
        self.level = level
        self.featuresMet = featuresMet
        baseValues = BaseValueLevels(levelB: 1.5, level1: 1.8, level2: 2.6, level3: 3.3, level4: 3.9)
    }
    
    func getBaseValue() -> Float {
        switch level! {
        case "B":
            return getLevelB()
        case "1":
            return getLevel1()
        case "2":
            return getLevel2()
        case "3":
            return getLevel3()
        case "4":
            return getLevel4()
        default:
            return getLevelB()
        }
    }
    
    func getAbbrev() -> String {
        return "St\(level!)"
    }
    
    func getName() -> String {
        return "Step Sequence Level \(level!)"
    }
    
    func getLevelB() -> Float {
        return baseValues.getLevelB()
    }
    
    func getLevel1() -> Float {
        return baseValues.getLevel1()
    }
    
    func getLevel2() -> Float {
        return baseValues.getLevel2()
    }
    
    func getLevel3() -> Float {
        return baseValues.getLevel3()
    }
    
    func getLevel4() -> Float {
        return baseValues.getLevel4()
    }
}