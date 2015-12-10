//
//  ComponentManager.swift
//  LetMeBeTheJudge
//
//  Created by Sherry Chen on 12/2/15.
//  Copyright (c) 2015 67442. All rights reserved.
//

import Foundation

class ComponentManager{
    var allComponents = [String:Component]()
    
    init(){
        DataManager.getCriteriaDataFromFileWithSuccess { (criteriaData) -> Void in
            let json = JSON(data: criteriaData)
            let componentsData = json["components"]
            
            for i in 0...componentsData.count-1{
                var component = componentsData[i]
                
                var name = component["name"].string
                var criteria = component["criteria"]
                var formattedCriteria = [Criterion]()
                
                for j in 0...criteria.count - 1{
                    var criterion = criteria[j]
                    var formattedCriterion = Criterion(criterion: criterion["name"].string,
                        explanation: criterion["explanation"].string, discipline: criterion["discipline"].arrayValue.map { $0.string!})
                    formattedCriteria.append(formattedCriterion)
                    
                }
                
                var componentFormatted = Component(type: name!, criteria: formattedCriteria)
                self.allComponents[name!] = componentFormatted
            }
        }
    }
}