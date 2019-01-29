//
//  ViewController.swift
//  BMI Calculator
//
//  Created by R. Kukuh on 29/01/19.
//  Copyright © 2019 R. Kukuh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var bmiScore: UILabel!
    @IBOutlet weak var bmiCategory: UILabel!
    
    @IBAction func sliderValueChanged(_ sender: Any?) {
        var result: Double = 0
        let weight = Double(weightSlider!.value)
        let height = Double(heightSlider!.value)
        
        weightLabel.text = String(format: "%.1f", weight)
        heightLabel.text = String(format: "%.2f", height)
        
        result = calculateBMI(with: weight, and: height)
        
        setBmiCategory(for: result)
        
        bmiScore.text = "BMI = \(String(format: "%.2f", result))"
    }
    
    func calculateBMI(with weight: Double, and height: Double) -> Double {
        return weight / pow(height, 2)
    }
    
    func setBmiCategory(for value: Double) {
        switch value {
            case ..<18.5:
                bmiCategory.text = "Underweight"
                bmiCategory.backgroundColor = UIColor.lightGray
            case 18.5..<24.9:
                bmiCategory.text = "Healthy"
                bmiCategory.backgroundColor = UIColor.green
            case 25..<29.9:
                bmiCategory.text = "Overweight"
                bmiCategory.backgroundColor = UIColor.yellow
            case 30..<34.9:
                bmiCategory.text = "Severely Overweight"
                bmiCategory.backgroundColor = UIColor.orange
            case 35...:
                bmiCategory.text = "Morbidly Overweight"
                bmiCategory.backgroundColor = UIColor.red
            default:
                bmiCategory.text = "UNKNOWN"
                bmiCategory.backgroundColor = UIColor.gray
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weightSlider.value = 77
        heightSlider.value = 1.74
        
        sliderValueChanged(nil)
    }
}

