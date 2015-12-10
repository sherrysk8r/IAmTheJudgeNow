//
//  Twizzle.swift
//  LetMeBeTheJudge
//
//  Created by Sherry Chen on 12/10/15.
//  Copyright (c) 2015 67442. All rights reserved.
//

import Foundation

class Twizzle {
    var baseValues: BaseValueLevels
    var abbrev:String?
    var level: String?
    var featuresMet: Int
    init (level: String, featuresMet: Int) {
        self.level = level
        self.featuresMet = featuresMet
        baseValues = BaseValueLevels(levelB: 3.1, level1: 3.1, level2: 4.6, level3: 5.6, level4: 6.6)
    }
    
    func getBaseValue() -> Float {
        return baseValues.valueDictionary[level!]!
    }
    
    func getAbbrev() -> String {
        return "St\(level!)"
    }
    
    func getName() -> String {
        return "Step Sequence Level \(level!)"
    }
    

}