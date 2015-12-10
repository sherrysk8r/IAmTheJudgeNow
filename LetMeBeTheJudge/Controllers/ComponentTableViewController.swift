//
//  ComponentTableViewController.swift
//  LetMeBeTheJudge
//
//  Created by Sherry Chen on 12/3/15.
//  Copyright (c) 2015 67442. All rights reserved.
//

import UIKit

class ComponentTableViewController: UIViewController {
    var component:Component?
    var discipline: Discipline?
    var factor: Factor?
    var criteria = [Criterion]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let c = component{
            self.title =  c.type?.getDisplayFriendlyVersion()
        }
        self.criteria = self.component!.criteria
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "explainComponent"{
            let vc = segue.destinationViewController as! HelpViewController
            vc.item = component
        }
    }

}
