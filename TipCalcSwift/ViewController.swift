//
//  ViewController.swift
//  TipCalcSwift
//
//  Created by Kristen on 12/21/14.
//  Copyright (c) 2014 Kristen Sundquist. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var halfTotalLabel: UILabel!
    @IBOutlet weak var thirdTotalLabel: UILabel!
    @IBOutlet weak var forthTotalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onEditingChange(sender: AnyObject) {
        
        let tipPercentages = [0.15, 0.18, 0.2]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billString = billField.text.stringByTrimmingCharactersInSet(NSCharacterSet.symbolCharacterSet())
        var billAmount = (billString as NSString).doubleValue

        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        var halfTotal = total / 2
        var thirdTotal = total / 3
        var forthTotal = total / 4

        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        halfTotalLabel.text = String(format: "$%.2f", halfTotal)
        thirdTotalLabel.text = String(format: "$%.2f", thirdTotal)
        forthTotalLabel.text = String(format: "$%.2f", forthTotal)
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

