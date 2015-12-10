//
//  ComponentType.swift
//  LetMeBeTheJudge
//
//  Created by Sherry Chen on 12/2/15.
//  Copyright (c) 2015 67442. All rights reserved.
//

import Foundation

enum ComponentType: String{
    case SkatingSkills = "Skating Skills", TechnicalTransitions = "Technical Transitions", PerformanceExecution = "Performance/Execution", ChoreoComposition = "Choreography/Composition", InterpretationTiming = "Interpretation/Timing"
    
    static let allValues = [SkatingSkills, TechnicalTransitions, PerformanceExecution, ChoreoComposition, InterpretationTiming]
    
    func getDisplayFriendlyVersion() -> String{
        switch self{
        case .SkatingSkills:
            return "Skating Skills"
        case .TechnicalTransitions:
            return "Technical Transitions"
        case .PerformanceExecution:
            return "Performance & Execution"
        case .ChoreoComposition:
            return "Choreography & Composition"
        case .InterpretationTiming:
            return "Interpretation & Timing"
        default:
            return "Not a Valid Component"
        }

    }
    
    func getDefinition() -> String{
        switch self{
        case .SkatingSkills:
            return "Over all skating quality: edge control and flow over the ice surface demonstrated by a command of the skating vocabulary (edges, steps, turns, etc), the clarity of technique, and the use of effortless power to accelerate and vary speed."
        case .TechnicalTransitions:
            return "The varied and/or intricate footwork, positions, movements, and holds that link all elements. In singles, pairs, and synchronize skating this also includes the entrances and exits of technical elements."
        case .PerformanceExecution:
            return "Is the involvement of the skater/couple/teams physically, emotionally, and intellectually as they translate the intent of the music and choreography."
        case .ChoreoComposition:
            return "An intentional, developed, and/or original arrangement of all movements according to the principles of proportion, unity, space, pattern, structure, and phrasing."
        case .InterpretationTiming:
            return "The personal and creative translation of the music to movement on ice. To reward the skater who through movement creates a personal and creative translation of the music. As the tempo binds all notes in time, the ability to use the tempos and rhythms of the music in a variety of ways, along with the subtle use of finesse to reflect the nuances of all the fundamentals of music: melody, rhythm, harmony, color, texture, and form creates a mastery of interpretation."
        default:
            return "Not a Valid Component"
        }
        
    }
}