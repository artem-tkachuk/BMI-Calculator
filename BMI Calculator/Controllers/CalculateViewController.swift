//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var weightSlider: UISlider!
    
    var calculatorBrain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //Update the weight slider
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        let height = String(format: "%.2f", sender.value)
        heightLabel.text = "\(height) m"
    }
    
    //Update the height slider
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let weight = Int(sender.value)
        weightLabel.text = "\(weight) kg"
    }
    
    //Calculator functionality is requested
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        calculatorBrain.calculateBMI(height, weight)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    //Prepare for showing the next screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            //Pass in the properties of the current state
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
}

// Programmatic way of creating view contrlllers
//        let secondVC = SecondViewController()
//        secondVC.bmiValue = String(format: "%.1f", bmi)
//        self.present(secondVC, animated: true, completion: nil)
