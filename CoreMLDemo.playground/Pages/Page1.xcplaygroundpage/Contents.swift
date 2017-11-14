import Cocoa
import CoreML

do {
    print("\ndefine input:")
    let input: [Double] = [0.0, 0, 600, 1, 40, 3, 60000, 2, 1, 1, 50000]

    print("\nconvert input to MLMultiArray:")
    let inputArray = try MLMultiArray(shape: [11], dataType: .double)
    for (index, element) in input.enumerated() {
        inputArray[index] = NSNumber(value: element)
    }
    print(inputArray)

    print("\ncreate scaler:")
    let scaler = Scaler()
    print(scaler.model)

    print("\nuse scaler:")
    let scalerPrediction = try scaler.prediction(input: inputArray)
    let scaledInput = scalerPrediction.transformed_features
    print(scaledInput)

    print("\ncreate classifier:")
    let classifier = Classifier()
    print(classifier.model)

    print("\nuse classifier:")
    let classifierPrediction = try classifier.prediction(input1: scaledInput)
    let classification = classifierPrediction.output1
    print(classification)

} catch {
    print(error)
}
