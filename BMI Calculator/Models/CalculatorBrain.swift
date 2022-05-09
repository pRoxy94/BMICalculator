//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Rossana Laricchia on 29/04/22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import Foundation
import UIKit
struct CalculatorBrain {
    
    var bmi: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float) {
	   // errore: self is immutable ---> le struct sono immutabili, dobbiamo distruggere la vecchia copia e crearne una nuova.
	   // constrassegnare il metodo come mutating func cosicchè possa cambiare la nostra proprietà.
	   let bmiValue = weight / pow(height, 2)
	   
	   if bmiValue < 18.5 {
		  bmi = BMI(value: bmiValue, advice: "Eat more pies!", color: UIColor.blue)
	   } else if bmiValue < 24.9 {
		  bmi = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: (UIColor.green))
	   } else {
		  bmi = BMI(value: bmiValue, advice: "Eat less pies!", color: UIColor.red)
	   }
    }
    
    func getBMIValue() -> String {
	   // optional chaining
	   let bmiToDecimal = String(format: "%.1f", bmi?.value ?? 0.0)
	   return bmiToDecimal
    }
    
    func getAdvice() -> String {
	   return bmi?.advice ?? "No advice"
    }
    
    func getColor() -> UIColor {
	   return bmi?.color ?? UIColor.white
    }
    
    /**
	BMI Categories:
	Underweight = <18.5
	Normal weight = 18.5 - 24.9
	Overweight = 25
	*/
}
