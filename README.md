# Napolean
Code for Napolean project. This will allow blind people to be able to read books with the power of Raspiberry Pis

### Usage

This code is meant to be run on a raspberry pi 3 (b+), or at least, that's what we're testing with.

##### split_in_2.sh
Splits an image (meant to be taken by the picam of an open book) takes an image, splits it down the middle, and grayscales it.

##### get_text_of_both.sh
Uses Tesseract (OCR) to extract text from each side of the picture (left.jpg, right.jpg)

##### StreamingCam.py
Runs a local web server to view the current camera output

##### take_picture.sh
Kills the webserver to unlock the camera. Takes image. Restarts web server.

Everything in the JPG folder are reference images to make aure that all the software is working.


Suggetions / bugs etc.. please use the issues tab.

Use pull requests to submit ideas you've coded.
