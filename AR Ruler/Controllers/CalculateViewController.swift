//
//  CalculateViewController.swift
//  AR Ruler
//
//  Created by SHIVAM SHARMA on 07/07/24.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    var height : Float?
    
    var calculatorBrain = CalculatorBrain()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let weightString = String(format: "%.0f", sender.value)
        weightLabel.text = "\(weightString) kg"
        
        calculatorBrain.weight = Float(weightString)!
    }
    

    @IBAction func calculatePressed(_ sender: UIButton) {
        calculatorBrain.height = height ?? 0.0
        calculatorBrain.calculateBMI()
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let BMIvalue = calculatorBrain.bmi?.value
        
        if (segue.identifier == "goToResult") {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiVal = String(format: "%.1f", BMIvalue!)
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
    

}
