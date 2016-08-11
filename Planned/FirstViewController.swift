//
//  FirstViewController.swift
//  Planned
//
//  Created by Zulwiyoza Putra on 8/10/16.
//  Copyright © 2016 Zulwiyoza Putra. All rights reserved.
//

import UIKit

var plans = [String]()

class FirstViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var plansTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if NSUserDefaults.standardUserDefaults().objectForKey("plans") != nil {
            plans = NSUserDefaults.standardUserDefaults().objectForKey("plans") as! [String]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    internal func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return plans.count
    }

    internal func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        cell.textLabel?.text = plans[indexPath.row]
        return cell
    }
    
    internal func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            plans.removeAtIndex(indexPath.row)
            NSUserDefaults.standardUserDefaults().setObject(plans, forKey: "plans")
            plansTable.reloadData()
        }
        
    }
    
    override func viewDidAppear(animated: Bool) {
        plansTable.reloadData()
    }


}

