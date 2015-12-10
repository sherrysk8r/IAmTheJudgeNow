//
//  ComponentResultViewController.swift
//  LetMeBeTheJudge
//
//  Created by Sherry Chen on 12/3/15.
//  Copyright (c) 2015 67442. All rights reserved.
//

import UIKit

class ComponentResultViewController: UIViewController {
    @IBOutlet weak var checklistResults: UILabel!
    @IBOutlet weak var preFactoredScore: UILabel!
    @IBOutlet weak var typeOfProgram: UILabel!
    @IBOutlet weak var factorApplied: UILabel!
    @IBOutlet weak var finalScore: UILabel!
    
    var programScore: ProgramScore?
    var component: Component?
    var criteriaMet: Int = 0
    var applicableCriteria: Int = 0
    
    var finalScoreValue: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let backItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backItem
        
        self.title = "Result"
        
        var percent = round(Float(criteriaMet)/Float(applicableCriteria) * 1000)/1000
        component!.calcScore(percent)
        println(component!.score)
        finalScoreValue = round(component!.score*Float(programScore!.getFactor())*100)/100
        
        programScore?.saveComponentScore(component!.type!, score: component!.score )
        fillLabels()
    }

    func fillLabels() {
        checklistResults.text = "\(criteriaMet) out of \(applicableCriteria) parts, or \(round(Float(criteriaMet)/Float(applicableCriteria) * 1000)/10)% of the criteria met."
        
        preFactoredScore.text = "\(component!.score)"
        
        typeOfProgram.text = "Since it's a \(programScore!.getDisciplineAndSegment()) program:"
        
        factorApplied.text = "Multiply by a factor of \(programScore!.getFactor())"
        
        finalScore.text = "\(finalScoreValue)/\(programScore!.getFactor()*10)"
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "continueGrading" {
            let vc = segue.destinationViewController as! ElementViewController
            vc.programScore = programScore
            if !programScore!.allComponentsGraded(){
                vc.fromComponentForm = true
            }
        }
    }
}
