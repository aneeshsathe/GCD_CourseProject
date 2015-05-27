CodeBook ASSIGNMENT 1 - Getting and Cleaning Data (Coursera)
This document describes the variables, the data, and any transformations or work performed to clean up the data

Data Sources from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The zip file contains a folder called 'UCI HAR Dataset' that contains the following files:

README.txt
features_info.txt: Information about the variables used in features.txt
features.txt: List of features
activity_labels.txt: Labels for activities

X_train.txt: Training data for the features. 
y_train.txt: Training data for the activities.
subject_train:subject undergoing activity

X_test.txt: Test data for the features. 
y_test.txt: Test data for the activities.
subject_test: subject undergoing activity


The code performs the following steps:

1. Reads the data
2. Identifies features and activity labels and merges the training and test sets
3). extracts measurements for means and standard deviations
4. Labels columns with appropriate names
5. Saves output tidy data. 
