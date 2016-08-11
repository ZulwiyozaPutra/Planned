//
//  SecondViewController.swift
//  Planned
//
//  Created by Zulwiyoza Putra on 8/10/16.
//  Copyright © 2016 Zulwiyoza Putra. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var planTextField: UITextField!
    @IBAction func addPlan(sender: AnyObject) {
        plans.append(planTextField.text!)
        NSUserDefaults.standardUserDefaults().setObject(plans, forKey: "plans")
        planTextField.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        planTextField.resignFirstResponder()
        return true
    }


}

