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
    @IBOutlet weak var dollarSignLabel: UILabel!
    
    @IBOutlet weak var backgroundColorView: UIView!
    @IBOutlet var peopleLabelCollection: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipControl.alpha = 0
        tipLabel.alpha = 0
        totalLabel.alpha = 0
        tipControl.alpha = 0
        halfTotalLabel.alpha = 0
        thirdTotalLabel.alpha = 0
        forthTotalLabel.alpha = 0
        backgroundColorView.alpha = 0
        peopleLabelCollection.map { $0.alpha = 0 }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onEditingChange(sender: AnyObject) {
        self.dollarSignLabel.alpha = 0
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.tipControl.alpha = 1
            self.tipLabel.alpha = 1
            self.totalLabel.alpha = 1
            self.tipControl.alpha = 1
            self.halfTotalLabel.alpha = 1
            self.thirdTotalLabel.alpha = 1
            self.forthTotalLabel.alpha = 1
            self.backgroundColorView.alpha = 1
            self.peopleLabelCollection.map { $0.alpha = 1 }
        })
        
        
        let tipPercentages = [0.15, 0.18, 0.2]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = (billField.text as NSString).doubleValue

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

