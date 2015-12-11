//
//  DeathSpiral.swift
//  LetMeBeTheJudge
//
//  Created by Sherry Chen on 12/8/15.
//  Copyright (c) 2015 67442. All rights reserved.
//

import Foundation

enum DeathSpiralType : String {
    case ForwardInside = "Forward Inside", ForwardOutside = "Forward Outside", BackwardInside = "Backward Inside",
    BackwardOutside = "Backward Outside"
    
    func getAbbrev() -> String{
        switch self{
        case .ForwardInside:
            return "FiDs"
        case .ForwardOutside:
            return "FoDs"
        case .BackwardInside:
            return "BiDs"
        case .BackwardOutside:
            return "BoDs"
        }
    }
}

class DeathSpiral {
    var spiralDictionary = [DeathSpiralType : BaseValueLevels]()
    var type: DeathSpiralType
    var level: String?
    var featuresMet: Int = 0
    
    init(type: DeathSpiralType) {
        self.type = type
        setBaseValues()
    }
    
    func setLevel(level: String) {
        println(level)
        self.level = level
    }
    
    func setFeaturesMet(featuresMet: Int) {
        self.featuresMet = featuresMet
    }
    
    func getAbbrev() -> String {
        return "\(type.getAbbrev())\(level!)"
    }
    
    func getName() -> String {
        return "\(type.rawValue) Level \(level!)"
    }
    
    func getBaseValue() -> Float {
        return spiralDictionary[type]!.valueDictionary[level!]!
    }
    
    func setBaseValues() {
        spiralDictionary[DeathSpiralType.BackwardInside] = BaseValueLevels(levelB: 2.8, level1: 2.8, level2: 3.0, level3: 3.2, level4: 3.5)
        spiralDictionary[DeathSpiralType.ForwardInside] = BaseValueLevels(levelB: 2.8, level1: 2.8, level2: 3.0, level3: 3.2, level4: 3.5)
        
        spiralDictionary[DeathSpiralType.BackwardOutside] = BaseValueLevels(levelB: 3.0  , level1: 3.0, level2: 3.5, level3: 4.0, level4: 4.5)
        spiralDictionary[DeathSpiralType.ForwardOutside] = BaseValueLevels(levelB: 3.0, level1: 3.0, level2: 3.5, level3: 4.0, level4: 4.5)
    }
}

