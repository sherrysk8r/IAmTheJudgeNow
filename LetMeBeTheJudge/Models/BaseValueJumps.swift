//
//  BaseValueJumps.swift
//  LetMeBeTheJudge
//
//  Created by Sherry Chen on 12/8/15.
//  Copyright (c) 2015 67442. All rights reserved.
//

import Foundation

class BaseValueJumps {
    var valueDictionary = [String: Float]()
    
    init (single: Float, double: Float, triple: Float, quad: Float) {
        valueDictionary["single"] = single
        valueDictionary["double"] = double
        valueDictionary["triple"] = triple
        valueDictionary["quad"] = quad
    }
    
    func getSingle() -> Float{
        return self.valueDictionary["single"]!
    }
    
    func getDouble() -> Float{
        return self.valueDictionary["double"]!
    }
    
    func getTriple() -> Float{
        return self.valueDictionary["triple"]!
    }
    
    func getQuad() -> Float{
        return self.valueDictionary["quad"]!
    }
    
}