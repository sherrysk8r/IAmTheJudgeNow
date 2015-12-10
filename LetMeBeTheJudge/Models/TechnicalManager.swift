//
//  TechnicalManager.swift
//  LetMeBeTheJudge
//
//  Created by Sherry Chen on 12/4/15.
//  Copyright (c) 2015 67442. All rights reserved.
//

import Foundation

class TechnicalManager{
    var spinManager: SpinManager
    var jumpManager = [ScoreJump]()
    var GOERequirements = [String: GOE]()
    
    init(){
        spinManager = SpinManager()
        getData()
    }
    
    func getApplicableElements(discipline: Discipline) -> [String] {
        switch discipline {
        case .Ladies, .Men:
            return ["Jumps", "Spins", "Step Sequence"]
        case .Pairs:
            return ["Jumps", "Throw Jumps", "Pair Lifts", "Twist Lifts", "Solo Spins", "Pair Spins", "Death Spiral", "Step Sequence"]
        case .IceDance:
            return ["Spins", "Dance Lifts", "Twizzles", "Dance Elements"]
        default:
            return ["Not a valid discipline"]
        }
    }
    
    func levelRequired(element: String) -> Bool {
        var levelNotRequired = ["Jumps", "Throw Jumps"]
        return !contains(levelNotRequired, element)
    }
    
    func getCriteria(element: String) -> [String] {
        return GOERequirements[element]!.criteria
    }
    
    func getDeductions(element: String) -> [Deduction] {
        return GOERequirements[element]!.deductions
    }
    
    func getData() {
        DataManager.getGOEDataFromFileWithSuccess { (data) -> Void in
            let parsedData = JSON(data: data)
            let elementData = parsedData["elements"]
            
            for i in 0...elementData.count - 1 {
                var elementName = elementData[i]["name"].string
                var criteria = elementData[i]["criteria"].arrayValue.map { $0.string!}
                var rawDeductions = elementData[i]["deductions"]
                var deductions = [Deduction]()
                
                for d in 0...rawDeductions.count - 1 {
                    var name:String = rawDeductions[d]["name"].string!
                    var minDeduction:Int = rawDeductions[d]["minImpactOnGOE"].int!
                    var maxDeduction:Int? = rawDeductions[d]["maxImpactOnGOE"].int
                    deductions.append(Deduction(description: name, minImpactOnGOE: minDeduction, maxImpactOnGOE: maxDeduction))
                }
                
                self.GOERequirements[elementName!] = GOE(criteria: criteria, deductions: deductions)
            }
            
        }
    }
}