//
//  ViewController.swift
//  tipcalc
//
//  Created by Hill, Cameron on 8/8/16.
//  Copyright © 2016 Hill, Cameron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Declare variables
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var tipValueLabel: UILabel!
    @IBOutlet weak var totalBillLabel: UILabel!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var totalPerPersonLabel: UILabel!
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipSelector: UISlider!
    @IBOutlet weak var splitToggle: UIStepper!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //On editing the bill, recaculate all values
    @IBAction func calculateTip(sender: AnyObject) {
        calculateAllFields()
    }
    
    //On changing the tip percentage, recalculate values
    @IBAction func changeTip(sender: AnyObject) {
        calculateAllFields()
    }
    
    //On changing the number of ways to split, recalculate values
    @IBAction func changeSplit(sender: AnyObject) {
        calculateAllFields()
    }
    
    //Perform all calculations based on bill, tip percentage, and split
    func calculateAllFields() {
        
        //Pull values from all editable fields
        let bill = Double(billField.text!) ?? 0
        let tipPercentage = round(Double(tipSelector.value))/100
        let split = splitToggle.value
        let tipPercentageVal = round(Double(tipSelector.value))
        
        //Calculate tip, total bill, total per person
        let tip = bill*tipPercentage
        let totalBill = tip+bill
        let totalPerPerson = totalBill/(split+1)
        
        tipPercentageLabel.text = String(format: "%.0f%%", tipPercentageVal)
        splitLabel.text = String(format: "%.0f", split+1)
        tipValueLabel.text = String(format: "$%.2f", tip)
        totalBillLabel.text = String(format: "$%.2f", totalBill)
        totalPerPersonLabel.text = String(format: "$%.2f", totalPerPerson)
        
    }
    
    //Dismiss keyboard when tapping anywhere, including the slider and split buttons
    @IBAction func onTapSlider(sender: AnyObject) {
        view.endEditing(true)
    }

    @IBAction func onTapSplitter(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func onTapAnywhere(sender: AnyObject) {
        view.endEditing(true)
    }

}

