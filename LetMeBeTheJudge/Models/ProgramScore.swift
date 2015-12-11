//
//  ProgramScore.swift
//  LetMeBeTheJudge
//
//  Created by Sherry Chen on 12/8/15.
//  Copyright (c) 2015 67442. All rights reserved.
//

import Foundation

class ProgramScore {
    var componentManager: ComponentManager
    var technicalManager: TechnicalManager
    
    var componentScores: ComponentScores
    var technicalScores: [(element: String, value: Float)] = []
    
    var discipline: Discipline?
    var segment: Segment?
    var factor: Factor?
    
    var TES: Float = 0.0
    var PCS: Float = 0.0
    
    init(d: Discipline, s: Segment) {
        componentManager = ComponentManager()
        technicalManager = TechnicalManager()
        componentScores = ComponentScores()
        
        self.discipline = d
        self.segment = s
        self.factor = Factor(discipline: d, segment: s)
    }
    
    func getApplicableElements() -> [String] {
        return technicalManager.getApplicableElements(self.discipline!)
    }
    
    func getFactor() -> Double {
        return self.factor!.factor
    }
    
    func saveComponentScore(type: ComponentType, score: Float) {
        componentScores.saveScore(type, score: score)
    }
    
    func getDisciplineAndSegment() -> String {
        return "\(self.discipline!.rawValue) \(self.segment!.rawValue)"
    }
    
    func allComponentsGraded() -> Bool {
        return componentScores.allGraded()
    }
    
    func minTechnicalGraded() -> Bool {
        var required = NSSet(array: technicalManager.getApplicableElements(discipline!))
        var scored = NSSet(array: map(technicalScores) {$0.element})
        return required.isSubsetOfSet(scored as Set<NSObject>)
    }
    
    func calcTES() {
        if allComponentsGraded(){
            self.TES = Array(map(technicalScores) {$0.value}).reduce(0, combine: + )
            println(self.TES)
        }
    }
    
    func calcPCS() {
        if allComponentsGraded(){
            self.PCS = Array(componentScores.scores.values).reduce(0, combine: + )
        }
    }
    
    func getFactoredPCS() -> Float {
        return self.PCS * Float(getFactor())
    }
    
    func combinedScore() -> Float {
        return self.TES + getFactoredPCS()
    }
}