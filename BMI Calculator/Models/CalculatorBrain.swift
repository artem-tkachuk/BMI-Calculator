//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Artem Tkachuk on 7/23/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    var bmi: BMI?
    
    //String because this function is used for label output
    func getBMIValue() -> String {
        return String(format: "%.1f", bmi?.value ?? 0.0)
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "No advice found"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }

    //Update the current value
    mutating func calculateBMI(_ height: Float, _ weight: Float) {
        let bmiValue = weight / pow(height, 2)
        let advice: String
        let color: UIColor
        
        switch bmiValue {
            case ..<18.5 :
                advice = "Eat more pies!"
                color = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
            case 18.5...24.9:
                advice = "Fit as a fiddle!"
                color = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
            default:
                advice = "Eat fewer pies!"
                color = #colorLiteral(red: 1, green: 0.1764705882, blue: 0.3333333333, alpha: 1)
        }
        
        bmi = BMI(bmiValue, advice, color)
    }
}
