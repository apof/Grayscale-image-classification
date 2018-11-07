# Grayscale-image-classification

This work was carried out in context of Pattern Recognition and Machine Learning course. 

It is a grayscale image classification project and has been developed in MATLAB. 
We slice an 256x320 image generated randomly by texture_generator.m into 20 64x64 pixel subimages. Each of them has to be classified in one of the six classes of our problem. The algorithms we implement are 3-NN with Euclidean Distance metric and Euclidean Distance Classifier.  The features that we use are Energy, Contrast and Homogenity and for their extraction we construct the Cooccurence Matrice – CM.  Graycomatrix and graycoprops MATLAB-functions have been used for these computations. 

Firstly, we train our model with 24 labelled images and then we classify each of the sliced subimages. 
Finally, we evaluate the accuracy of our classifier.
