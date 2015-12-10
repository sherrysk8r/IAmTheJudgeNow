//
//  SpinTypeswift
//  LetMeBeTheJudge
//
//  Created by Sherry Chen on 12/6/15
//  Copyright (c) 2015 67442 All rights reserved
//

import Foundation

enum SpinType: String {
    case Upright = "Upright", Layback = "Layback", Camel = "Camel", Sit = "Sit", FlyingUpright = "Flying Upright", FlyingLayback = "Flying Layback", FlyingCamel = "Flying Camel", FlyingSit = "Flying Sit", FootChangeUpright = "Foot Change Upright", FootChangeLayback = "Foot Change Layback", FootChangeCamel = "Foot Change Camel", FootChangeSit = "Foot Change Sit", PositionChangeCombination = "Position But No Foot Change", PositionFootChangeCombination = "Foot and Position Changes"
    
    static let basicSpins = [Upright, Layback, Camel, Sit]
    static let flyingSpins = [FlyingUpright, FlyingLayback, FlyingCamel, FlyingSit]
    static let footChangeSpins = [FootChangeUpright, FootChangeLayback, FootChangeCamel, FootChangeSit]
    static let combinationSpins = [PositionChangeCombination, PositionFootChangeCombination]
    
    static let uprightSpins = [Upright, FlyingUpright, FootChangeUpright]
    static let laybackSpins = [Layback, FlyingLayback, FootChangeLayback]
    static let camelSpins = [Camel, FlyingCamel, FootChangeCamel]
    static let sitSpins = [Sit, FlyingSit, FootChangeSit]
    
    static let all = [Upright, FlyingUpright, FootChangeUpright, Layback, FlyingLayback, FootChangeLayback, Camel, FlyingCamel, FootChangeCamel, Sit, FlyingSit, FootChangeSit, PositionChangeCombination, PositionFootChangeCombination]
    
    func getAbbrev() -> String {
        switch self {
        case .Upright:
            return "USp"
        case .Layback:
            return "LSp"
        case .Camel:
            return "CSp"
        case .Sit:
            return "SSp"
        case .FlyingUpright:
            return "FCUSp"
        case .FlyingLayback:
            return "FCLSp"
        case .FlyingCamel:
            return "FCCSp"
        case .FlyingSit:
            return "FSSp"
        case .FootChangeUpright:
            return "FCUSp"
        case .FootChangeLayback:
            return "FCLSp"
        case .FootChangeCamel:
            return "FCCSp"
        case .FootChangeSit:
            return "FCSSp"
        case .PositionChangeCombination:
            return "FCoSp"
        case .PositionFootChangeCombination:
            return "FCCoSp"
        }
        
    }
}