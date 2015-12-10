//
//  HelpViewController.swift
//  LetMeBeTheJudge
//
//  Created by Sherry Chen on 12/5/15.
//  Copyright (c) 2015 67442. All rights reserved.
//

import UIKit

class HelpViewController: UIViewController {
    var item:AnyObject?
    @IBOutlet weak var explanation: UILabel!
    @IBOutlet weak var name: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backItem

        
        if let i = item as? Component {
            //need this workaround because cannot assign an enum to AnyObject
            
            if let type = i.type {
                explanation.text = type.getDefinition()
                self.title = type.getDisplayFriendlyVersion()
                name.text = type.getDisplayFriendlyVersion()
            } else {
                self.title = "Something went wrong."
                explanation.text = "Please go back."
                name.text = "Something went wrong."
            }
            
            
        } else if let i = item as? Criterion {
            explanation.text = i.explanation
            self.title = i.criterion
            name.text = i.criterion
            
        } else {
            self.title = "Something went wrong."
            explanation.text = "Please go back."
            name.text = "Something went wrong."
        }
    }

    
}
