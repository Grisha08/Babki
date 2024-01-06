//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billText: UITextField!
    
    @IBOutlet weak var countPeopleLabel: UILabel!
    @IBOutlet weak var TenButton: UIButton!
    @IBOutlet weak var twentyButton: UIButton!
    @IBOutlet weak var zeroButton: UIButton!
    
    var tip = 0.1
    var bill = 0.0
    var people = 1
    var total :String = ""
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
     
    @IBAction func stepperChanged(_ sender: UIStepper) {
        billText.endEditing(true)
        people = Int(sender.value)
        countPeopleLabel.text = String(Int(sender.value))
    }
    
    @IBAction func TipChanged(_ sender: UIButton) {
        billText.endEditing(true)
        
        zeroButton.isSelected = false
        TenButton.isSelected = false
        twentyButton.isSelected = false
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        tip = buttonTitleAsANumber / 100
    }
    
    @IBAction func CalculateB(_ sender: UIButton) {
        
        bill = Double(billText.text!) ?? 0.0
      total =  String(format: "%.2f", ( bill * (tip + 1) ) / Double(people))
       
        self.performSegue(withIdentifier:"goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destiationVC = segue.destination as! ResultViewController
           destiationVC.tips = Int(tip * 100)
            destiationVC.total = total
            destiationVC.people = people
        }
    }
    
    
}

