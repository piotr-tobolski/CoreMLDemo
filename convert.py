import coremltools
import keras
from sklearn.externals import joblib

classifier_model = coremltools.converters.keras.convert('classifier.hdf5')
classifier_model.save('Classifier.mlmodel')
print(classifier_model)

scaler = joblib.load('scaler.save')
scaler_model = coremltools.converters.sklearn.convert(scaler)
scaler_model.save('Scaler.mlmodel')
print(scaler_model)
