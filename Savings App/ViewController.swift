//
//  ViewController.swift
//  Savings App
//
//  Created by Rosario Tarabocchia on 9/23/15.
//  Copyright © 2015 RLDT. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtYearlyIncome: UITextField!
    @IBOutlet weak var txtWeeklySavings: UITextField!
    
    @IBOutlet weak var lblHourlyIncome: UILabel!
    @IBOutlet weak var lblWeeklyIncome: UILabel!
    @IBOutlet weak var lblMonthlyIncome: UILabel!
    @IBOutlet weak var lblMonthlySavings: UILabel!
    @IBOutlet weak var lblYearlySavings: UILabel!
    @IBOutlet weak var lblMonthlyPercent: UILabel!
    @IBOutlet weak var lblYearlyPercent: UILabel!
 
    
    
    var yearlyIncome = ""
    var weeklySavings = ""
    
    var hourlyIncome : Float = 0.0
    var weeklyIncome : Float = 0.0
    var monthlyIncome : Float = 0.0
    
    var monthlySavings : Float = 0.0
    var yearlySavings : Float = 0.0
    
    var monthlyPercent : Float = 0.0
    var yearlyPercent : Float = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnCalcutlateACTION(sender: UIButton) {
        

            
            
        takeData()
        calculate()
        
    }

    
    
    @IBAction func btnClearACTION(sender: UIButton) {
        
        clear()
    
    }
    
    
    func takeData(){
        if txtYearlyIncome.text == "" || txtWeeklySavings.text == "" {
            txtWeeklySavings.text = "0"
            txtYearlyIncome.text = "0"
        }
        
        yearlyIncome = txtYearlyIncome.text!
        weeklySavings = txtWeeklySavings.text!
        
    }
    
    
    func calculate(){
        
        var fYearlyIncome = Float(yearlyIncome)
        var fWeeklySavings = Float(weeklySavings)
        
        monthlyIncome = fYearlyIncome! / 12
        weeklyIncome = fYearlyIncome! / 52
        hourlyIncome = weeklyIncome / 40
        
        yearlySavings = fWeeklySavings! * 52
        monthlySavings = yearlySavings / 12
        
        monthlyPercent = (monthlySavings / monthlyIncome) * 100
        yearlyPercent = (yearlySavings / fYearlyIncome!) * 100
        
        
        printVar()
        
        
    }
    
    
    
    func clear(){
        
        lblHourlyIncome.text = ""
        lblWeeklyIncome.text = ""
        lblMonthlyIncome.text = ""
        lblMonthlySavings.text = ""
        lblYearlySavings.text = ""
        lblMonthlyPercent.text = ""
        lblYearlyPercent.text = ""
        
        txtYearlyIncome.text = ""
        txtWeeklySavings.text = ""
        
        
    }
    
    
    func printVar(){
        
        var sHourlyIncome = String(format: "%0.2f", hourlyIncome)
        var sWeeklyIncome = String(format: "%0.2f", weeklyIncome)
        var sMonthlyIncome = String(format: "%0.2f", monthlyIncome)
        var sMonthlySavings = String(format: "%0.2F", monthlySavings)
        var sYearlySavings = String(format: "%0.2f", yearlySavings)
        var sMonthlyPercent = String(format: "%0.2f", monthlyPercent)
        var sYearlyPercent = String(format: "%0.2f", yearlyPercent)
        
        
        lblHourlyIncome.text = "$\(sHourlyIncome)"
        lblWeeklyIncome.text = "$\(sWeeklyIncome)"
        lblMonthlyIncome.text = "$\(sMonthlyIncome)"
        lblMonthlySavings.text = "$\(sMonthlySavings)"
        lblYearlySavings.text = "$\(sYearlySavings)"
        lblMonthlyPercent.text = "\(sYearlyPercent)%"
        lblYearlyPercent.text = "\(sYearlyPercent)%"
    
    }
    
    
    func hidekeyboard(){
        
        txtWeeklySavings.resignFirstResponder()
        txtYearlyIncome.resignFirstResponder()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        hidekeyboard()
    }
    
    
    
    

    
    
    
    
    
    
    
    
    
}

