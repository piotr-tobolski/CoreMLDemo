from sklearn.externals import joblib
from keras.models import load_model

H = [[0.0, 0, 600, 1, 40, 3, 60000, 2, 1, 1, 50000]]

scaler = joblib.load('scaler.save')
H = scaler.transform(H)
print(H)

model = load_model('classifier.hdf5')
H_pred = model.predict(H)
print(H_pred)
