//
//  BaseValueLevels.swift
//  LetMeBeTheJudge
//
//  Created by Sherry Chen on 12/6/15.
//  Copyright (c) 2015 67442. All rights reserved.
//

import Foundation

class BaseValueLevels {
    var valueDictionary = [String: Float]()
    
    init (levelB: Float?, level1: Float, level2: Float, level3: Float, level4: Float) {
        valueDictionary["B"] = levelB
        valueDictionary["1"] = level1
        valueDictionary["2"] = level2
        valueDictionary["3"] = level3
        valueDictionary["4"] = level4
    }
    
    func getLevelB() -> Float{
        return self.valueDictionary["B"]!
    }
    
    func getLevel1() -> Float{
        return self.valueDictionary["1"]!
    }
    
    func getLevel2() -> Float{
        return self.valueDictionary["2"]!
    }
    
    func getLevel3() -> Float{
        return self.valueDictionary["3"]!
    }
    
    func getLevel4() -> Float{
        return self.valueDictionary["4"]!
    }
    
}