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
        billField.center = CGPointMake(160, 188)
        tipControl.center = CGPointMake(160, 249.5)
        dollarSignLabel.center = CGPointMake(287, 188)
        
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
        
        let duration = 0.35
        let delay = 0.0 // delay will be 0.0 seconds (e.g. nothing)
        let options = UIViewAnimationOptions.CurveEaseInOut // change the timing curve to `ease-in ease-out`
        
        
        if billField.text.isEmpty {
            
            
            UIView.animateWithDuration(duration, animations: { () -> Void in
                self.tipControl.alpha = 0
                self.tipLabel.alpha = 0
                self.totalLabel.alpha = 0
                self.tipControl.alpha = 0
                self.halfTotalLabel.alpha = 0
                self.thirdTotalLabel.alpha = 0
                self.forthTotalLabel.alpha = 0
                self.backgroundColorView.alpha = 0
                self.peopleLabelCollection.map { $0.alpha = 0 }
                self.dollarSignLabel.alpha = 1
            })
            
            UIView.animateWithDuration(duration, delay: delay, options: options, animations: {
                self.billField.center = CGPointMake(160, 188)
                self.tipControl.center = CGPointMake(160, 249.5)
                self.dollarSignLabel.center = CGPointMake(287, 188)
                
                }, completion: { finished in
                    // any code entered here will be applied
                    // once the animation has completed
            })
            
        } else {
            self.dollarSignLabel.alpha = 0
            
            UIView.animateWithDuration(duration, animations: { () -> Void in
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
            
            UIView.animateWithDuration(duration, delay: delay, options: options, animations: {
                self.billField.center = CGPointMake(160, 117)
                self.tipControl.center = CGPointMake(160, 171.5)
                self.dollarSignLabel.center = CGPointMake(287, 117)
                
                }, completion: { finished in
                    // any code entered here will be applied
                    // once the animation has completed
            })
        }
        
        
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

