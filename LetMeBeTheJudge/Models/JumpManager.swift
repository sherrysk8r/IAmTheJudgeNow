//
//  JumpManager.swift
//  LetMeBeTheJudge
//
//  Created by Sherry Chen on 12/8/15.
//  Copyright (c) 2015 67442. All rights reserved.
//

import Foundation

class JumpManager{
    var singleJumpDictionary = [JumpType : BaseValueJumps]()
    var throwJumpDictionary = [JumpType : BaseValueJumps]()
    
    init() {
        setSingleJumpsBaseValue()
        setThrowJumpsBaseValue()
    }
    
    func setSingleJumpsBaseValue() {
        singleJumpDictionary[JumpType.Axel] = BaseValueJumps(single: 1.1, double: 3.3, triple: 8.5, quad: 15.0)
        singleJumpDictionary[JumpType.Lutz] = BaseValueJumps(single: 0.6, double: 2.1, triple: 6.0, quad: 13.6)
        singleJumpDictionary[JumpType.Flip] = BaseValueJumps(single: 0.5, double: 1.9, triple: 5.3, quad: 12.3)
        singleJumpDictionary[JumpType.Loop] = BaseValueJumps(single: 0.5, double: 1.8, triple: 5.1, quad: 12.0)
        singleJumpDictionary[JumpType.Salchow] = BaseValueJumps(single: 0.4, double: 1.3, triple: 4.2, quad: 10.5)
        singleJumpDictionary[JumpType.ToeLoop] = BaseValueJumps(single: 0.4, double: 1.3, triple: 4.1, quad: 10.3)
    }
    
    func setThrowJumpsBaseValue() {
        throwJumpDictionary[JumpType.Axel] = BaseValueJumps(single: 2.2, double: 4.0, triple: 7.5, quad: 15.0)
        throwJumpDictionary[JumpType.Lutz] = BaseValueJumps(single: 1.4, double: 3.0, triple: 5.5, quad: 9.0)
        throwJumpDictionary[JumpType.Flip] = BaseValueJumps(single: 1.4, double: 3.0, triple: 5.5, quad: 9.0)
        throwJumpDictionary[JumpType.Loop] = BaseValueJumps(single: 1.4, double: 3.0, triple: 5.0, quad: 8.5)
        throwJumpDictionary[JumpType.Salchow] = BaseValueJumps(single: 1.1, double: 2.6, triple: 4.5, quad: 8.0)
        throwJumpDictionary[JumpType.ToeLoop] = BaseValueJumps(single: 1.1, double: 2.6, triple: 4.5, quad: 8.0)
    }
    
    func getBaseValue(isSingles: Bool, revolutions: Int, jumpType: JumpType) -> Float {
        var dictionary = isSingles ? singleJumpDictionary : throwJumpDictionary
        
        switch revolutions {
        case 1:
            return dictionary[jumpType]!.getSingle()
        case 2:
            return dictionary[jumpType]!.getDouble()
        case 3:
            return dictionary[jumpType]!.getTriple()
        case 4:
            return dictionary[jumpType]!.getQuad()
        default:
            return 0.0
        }
    }
}

