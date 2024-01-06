//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Grisha Borodavka on 04/12/2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    
    @IBOutlet weak var totalLabel: UILabel!
    
    
    @IBOutlet weak var infoLabel: UILabel!
    
    var tips  = 10
    var people = 1
    var  total : String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        totalLabel.text = total
        
        infoLabel.text = "Split between \(people) people, with \(tips)% tip."
        
    }
    @IBAction func Recalculate(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
