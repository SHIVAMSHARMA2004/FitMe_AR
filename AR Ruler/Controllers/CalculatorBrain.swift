//
//  CalculatorBrain.swift
//  AR Ruler
//
//  Created by SHIVAM SHARMA on 07/07/24.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import UIKit

struct BMI {
    let value : Float
    let advice : String
    let color : UIColor
}

struct CalculatorBrain {
    var bmi : BMI?
    var height : Float = 0.0
    var weight : Float = 0.0
    
    mutating func calculateBMI() {
        let bmiValue = weight / (pow(height, 2))
        
        if (bmiValue < 18.5) {
            bmi = BMI(value: bmiValue, advice: "Eat more chole bhature", color : UIColor.blue)
        } else if (bmiValue < 24.9) {
            bmi = BMI(value: bmiValue, advice: "Dont eat less dont eat more", color : UIColor.green)
        } else {
            bmi = BMI(value: bmiValue, advice: "controlling diet is the path to fitness", color : UIColor.red)
        }
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "no advice"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? .white
    }
}

