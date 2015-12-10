//
//  ComponentScores.swift
//  LetMeBeTheJudge
//
//  Created by Sherry Chen on 12/6/15.
//  Copyright (c) 2015 67442. All rights reserved.
//

import Foundation

class ComponentScores {
    var scores = [ComponentType: Float]()
    var all = ComponentType.allValues
    var graded = [ComponentType]()
    
    init(){
        graded = Array(scores.keys)
    }
    
    func saveScore(componentType: ComponentType, score: Float){
        scores[componentType] = score
    }
    
    func allGraded() -> Bool {
        return scores.count == 5
    }
    
    func yetToBeGraded() -> [ComponentType] {
        return all.filter() {!contains(self.graded, $0)}
    }
    
    func graded(type: ComponentType) -> Bool {
        return scores[type] != nil
    }
    
    func getUnfactoredScore() -> Float {
        return scores.values.array.reduce(0, combine: + )
    }
    
    func getFactoredScore(factor: Factor) -> Float {
        return getUnfactoredScore() * Float(factor.factor)
    }

}