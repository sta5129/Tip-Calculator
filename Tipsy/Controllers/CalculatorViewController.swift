//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.10
    var numberOfPeople = 2
    var billTotal = 0.0

    @IBAction func tipChanged(_ sender: UIButton) {
        
        //dismiss keyboard when user chooses one of the tip values
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        
        let buttonTitleMinusPctSign = String(buttonTitle.dropLast())
    
        let buttonTitleAsNumber = Double(buttonTitleMinusPctSign)!
        
        tip = buttonTitleAsNumber / 100
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        //Get stepper value using sender.value, round it down to whole number and set it as the text in splitNumberLabel
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        
        //Set numberOfPeople as the value of the stepper as a whole number
        numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        //Get the text the user typed in billTextField
        let bill = billTextField.text!
        
        //if text is not an empty string "". so that the calculate pressed func only works if theres been user input
        if bill != "" {
            
            //turn bill from a String to an actual String with decimal places. from "123.4" to 123.4
            billTotal = Double(bill)!
            
            //multiply bill by the tip percentage and divide by # of people that split bill. calculation for figuring out the total bill, including the tip per person
            let result = billTotal * (1 + tip) / Double(numberOfPeople)
            
            //round results to 2 decimal places and turn into a String
            let finalResult = String(format: "%.2f", result)
        }
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
          
        }
    }
}

