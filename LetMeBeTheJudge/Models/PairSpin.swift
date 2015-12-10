//
//  PairSpin.swift
//  LetMeBeTheJudge
//
//  Created by Sherry Chen on 12/10/15.
//  Copyright (c) 2015 67442. All rights reserved.
//

import Foundation

class PairSpin {
    var level: String
    var featuresMet: Int
    var baseValues: BaseValueLevels
    
    init(level: String, featuresMet: Int) {
        self.level = level
        self.featuresMet = featuresMet
        self.baseValues = BaseValueLevels(levelB: 2.0, level1: 2.0, level2: 2.5, level3: 3.0, level4: 3.5)
    }
    
    func getAbbrev() -> String {
        return "PSp\(level)"
    }
    
    func getName() -> String {
        return "Pair Spin Level \(level)"
    }
    
    func getBaseValue() -> Float {
        return baseValues.valueDictionary[level]!
    }
}