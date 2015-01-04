//
//  SettingsViewController.swift
//  TipCalcSwift
//
//  Created by Kristen on 1/3/15.
//  Copyright (c) 2015 Kristen Sundquist. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var defaultTipPercentagePicker: UIPickerView!
    var tipPercentages = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultTipPercentagePicker.selectRow(NSUserDefaults.standardUserDefaults().integerForKey("Settings_DefaultTipPercentage"), inComponent: 0, animated: true)
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tipPercentages.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        var percent = (tipPercentages[row] as Double) * 100.0
        return NSString(format: "%.0f%%", percent)
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(row, forKey: "Settings_DefaultTipPercentage")
        defaults.synchronize()
    }
}
