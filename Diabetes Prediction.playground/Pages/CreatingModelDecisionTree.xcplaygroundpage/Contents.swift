import Foundation
import CreateML

let csvFile = Bundle.main.url(forResource: "diabetes", withExtension: "csv")!
let dataTable = try MLDataTable(contentsOf: csvFile)

print(dataTable)

let classifierColumns = ["Glucose", "BMI", "Insulin", "Age", "Outcome"]
let classifierTable = dataTable[classifierColumns]
print(classifierTable)

let (classifierEvaluationTable, classifierTrainingTable) = classifierTable.randomSplit(by: 0.2, seed: 5)

let classifier = try MLDecisionTreeClassifier(trainingData: classifierTrainingTable, targetColumn: "Outcome")

let trainingError = classifier.trainingMetrics.classificationError
let trainingAccuracy = (1.0 - trainingError) * 100

//let homePath = FileManager.default.homeDirectoryForCurrentUser
//let desktopPath = homePath.appendingPathComponent("Desktop")
//
//let classifierMetadata = MLModelMetadata(author: "José Mateus", shortDescription: "Predicts diabetes with Decision Tree.", version: "1.0")
//
//try classifier.write(to: desktopPath.appendingPathComponent("DiabetesPredictionDT.mlmodel"), metadata: classifierMetadata)
