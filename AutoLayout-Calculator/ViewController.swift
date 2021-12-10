//
//  ViewController.swift
//  AutoLayout-Calculator
//
//  Created by Ion Iascerinschi on 8/21/18.
//  Copyright © 2018 Ion Iascerinschi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    private var canAddOperation = false
    private var canAddDecimal = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func buttonClearAllPressed(_ sender: Any) {
        resultLabel.text = ""
    }
    
    @IBAction func buttonErasePressed(_ sender: Any) {
        
    }
    
    @IBAction func buttonNumberPressed(_ sender: UIButton) {
        if (sender != nil) {
            let text = sender.titleLabel!.text!
            if (text == ".") {
                if (canAddDecimal) {
                    let labelText = resultLabel.text
                    resultLabel.text = labelText! + text
                    canAddOperation = false
                }
                canAddDecimal = false
                
            } else {
                let labelText = resultLabel.text
                resultLabel.text = labelText! + text
                canAddOperation = true
            }
        }
        
//        if (view.text == ".") {
//                        if (canAddDecimal) {
//                            workingTV.append(view.text)
//                            canAddOperation = false
//                        }
//                        canAddDecimal = false
//                    } else {
//                        workingTV.append(view.text)
//                        canAddOperation = true
//                    }
    }
    
    @IBAction func buttonOperatorPressed(_ sender: Any) {
        
    }
    
    @IBAction func buttonEqualsPressed(_ sender: Any) {
        
    }
    
}

