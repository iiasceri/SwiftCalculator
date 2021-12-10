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
        var text = resultLabel.text!
        if (text.count > 0) {
            resultLabel.text = String(text.dropLast())
        }
    }
    
    @IBAction func buttonNumberPressed(_ sender: UIButton) {
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
    
    @IBAction func buttonOperatorPressed(_ sender: UIButton) {
        if (canAddOperation) {
            let text = sender.titleLabel!.text!
            let labelText = resultLabel.text
            resultLabel.text = labelText! + text
            canAddOperation = false
            canAddDecimal = true
        }
    }
    
    @IBAction func buttonEqualsPressed(_ sender: Any) {
        let digitsOperators = digitsOperators()

        if (digitsOperators.isEmpty) {
            resultLabel.text = ""
            return
        }
        
//        val timesDivision = timesDivisionCalculate(digitsOperators)
//        if (timesDivision.isEmpty) {
//            resultLabel.text = ""
//            return
//        }
//
//        let result = addSubCalculate(timesDivision)
//        resultLabel.text = String(result)
    }
    
    func digitsOperators() -> Array<String> {
        var list = [Any]()
        var currentDigit = ""
        let text = String(resultLabel.text!)
        for charact in text {
            if (charact.isNumber || charact == ".") {
                currentDigit += String(charact)
            } else {
                list.append(Double(currentDigit))
                currentDigit = ""
                list.append(charact)
            }
        }

        if (currentDigit != "") {
            list.append(Double(currentDigit))
        }

        return list
    }
    
    func timesDivisionCalculate(digitsOperators: Array<String>) -> Array<String>{
        var list = digitsOperators
        while (list.contains(where: "x") || list.contains(where: "/")) {
            list = calcTimesDiv(list)
        }
        return list
    }
    
    
    
}

