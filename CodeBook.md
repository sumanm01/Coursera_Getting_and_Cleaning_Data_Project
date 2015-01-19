---
title: "CodeBook"
author: "Suman Mandal"
date: "Monday, January 19, 2015"
output: html_document
---

Code Book for Getting and Cleaning Data Course Project
=============

The code book describes the variables, the data, and any transformations or work that is performed to clean up the dataset.

### Steps performed are:-

* Download the data and unzip it to the data directory.
* Read the training data and merge in order - Xtrain, Subject, Ytrain.
* Read the test data and merge in order - Xtest, Subject, Ytest.
* Merge the training and test data.
* Extract the relevant features of mean and std from the whole set of features.
* Prepare the final dataset only containing the relevant features.
* Assign valid column names for each of the columns.
* Calculate average of each activity for each subject for all the feature vectors.
* Read the activity labels and merge it to the average data.
* Get the final tidy dataset with descriptive column names.
* Write the tidy dataset to a txt file.








