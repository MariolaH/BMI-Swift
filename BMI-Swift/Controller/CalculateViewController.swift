//
//  ViewController.swift
//  BMI-Swift
//
//  Created by Mariola Hullings on 10/26/23.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var bmiValue = "0.0"
    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet var weightLabel: UILabel!
    @IBOutlet var heightLabel: UILabel!
    @IBOutlet var heightSlider: UISlider!
    @IBOutlet var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func heightSliderChange(_ sender: UISlider) {
        let feet = Int(sender.value)
        //(sender.value - Float(feet)): This part calculates the decimal part of the height. For example, if sender.value is 4.5 feet and feet is 4, then 4.5 - 4 equals 0.5, which represents the remaining height in inches (0.5 feet is equivalent to 6 inches). * 12: Since there are 12 inches in 1 foot, multiplying the remaining fractional part by 12 converts it from feet to inches. In our example, 0.5 * 12 equals 6 inches.
        let inches = Int((sender.value - Float(feet)) * 12)
        //        heightLabel.text = String(format: "%.1f",sender.value)
        heightLabel.text = "\(feet)'\(inches)\" "
    }
    
    
    @IBAction func weightSliderChange(_ sender: UISlider) {
        let weight = String(format: "%.0f", sender.value)
        weightLabel.text = "\(weight) lbs"
        
    }
    
    func calculateBMI() -> Float {
        let weight = weightSlider.value
        let height = heightSlider.value * 12
        let heightSquared = pow(height, 2)
        let bmi = (weight / heightSquared) * 703
        print(bmi)
        return bmi
    }
    
    
    @IBAction func calculateButton(_ sender: UIButton) {
        let weight = weightSlider.value
        let height = heightSlider.value * 12
        calculatorBrain.calculateBMI(height: height, weight: weight)
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
            
        }
    }
}

