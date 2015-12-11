//
//  SpinManager.swift
//  LetMeBeTheJudge
//
//  Created by Sherry Chen on 12/7/15.
//  Copyright (c) 2015 67442. All rights reserved.
//

import Foundation

class SpinManager {
    var spins = [SpinType: Spin]() //defines the base values
    var deductions = [Deduction]()
    var positiveGOE = [String]()
    
    init() {
        setBaseValues()
    }
    
    func getBaseValue(spinType: SpinType, level: String) -> Float {
        return spins[spinType]!.baseValues!.valueDictionary[level]!
    }
    
    func setBaseValues() {
        spins[SpinType.Upright] = Spin(type: SpinType.Upright, baseValues: BaseValueLevels(levelB: 1.0, level1: 1.2, level2: 1.5, level3: 1.9, level4: 2.4))
        spins[SpinType.Layback] = Spin(type: SpinType.Layback, baseValues: BaseValueLevels(levelB: 1.2, level1: 1.5, level2: 1.9, level3: 2.4, level4: 2.7))
        spins[SpinType.Camel] = Spin(type: SpinType.Camel, baseValues: BaseValueLevels(levelB: 1.1, level1: 1.4, level2: 1.8, level3: 2.3, level4: 2.6))
        spins[SpinType.Sit] = Spin(type: SpinType.Sit, baseValues: BaseValueLevels(levelB: 1.1, level1: 1.3, level2: 1.6, level3: 2.1, level4: 2.5))
        
        spins[SpinType.FlyingUpright] = Spin(type: SpinType.FlyingUpright, baseValues: BaseValueLevels(levelB: 1.5, level1: 1.7, level2: 2.0, level3: 2.4, level4: 2.9))
        spins[SpinType.FlyingLayback] = Spin(type: SpinType.FlyingLayback, baseValues: BaseValueLevels(levelB: 1.7, level1: 2.0, level2: 2.4, level3: 2.9, level4: 3.2))
        spins[SpinType.FlyingCamel] = Spin(type: SpinType.FlyingCamel, baseValues: BaseValueLevels(levelB: 1.6, level1: 1.9, level2: 2.3, level3: 2.8, level4: 3.2))
        spins[SpinType.FlyingSit] = Spin(type: SpinType.FlyingSit, baseValues: BaseValueLevels(levelB: 1.7, level1: 2.0, level2: 2.3, level3: 2.6, level4: 3.0))
        
        spins[SpinType.FootChangeUpright] = Spin(type: SpinType.FootChangeUpright, baseValues: BaseValueLevels(levelB: 1.5, level1: 1.7, level2: 2.0, level3: 2.4, level4: 2.9))
        spins[SpinType.FootChangeLayback] = Spin(type: SpinType.FootChangeLayback, baseValues: BaseValueLevels(levelB: 1.7, level1: 2.0, level2: 2.4, level3: 2.9, level4: 3.2))
        spins[SpinType.FootChangeCamel] = Spin(type: SpinType.FootChangeCamel, baseValues: BaseValueLevels(levelB: 1.7, level1: 2.0, level2: 2.4, level3: 2.9, level4: 3.2))
        spins[SpinType.FootChangeSit] = Spin(type: SpinType.FootChangeSit, baseValues: BaseValueLevels(levelB: 1.7, level1: 2.0, level2: 2.3, level3: 2.8, level4: 3.2))
        
        spins[SpinType.PositionChangeCombination] = Spin(type: SpinType.PositionChangeCombination, baseValues: BaseValueLevels(levelB: 1.5, level1: 1.7, level2: 2.0, level3: 2.5, level4: 3.0))
        spins[SpinType.PositionFootChangeCombination] = Spin(type: SpinType.PositionFootChangeCombination, baseValues: BaseValueLevels(levelB: 1.7, level1: 2.0, level2: 2.5, level3: 3.0, level4: 3.5))
    }
    
    func getBasicSpins() -> [Spin] {
        return Array(arrayLiteral: spins[SpinType.Upright]!, spins[SpinType.Layback]!, spins[SpinType.Camel]!, spins[SpinType.Sit]!)
    }
    
    func getFlyingSpins() -> [Spin] {
        return Array(arrayLiteral: spins[SpinType.FlyingUpright]!, spins[SpinType.FlyingLayback]!, spins[SpinType.FlyingCamel]!, spins[SpinType.FlyingSit]!)
    }
    
    func getFootChangeSpins() -> [Spin] {
        return Array(arrayLiteral: spins[SpinType.FootChangeUpright]!, spins[SpinType.FootChangeLayback]!, spins[SpinType.FootChangeCamel]!, spins[SpinType.FootChangeSit]!)
    }
    
    func getCombinationSpins() -> [Spin] {
        return Array(arrayLiteral: spins[SpinType.PositionChangeCombination]!, spins[SpinType.PositionFootChangeCombination]!)
    }
    
    func getUprightSpins() -> [Spin] {
        return Array(arrayLiteral: spins[SpinType.Upright]!, spins[SpinType.FlyingUpright]!, spins[SpinType.FootChangeUpright]!)
    }
    
    func getLaybackSpins() -> [Spin] {
        return Array(arrayLiteral: spins[SpinType.Layback]!, spins[SpinType.FlyingLayback]!, spins[SpinType.FootChangeLayback]!)
    }
    
    func getCamelSpins() -> [Spin] {
        return Array(arrayLiteral: spins[SpinType.Camel]!, spins[SpinType.FlyingCamel]!, spins[SpinType.FootChangeCamel]!)
    }
    
    func getSitSpins() -> [Spin] {
        return Array(arrayLiteral: spins[SpinType.Sit]!, spins[SpinType.FlyingSit]!, spins[SpinType.FootChangeSit]!)
    }
}