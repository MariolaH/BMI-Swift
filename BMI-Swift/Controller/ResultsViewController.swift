//
//  ResultsViewController.swift
//  BMI-Swift
//
//  Created by Mariola Hullings on 10/30/23.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet var adviceLabel: UILabel!
    @IBOutlet var bmiLabel: UILabel!
    @IBOutlet var background: UIImageView!
    var bmiValue: String?
    var advice: String?
    var color: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bmiLabel.text = bmiValue
        adviceLabel.text = advice
//        view.backgroundColor = color
        background.backgroundColor = color
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
