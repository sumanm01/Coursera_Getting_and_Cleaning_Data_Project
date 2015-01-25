---
title: "CodeBook"
author: "Suman Mandal"
date: "Monday, January 19, 2015"
output: html_document
---

Code Book for Getting and Cleaning Data Course Project
=============

The code book describes the variables, the data, and any transformations or work that is performed to clean up the dataset.

### Information about the Data
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

### Steps performed to process the data:

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

### Key Variables involved in the data processing:

* X_train, y_train, x_test, y_test, subject_train, subject_test and activity_labels contain the data from the downloaded files.

* train.data, test.data contains the merged training and test data along with the subject of the data.

* final.merged.data contains the merged data from training and test data set.

* relevant.features contains all the relevant features related to Mean and Standard Deviation.

* All the relevant features along with the Subject and Activity information is stored in extracted.data

* average.data contains the Average values of all the relevant features thus captured in the previous step.

* tidy.data contains the final tidy data set where the columns are properly named and Activity numbers are replaced by their corresponding Activity names and the columns are rearranged for better visibility.

* Finally the tidy.data is persisted to a data file UCI_HAR_Dataset.txt in the R workspace.















