//
//  FinalResultViewController.swift
//  LetMeBeTheJudge
//
//  Created by Sherry Chen on 12/8/15.
//  Copyright (c) 2015 67442. All rights reserved.
//

import UIKit

class FinalResultViewController: UIViewController {
    var programScore: ProgramScore?
    
    @IBOutlet weak var totalScore: UILabel!
    @IBOutlet weak var componentsScore: UILabel!
    @IBOutlet weak var technicalScore: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let backItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backItem
        
        programScore?.calcPCS()
        programScore?.calcTES()
        
        setLabels()
    }

    func setLabels() {
        componentsScore.text = "\(programScore!.PCS) * \(programScore!.getFactor()) = \(programScore!.getFactoredPCS())"
        technicalScore.text = "\(programScore!.TES)"
        totalScore.text = "\(programScore!.combinedScore())"
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "judgeNew" {
            let vc = segue.destinationViewController as! ViewController
            vc.discipline = programScore!.discipline!
            vc.segment = programScore!.segment!
        }
    }
}
