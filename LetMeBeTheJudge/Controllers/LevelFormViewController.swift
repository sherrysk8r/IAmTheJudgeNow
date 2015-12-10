//
//  LevelFormViewController.swift
//  LetMeBeTheJudge
//
//  Created by Sherry Chen on 12/10/15.
//  Copyright (c) 2015 67442. All rights reserved.
//

import UIKit

class LevelFormViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var programScore: ProgramScore?
    var features = [String]()
    var element: String?
    var featuresMet = [String: Int]()
    var elementObj: AnyObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backItem
        
        self.title = "Features Determine Levels"
        self.features = Features.featuresDictionary[element!]!
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.features.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        
        var feature = self.features[indexPath.row]
        cell.textLabel?.text = feature
        cell.textLabel?.numberOfLines = 7
        cell.textLabel?.font = cell.textLabel?.font.fontWithSize(15)
        
        var sideView = createSideOptions(feature, index: indexPath.row)
        cell.accessoryView = sideView
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var level = gradeLevel()
        createElementObj(level)
        println("Level: \(level)")
        if segue.identifier == "gradeElement" {
            let vc = segue.destinationViewController as! GOEFormViewController
            vc.programScore = programScore!
            vc.element = element!
            vc.elementObj = elementObj
        }
    }
    
    func gradeLevel() -> String {
        var numFeaturesMet = featuresMet.values.array.reduce(0, combine: +)
        
        if numFeaturesMet == 1 {
            return "1"
        }else if numFeaturesMet == 2 {
            return "2"
        } else if numFeaturesMet == 3 {
            return "3"
        } else if numFeaturesMet > 3 {
            return "4"
        }else {
            return "B"
        }
    }
    
    func createSideOptions(feature: String, index: Int) -> UIView {
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
        var feature = features[sender!.tag - 1]
        if sender.on {
            featuresMet[feature] = 1
        } else {
            featuresMet[feature] = 0
        }
    }
    
    func createElementObj(level: String) {
        var numFeaturesMet = featuresMet.values.array.reduce(0, combine: +)
        
        if element == "Step Sequence" {
            elementObj = StepSequence(level: level, featuresMet: numFeaturesMet)
        }
        
        if element == "Pair Spins" {
            elementObj = PairSpin(level: level, featuresMet: numFeaturesMet)
        }
        
        if element == "Solo Spins" || element == "Spins" {
            if let e = elementObj as? ScoreSpin {
                e.setLevel(level)
                e.setFeaturesMet(numFeaturesMet)
            }
        }
    }
}