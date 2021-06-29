import PlaygroundSupport
import Foundation

let modelSVM = DiabetesPredictionSVM()
let modelDT = DiabetesPredictionDT()
let modelRF = DiabetesPredictionRF()

let glucose: Double = 107
let bmi: Double = 29.6
let insulin: Double = 0
let age: Double = 31


guard let resultSVM = try? modelSVM.prediction(Glucose: glucose, BMI: bmi, Insulin: insulin, Age: age) else {
    fatalError("Unexpected runtime error.")
}
print("Prediction from SVM: \(resultSVM.OutcomeProbability)")

guard let resultDT = try? modelDT.prediction(Glucose: glucose, BMI: bmi, Insulin: insulin, Age: age) else {
    fatalError("Unexpected runtime error.")
}
print("Prediction from DT: \(resultDT.OutcomeProbability)")

guard let resultRF = try? modelRF.prediction(Glucose: glucose, BMI: bmi, Insulin: insulin, Age: age) else {
    fatalError("Unexpected runtime error.")
}
print("Prediction from RF: \(resultRF.OutcomeProbability)")
