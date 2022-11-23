//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Mak Mulabegovic on 23. 11. 2022..
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorBrain {
    
    var bmi: BMI?
    
    func getBMIValue() -> String {
        var stringBMI  = String(format: "%.1f", bmi?.value ?? 0.0)
        return stringBMI
    }
    
    func getAdvice() -> String {
        return bmi!.advice
    }
    
    func getColor() -> UIColor {
        return bmi!.color
    }
    
    
    
    mutating func calculateBMI(height: Float, weight: Float){
        let bmiValue = weight / (height * height)
        
        if(bmiValue <= 18.5) {
            bmi = BMI(value: bmiValue, advice: "Skinny", color: UIColor.blue)
        } else if (bmiValue >= 18.5 && bmiValue <= 24.9){
            bmi = BMI(value: bmiValue, advice: "Normal", color: UIColor.green)
        } else if(bmiValue >= 25 && bmiValue <= 29.9) {
            bmi = BMI(value: bmiValue, advice: "Overweight", color: UIColor.black)
        } else if (bmiValue >= 30 && bmiValue <= 34.9) {
            bmi = BMI(value: bmiValue, advice: "Obese", color: UIColor.orange)
        } else {
            bmi = BMI(value: bmiValue, advice: "Very Obese", color: UIColor.red)
        }
    }
}
    
