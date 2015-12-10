//
//  GradeJumpViewController.swift
//  LetMeBeTheJudge
//
//  Created by Sherry Chen on 12/8/15.
//  Copyright (c) 2015 67442. All rights reserved.
//

import UIKit

//actually calculates GOE for all technical elements...

class GOEFormViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var programScore: ProgramScore?
    var element:String = "Jumps"
    var elementObj: AnyObject?
    
    var criteria:[String] = [String]()
    var deductions:[Deduction] = [Deduction]()
    
    var criteriaMet = [String: Int]()
    var deductionsTaken = [Int: Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Grade of Execution"
        
        let backItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backItem
        
        self.criteria = programScore!.technicalManager.getCriteria(element)
        self.deductions = programScore!.technicalManager.getDeductions(element)
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return criteria.count
        } else {
            return deductions.count
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        var index: Int = 0
        
        if indexPath.section == 0 {
            cell.textLabel?.text = criteria[indexPath.row]
            index = indexPath.row
        } else {
            cell.textLabel?.text = deductions[indexPath.row].description
            index = indexPath.row + criteria.count
        }
        
        cell.textLabel?.numberOfLines = 4
        
        var sideView = createSideOptions(index)
        cell.accessoryView = sideView
        
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Positive Aspects"
        } else {
            return "Deductions"
        }
    }
    
    func createSideOptions(index: Int) -> UIView {
        var sideView = UIView(frame: CGRectMake(0, 0, 70, 20))
        
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
        var tag = sender!.tag
        println(tag)
        println("Num deductions\(deductions.count)")
        println(criteria.count)
        if tag > criteria.count {
            if sender.on {
                deductionsTaken[tag - criteria.count - 1] = 1
            } else {
                deductionsTaken[tag - criteria.count - 1] = 0
            }
        } else {
            if sender.on {
                criteriaMet[criteria[tag - 1]] = 1
            } else {
                criteriaMet[criteria[tag - 1]] = 0
            }
        }
    }
    
    func calculateGOE() -> Int {
        var pos: Int = Array(criteriaMet.values).reduce(0, combine: + )
        println(pos)
        var posGOE: Int = getPosGOE(pos)
        var negGOE: Int = 0
        
        if deductionsTaken.count > 0 {
            for (index, deducted) in deductionsTaken {
                if deducted == 1 {
                    negGOE += deductions[index].getRandDeduction()
                }
            }
            
            if negGOE < -3 {
                negGOE = -3
            }
        }
        
        return posGOE + negGOE
    }
    
    func getPosGOE(positive: Int) -> Int {
        if positive < 2 {
            return 0
        } else if positive >= 2 && positive < 4 {
            return 1
        } else if positive >= 4 && positive < 6 {
            return 2
        } else {
            return 3
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "displayTechnicalResult" {
            let vc = segue.destinationViewController as! TechnicalElementResultViewController
            vc.programScore = programScore
            vc.levelRequired = programScore!.technicalManager.levelRequired(element)
            vc.element = element
            vc.elementObj = elementObj
            vc.unfactoredGOE = calculateGOE()
        }
    }
}

