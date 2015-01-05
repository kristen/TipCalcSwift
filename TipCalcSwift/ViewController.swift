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
    
    let initialBillFieldY: CGFloat = 106
    let initialTipControlY: CGFloat = 162.5
    let deltaY: CGFloat = 100
    var formatter = NSNumberFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        navigationController?.navigationBar.barTintColor = UIColor(red: 0/255.0, green: 255/255.0, blue: 128/255.0, alpha: 1.0)
        showInputOnly(true)
        
        var defaults = NSUserDefaults.standardUserDefaults()
        tipControl.selectedSegmentIndex = defaults.integerForKey("Settings_DefaultTipPercentage")
        formatter.locale = NSLocale(localeIdentifier: defaults.stringForKey("Settings_DefaultLocale")!)
        formatter.numberStyle = .CurrencyStyle
        dollarSignLabel.text = formatter.currencySymbol
        
        NSNotificationCenter.defaultCenter().addObserverForName(NSUserDefaultsDidChangeNotification, object: nil, queue: nil) { (note) -> Void in
            self.formatter.locale = NSLocale(localeIdentifier: defaults.stringForKey("Settings_DefaultLocale")!)
            self.tipControl.selectedSegmentIndex = NSUserDefaults.standardUserDefaults().integerForKey("Settings_DefaultTipPercentage")
            self.calculateAndUpdateUI()
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        if (billField.text.isEmpty) {
            setYPositionOfBillFieldAndTipControlFromOriginalYPosition(deltaY)
        } else {
            setYPositionOfBillFieldAndTipControlFromOriginalYPosition(0)
        }
    }

    @IBAction func onEditingChange(sender: AnyObject) {
        animateBillFieldAndTipControl()
        calculateAndUpdateUI()
    }
    
    @IBAction func onValueChanged(sender: UISegmentedControl) {
        view.endEditing(true)
        animateBillFieldAndTipControl()
        calculateAndUpdateUI()
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    func animateBillFieldAndTipControl() {
        let duration = 0.35
        let delay = 0.0
        let options = UIViewAnimationOptions.CurveEaseInOut
        
        if billField.text.isEmpty {
            UIView.animateWithDuration(duration, delay: delay, options: options, animations: {
                self.showInputOnly(true)
                self.dollarSignLabel.alpha = 1
                self.setYPositionOfBillFieldAndTipControlFromOriginalYPosition(self.deltaY)
            }, completion: nil )
            
        } else {
            self.dollarSignLabel.alpha = 0
            
            UIView.animateWithDuration(duration, delay: delay, options: options, animations: {
                self.showInputOnly(false)
                self.setYPositionOfBillFieldAndTipControlFromOriginalYPosition(0)
            }, completion: nil )
        }
    }
    
    func setYPositionOfBillFieldAndTipControlFromOriginalYPosition(deltaY: CGFloat) {
        billField.center.y = initialBillFieldY + deltaY
        tipControl.center.y = initialTipControlY + deltaY
        dollarSignLabel.center.y = initialBillFieldY + deltaY
    }
    
    func calculateAndUpdateUI() {
        var tipPercentages = [0.15, 0.18, 0.2]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = (billField.text as NSString).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        dollarSignLabel.text = formatter.currencySymbol
        tipLabel.text        = formatDoubleAsCurrency(tip)
        totalLabel.text      = formatDoubleAsCurrency(total)
        halfTotalLabel.text  = formatDoubleAsCurrency(total / 2)
        thirdTotalLabel.text = formatDoubleAsCurrency(total / 3)
        forthTotalLabel.text = formatDoubleAsCurrency(total / 4)
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
    
    func formatDoubleAsCurrency(double: Double) -> String? {
        return formatter.stringFromNumber(NSNumber(double: double))
    }
}

