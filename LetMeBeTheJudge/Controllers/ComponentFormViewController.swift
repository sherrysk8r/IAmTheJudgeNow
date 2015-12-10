//
//  ComponentFormViewController.swift
//  LetMeBeTheJudge
//
//  Created by Sherry Chen on 12/6/15.
//  Copyright (c) 2015 67442. All rights reserved.
//

import UIKit

class ComponentFormViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var programScore: ProgramScore?
    var component:Component?
    var criteria = [Criterion]()
    var criteriaMet = [String: Int]()
    var clickedCriterion: Criterion?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let c = component{
            self.title =  c.type?.getDisplayFriendlyVersion()
        }
        
        self.component!.filterCriteria(programScore!.discipline!)
        criteria = self.component!.appliedCriteria
        
        let backItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backItem

    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.criteria.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        
        var criterion = self.criteria[indexPath.row]
        cell.textLabel?.text = criterion.criterion
        cell.textLabel?.numberOfLines = 4
        
        var sideView = createSideOptions(criterion, index: indexPath.row)
        cell.accessoryView = sideView
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "explainComponent" {
            let vc = segue.destinationViewController as! HelpViewController
            vc.item = component
        }
        
        if segue.identifier == "explainCriterion" {
            let vc = segue.destinationViewController as! HelpViewController
            vc.item = clickedCriterion
        }
        
        if segue.identifier == "calcComponentScore" {
            let vc = segue.destinationViewController as! ComponentResultViewController
            vc.programScore = programScore!
            vc.component = self.component
            vc.criteriaMet = Array(criteriaMet.values).reduce(0, combine: + )
            vc.applicableCriteria = self.criteria.count
        }
        
    }
    
    func buttonClicked(sender: UIButton?) {
        if sender!.tag != 0 {
            clickedCriterion = criteria[sender!.tag - 1]
            self.performSegueWithIdentifier("explainCriterion", sender: sender)
        }
    }
    
    func createSideOptions(criterion: Criterion, index: Int) -> UIView {
        var sideView = UIView(frame: CGRectMake(0, 0, 70, 20))
        if let e = criterion.explanation {
            let image = UIImage(named: "info_icon.png") as UIImage?
            var infoButton = UIButton()
            infoButton.frame = CGRectMake(0, 0, 20, 20)
            infoButton.setBackgroundImage(image, forState: UIControlState.Normal)
            infoButton.addTarget(self, action: "buttonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
            infoButton.tag = index + 1
            sideView.addSubview(infoButton)
        }
        
        var switchEval=UISwitch(frame:CGRectMake(30, 0, 40, 20))
        switchEval.on = false
        switchEval.setOn(false, animated: true)
        switchEval.addTarget(self, action: "switchValueDidChange:", forControlEvents: .ValueChanged)
        sideView.addSubview(switchEval)
        switchEval.onTintColor = Colors.mainColor
        switchEval.tintColor = Colors.selectionColor
        switchEval.tag = index + 1
        
        return sideView
    }
    
    func switchValueDidChange(sender:UISwitch!){
        var criterionName = criteria[sender!.tag - 1].criterion
        if sender.on {
            criteriaMet[criterionName!] = 1
        } else {
            criteriaMet[criterionName!] = 0
        }
    }
}

