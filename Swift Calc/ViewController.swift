//
//  ViewController.swift
//  Swift Calc
//
//  Created by Grant Bartone on 8/30/17.
//  Copyright © 2017 Grant Bartone. All rights reserved.
//  Inspired by https://www.youtube.com/watch?v=5tpQEsJ0iVg&t=190
//  It's sloppy but it works! Needs code clean-up, break out into calc operation component methods, etc
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen:Double = 0
    var previousNumber:Double = 0
    var performingMath = false
    var operation = 0
    let operations = [15: "+", 14: "-", 13: "x", 12: "/"]
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        if performingMath {
            label.text = String(sender.tag - 1)
            performingMath = false
        } else {
            label.text = (label.text != "0" ? label.text! : "") + String(sender.tag - 1)
        }
        numberOnScreen = Double(label.text!)!
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        if label.text != "" && sender.tag != 11 && sender.tag != 16 { //operators
            previousNumber = Double(label.text!)!
            performingMath = true
            operation = sender.tag
            label.text = operations[operation]
        } else if (sender.tag == 16) { //Equals
            switch (operations[operation]) {
            case "+"?:
                label.text = String(previousNumber + numberOnScreen)
            case "-"?:
                label.text = String(previousNumber - numberOnScreen)
            case "x"?:
                label.text = String(previousNumber * numberOnScreen)
            case "/"?:
                label.text = String(previousNumber / numberOnScreen)
            default:
                print("Operation bug!")
            }
            previousNumber = 0
        } else { //Clear
            label.text = "0"
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
            performingMath = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

