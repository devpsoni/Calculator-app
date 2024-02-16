//
//  ViewController.swift
//  Calculator
//
//  Created by Dev Soni on 16/02/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var firstNum: UITextField!
    @IBOutlet weak var secondNum: UITextField!
    @IBOutlet weak var mathOperation: UISegmentedControl!
    @IBOutlet weak var resultLabel: UILabel!
    var result = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func calculateResult() {
        guard let fNum = Int(firstNum.text ?? "0"),
              let sNum = Int(secondNum.text ?? "0") else {
            resultLabel.text = "Invalid input"
            return
        }
        
        switch mathOperation.selectedSegmentIndex {
        case 0:
            result = fNum + sNum
        case 1:
            result = fNum - sNum
        case 2:
            if sNum != 0 { // Prevent division by zero
                result = fNum / sNum
            } else {
                resultLabel.text = "Cannot divide by zero"
                return
            }
        case 3:
            result = fNum * sNum
        default:
            result = fNum + sNum // Default operation if no segment is selected
        }
    }
    
    @IBAction func segVal(_ sender: UISegmentedControl) {
        calculateResult() // Calculate result when segment value changes
    }
    
    @IBAction func calcBtn(_ sender: Any) {
        calculateResult()
        resultLabel.text = String(result)
    }
}
