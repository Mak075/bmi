//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()

    @IBOutlet weak var heigthValue: UILabel!
    @IBOutlet weak var weightValue: UILabel!
    @IBOutlet weak var heightSliderDot: UISlider!
    @IBOutlet weak var weightSliderDot: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func heightSlider(_ sender: UISlider) {
        heigthValue.text = String(format: "%.2f", sender.value)
        
    }
    
    @IBAction func weightSlider(_ sender: UISlider) {
        weightValue.text = String(format: "%.0f", sender.value)
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSliderDot.value
        let weight = weightSliderDot.value
        
        calculatorBrain.calculateBMI(height: Float(height), weight: Float(weight))
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
}

