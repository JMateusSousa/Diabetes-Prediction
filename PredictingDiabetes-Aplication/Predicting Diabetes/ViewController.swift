//
//  ViewController.swift
//  Predicting Diabetes
//
//  Created by José Mateus Azevedo on 22/06/21.
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet weak var glucoseTextField: NSTextField!
    @IBOutlet weak var BMITextField: NSTextField!
    @IBOutlet weak var insulineTextField: NSTextField!
    @IBOutlet weak var ageTextField: NSTextField!
    @IBOutlet weak var resultLabelSVM: NSTextField!
    @IBOutlet weak var resultLabelDT: NSTextField!
    @IBOutlet weak var resultLabelRF: NSTextField!

    let modelSVM = DiabetesPredictionSVM()
    let modelDT = DiabetesPredictionDT()
    let modelRF = DiabetesPredictionRF()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func toPredict(_ sender: Any){
        let glucose = Double(glucoseTextField.stringValue)!
        let bmi = Double(BMITextField.stringValue)!
        let insuline = Double(insulineTextField.stringValue)!
        let age = Double(ageTextField.stringValue)!
        var dictionary: [Int64 : Double]

        guard let resultSVM = try? modelSVM.prediction(Glucose: glucose, BMI: bmi, Insulin: insuline, Age: age) else {
            fatalError("Unexpected runtime error.")
        }
        dictionary = resultSVM.OutcomeProbability
        resultLabelSVM.stringValue = String(format: "%.1f", dictionary[1]! * 100) + "%"

        guard let resultDT = try? modelDT.prediction(Glucose: glucose, BMI: bmi, Insulin: insuline, Age: age) else {
            fatalError("Unexpected runtime error.")
        }
        dictionary = resultDT.OutcomeProbability
        resultLabelDT.stringValue = String(format: "%.1f", dictionary[1]! * 100) + "%"

        guard let resultRF = try? modelRF.prediction(Glucose: glucose, BMI: bmi, Insulin: insuline, Age: age) else {
            fatalError("Unexpected runtime error.")
        }
        dictionary = resultRF.OutcomeProbability
        resultLabelRF.stringValue = String(format: "%.1f", dictionary[1]! * 100) + "%"
    }

}

