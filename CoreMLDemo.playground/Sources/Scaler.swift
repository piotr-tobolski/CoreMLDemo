//
// Scaler.swift
//
// This file was automatically generated and should not be edited.
//

import CoreML


/// Model Prediction Input Type
@available(macOS 10.13, iOS 11.0, tvOS 11.0, watchOS 4.0, *)
public class ScalerInput : MLFeatureProvider {

    /// input as 11 element vector of doubles
    public var input: MLMultiArray
    
    public var featureNames: Set<String> {
        get {
            return ["input"]
        }
    }
    
    public func featureValue(for featureName: String) -> MLFeatureValue? {
        if (featureName == "input") {
            return MLFeatureValue(multiArray: input)
        }
        return nil
    }
    
    public init(input: MLMultiArray) {
        self.input = input
    }
}


/// Model Prediction Output Type
@available(macOS 10.13, iOS 11.0, tvOS 11.0, watchOS 4.0, *)
public class ScalerOutput : MLFeatureProvider {

    /// transformed_features as 11 element vector of doubles
    public let transformed_features: MLMultiArray
    
    public var featureNames: Set<String> {
        get {
            return ["transformed_features"]
        }
    }
    
    public func featureValue(for featureName: String) -> MLFeatureValue? {
        if (featureName == "transformed_features") {
            return MLFeatureValue(multiArray: transformed_features)
        }
        return nil
    }
    
    public init(transformed_features: MLMultiArray) {
        self.transformed_features = transformed_features
    }
}


/// Class for model loading and prediction
@available(macOS 10.13, iOS 11.0, tvOS 11.0, watchOS 4.0, *)
public class Scaler {
    public var model: MLModel

    /**
        Construct a model with explicit path to mlmodel file
        - parameters:
           - url: the file url of the model
           - throws: an NSError object that describes the problem
    */
    public init(contentsOf url: URL) throws {
        self.model = try MLModel(contentsOf: url)
    }

    /// Construct a model that automatically loads the model from the app's bundle
    convenience public init() {
        let bundle = Bundle(for: Scaler.self)
        let assetPath = bundle.url(forResource: "Scaler", withExtension:"mlmodelc")
        try! self.init(contentsOf: assetPath!)
    }

    /**
        Make a prediction using the structured interface
        - parameters:
           - input: the input to the prediction as ScalerInput
        - throws: an NSError object that describes the problem
        - returns: the result of the prediction as ScalerOutput
    */
    public func prediction(input: ScalerInput) throws -> ScalerOutput {
        let outFeatures = try model.prediction(from: input)
        let result = ScalerOutput(transformed_features: outFeatures.featureValue(for: "transformed_features")!.multiArrayValue!)
        return result
    }

    /**
        Make a prediction using the convenience interface
        - parameters:
            - input as 11 element vector of doubles
        - throws: an NSError object that describes the problem
        - returns: the result of the prediction as ScalerOutput
    */
    public func prediction(input: MLMultiArray) throws -> ScalerOutput {
        let input_ = ScalerInput(input: input)
        return try self.prediction(input: input_)
    }
}
