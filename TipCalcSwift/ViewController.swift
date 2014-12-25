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
        billField.center = CGPointMake(view.center.x, 188) // billField.frame.size.height //188 // billField.frame.size.height/2 + billField.center.x + 74.5
        tipControl.center = CGPointMake(view.center.x, 249.5)
        dollarSignLabel.center = CGPointMake(dollarSignLabel.center.x, 188)
        
        showInputOnly(true)
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
                self.showInputOnly(true)
                self.dollarSignLabel.alpha = 1
            })
            
            UIView.animateWithDuration(duration, delay: delay, options: options, animations: {
                
                self.billField.center = CGPointMake(self.view.center.x, 188)
                self.tipControl.center = CGPointMake(self.view.center.x, 249.5)
                self.dollarSignLabel.center = CGPointMake(self.dollarSignLabel.center.x, 188)
                
                }, completion: nil )
            
        } else {
            self.dollarSignLabel.alpha = 0
            
            UIView.animateWithDuration(duration, animations: { () -> Void in
                self.showInputOnly(false)
            })
            
            UIView.animateWithDuration(duration, delay: delay, options: options, animations: {
                self.billField.center = CGPointMake(self.view.center.x, 117)
                self.tipControl.center = CGPointMake(self.view.center.x, 171.5)
                self.dollarSignLabel.center = CGPointMake(self.dollarSignLabel.center.x, 117)
                
                }, completion: nil )
        }
        
        updateUI()
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    func updateUI() {
        let tipPercentages = [0.15, 0.18, 0.2]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = (billField.text as NSString).doubleValue
        
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        let dollarFormat = "$%.2f"
        
        tipLabel.text        = String(format: dollarFormat, tip)
        totalLabel.text      = String(format: dollarFormat, total)
        halfTotalLabel.text  = String(format: dollarFormat, total / 2)
        thirdTotalLabel.text = String(format: dollarFormat, total / 3)
        forthTotalLabel.text = String(format: dollarFormat, total / 4)
    }
    
    func showInputOnly(showInputOnly: Bool) {
        let opactiy: CGFloat = showInputOnly ? 0 : 1
        
        tipControl.alpha = opactiy
        tipLabel.alpha = opactiy
        totalLabel.alpha = opactiy
        tipControl.alpha = opactiy
        halfTotalLabel.alpha = opactiy
        thirdTotalLabel.alpha = opactiy
        forthTotalLabel.alpha = opactiy
        backgroundColorView.alpha = opactiy
        peopleLabelCollection.map { $0.alpha = opactiy }
    }
}

