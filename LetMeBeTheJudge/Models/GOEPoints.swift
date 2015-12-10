//
//  GOEPoints.swift
//  LetMeBeTheJudge
//
//  Created by Sherry Chen on 12/8/15.
//  Copyright (c) 2015 67442. All rights reserved.
//

import Foundation

class GOEPoints {
    class func getTwizzles(GOE: Int) -> Float {
        switch GOE {
        case -3:
            return -1.5
        case -2:
            return -1.0
        case -1:
            return -0.5
        case 1:
            return 0.6
        case 2:
            return 1.2
        case 3:
            return 1.8
        default:
            return 0.0
        }
    }
    
    class func getStepSequences(GOE: Int) -> Float {
        switch GOE {
        case -3:
            return -0.9
        case -2:
            return -0.6
        case -1:
            return -0.3
        case 1:
            return 0.5
        case 2:
            return 1.0
        case 3:
            return 1.5
        default:
            return 0.0
        }
    }
    
    class func getDeathSpirals(GOE: Int) -> Float {
        switch GOE {
        case -3:
            return -2.1
        case -2:
            return -1.4
        case -1:
            return -0.7
        case 1:
            return 0.7
        case 2:
            return 1.4
        case 3:
            return 2.1
        default:
            return 0.0
        }
    }
    class func getThrowJumps(baseValue: Float, GOE: Int) -> Float{
        if baseValue <= 1.4 {
            switch GOE {
            case -3:
                return -0.9
            case -2:
                return -0.6
            case -1:
                return -0.3
            case 1:
                return 0.3
            case 2:
                return 0.6
            case 3:
                return 0.9
            default:
                return 0.0
            }
        } else if baseValue > 1.4 && baseValue <= 3.0 {
            switch GOE {
            case -3:
                return -1.5
            case -2:
                return -1.0
            case -1:
                return -0.5
            case 1:
                return 0.5
            case 2:
                return 1.0
            case 3:
                return 1.5
            default:
                return 0.0
            }
            
        } else if baseValue > 4.0 && baseValue <= 5.5 {
            switch GOE {
            case -3:
                return -2.1
            case -2:
                return -1.4
            case -1:
                return -0.7
            case 1:
                return 0.7
            case 2:
                return 1.4
            case 3:
                return 2.1
            default:
                return 0.0
            }
            
        } else {
            switch GOE {
            case -3:
                return -3.0
            case -2:
                return -2.0
            case -1:
                return -1.0
            case 1:
                return 1.0
            case 2:
                return 2.0
            case 3:
                return 3.0
            default:
                return 0.0
            }
            
        }
    }
    
    class func getTwistLifts(baseValue: Float, GOE: Int) -> Float{
        if baseValue <= 1.7 {
            switch GOE {
            case -3:
                return -0.6
            case -2:
                return -0.4
            case -1:
                return -0.2
            case 1:
                return 0.2
            case 2:
                return 0.4
            case 3:
                return 0.6
            default:
                return 0.0
            }
        } else if baseValue > 1.7 && baseValue <= 4.0 {
            switch GOE {
            case -3:
                return -0.9
            case -2:
                return -0.6
            case -1:
                return -0.3
            case 1:
                return 0.3
            case 2:
                return 0.6
            case 3:
                return 0.9
            default:
                return 0.0
            }

        } else if baseValue > 4.0 && baseValue <= 6.6 {
            switch GOE {
            case -3:
                return -2.1
            case -2:
                return -1.4
            case -1:
                return -0.7
            case 1:
                return 0.7
            case 2:
                return 1.4
            case 3:
                return 2.1
            default:
                return 0.0
            }

        } else {
            switch GOE {
            case -3:
                return -3.0
            case -2:
                return -2.0
            case -1:
                return -1.0
            case 1:
                return 1.0
            case 2:
                return 2.0
            case 3:
                return 3.0
            default:
                return 0.0
            }

        }
    }
    
    class func getPairLifts(GOE: Int) -> Float {
        switch GOE {
        case -3:
            return -0.9
        case -2:
            return -0.6
        case -1:
            return -0.3
        case 1:
            return 0.3
        case 2:
            return 0.6
        case 3:
            return 0.9
        default:
            return 0.0
        }
    }
    
    //pair spins also uses this scale
    class func getSpinGOE(GOE: Int) -> Float{
        switch GOE {
        case -3:
            return -0.9
        case -2:
            return -0.6
        case -1:
            return -0.3
        case 1:
            return 0.5
        case 2:
            return 1.0
        case 3:
            return 1.5
        default:
            return 0.0
        }
    }
    
    class func getJumpGOE(baseValue: Float, GOE: Int) -> Float {
        if baseValue <= 1.3 {
            switch GOE {
            case -3:
                return -0.3
            case -2:
                return -0.2
            case -1:
                return -0.1
            case 1:
                return 0.2
            case 2:
                return 0.4
            case 3:
                return 0.6
            default:
                return 0.0
            }
        } else if baseValue > 1.3 && baseValue <= 2.1 {
            switch GOE {
            case -3:
                return -0.9
            case -2:
                return -0.6
            case -1:
                return -0.3
            case 1:
                return 0.3
            case 2:
                return 0.6
            case 3:
                return 0.9
            default:
                return 0.0
            }
        } else if baseValue > 2.1 && baseValue <= 6.0 {
            switch GOE {
            case -3:
                return -2.1
            case -2:
                return -1.4
            case -1:
                return -0.7
            case 1:
                return 0.7
            case 2:
                return 1.4
            case 3:
                return 2.1
            default:
                return 0.0
            }
        } else if baseValue == 8.5 {
            switch GOE {
            case -3:
                return -3.0
            case -2:
                return -2.0
            case -1:
                return -1.0
            case 1:
                return 1.0
            case 2:
                return 2.0
            case 3:
                return 3.0
            default:
                return 0.0
            }
        } else if baseValue >= 10.3 {
            switch GOE {
            case -3:
                return -4.0
            case -2:
                return -2.4
            case -1:
                return -1.2
            case 1:
                return 1.0
            case 2:
                return 2.0
            case 3:
                return 3.0
            default:
                return 0.0
            }
        } else {
            return 0
        }
    }
}