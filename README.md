# IBM Developer Model Asset Exchange: Object Detector

This repository contains code to instantiate and deploy an object detection model as a web service. The input to the model is an image, and the output is a list of estimated class probabilities for the objects detected in the image.

The origin model is based on the [SSD Mobilenet V1 object detection model for TensorFlow](https://github.com/tensorflow/models/blob/master/research/object_detection/g3doc/detection_model_zoo.md) but I changed something to use my customized models.

# Object Detector Web App

The latest release of the [MAX Object Detector Web App](https://github.com/IBM/MAX-Object-Detector-Web-App)
is included in the Object Detector docker image.

When the model API server is running, the web app can be accessed at `http://localhost:5000/app`
and provides interactive visualization of the bounding boxes and their related labels returned by the model.

![Mini Web App Screenshot](docs/my-web-app.png)

