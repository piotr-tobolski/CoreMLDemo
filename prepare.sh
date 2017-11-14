source activate python2
python convert.py
COREMLC="`xcode-select -p`/usr/bin/coremlc"
$COREMLC compile ./Classifier.mlmodel ./CoreMLDemo.playground/Resources
$COREMLC generate ./Classifier.mlmodel ./CoreMLDemo.playground/Sources --language Swift --swift-version 4.0
$COREMLC compile ./Scaler.mlmodel ./CoreMLDemo.playground/Resources
$COREMLC generate ./Scaler.mlmodel ./CoreMLDemo.playground/Sources --language Swift --swift-version 4.0
sed -i '' -e '/^\ \ \ \ let/s/let/public\ let/;s/var/public\ var/;s/func/public\ func/;/^class/s/class/public\ class/;s/\ init/\ public\ init/' CoreMLDemo.playground/Sources/Classifier.swift ./CoreMLDemo.playground/Sources/Scaler.swift
