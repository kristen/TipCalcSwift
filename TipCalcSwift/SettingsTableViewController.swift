//
//  SettingsTableViewController.swift
//  TipCalcSwift
//
//  Created by Kristen on 1/4/15.
//  Copyright (c) 2015 Kristen Sundquist. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    var locales = ["en_US", "en_UK", "fr_FR"]
    var selectedIndex = [0, 0]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var defaults = NSUserDefaults.standardUserDefaults()
        selectedIndex[0] = defaults.integerForKey("Settings_DefaultTipPercentage")
        selectedIndex[1] = (locales as NSArray).indexOfObject(defaults.stringForKey("Settings_DefaultLocale")!)
        tableView.backgroundColor = UIColor(red: 0/255.0, green: 255/255.0, blue: 128/255.0, alpha: 1.0)
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = super.tableView(tableView, cellForRowAtIndexPath: indexPath)
        
        if (indexPath.row == selectedIndex[indexPath.section]) {
            cell.accessoryType = .Checkmark;
        } else {
            cell.accessoryType = .None;
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var defaults = NSUserDefaults.standardUserDefaults()
        
        switch indexPath.section {
            case 0: defaults.setInteger(indexPath.row, forKey: "Settings_DefaultTipPercentage")
            case 1: defaults.setValue(locales[indexPath.row], forKey: "Settings_DefaultLocale")
            default: println("Error: section \(indexPath.section) and row \(indexPath.row) not implemented")
        }
        
        defaults.synchronize()
        
        selectedIndex[indexPath.section] = indexPath.row;
        
        tableView.reloadData()
    }
}
