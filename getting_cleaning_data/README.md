---
title: "Getting and Cleaning Data Course Project"
author: Olga Tolstova
---

## 1. Introduction
Data represent the results of the experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 


## 2. The origin data sourse

- The origin data source: <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>
- The data for analysis was loaded from <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>


## 3. Working Directory
It is nessesary 
- to place the data into the **UCI HAR Dataset** directory
- to set working directory before start scripts in such way:
```
setwd("C:/R/3C/data")
```
After all mentioned above manipulations the working directory shoul contain the following files and subdirectories:

  * [UCI HAR Dataset]
      * [activity_labels.txt]
      * [features.txt]
      * features_info.txt
      * README.txt
      * [test]
          * subject_test.txt
          * X_test.txt
          * y_test.txt
          * [Inertial Signals]
      * [train]
          * subject_test.txt
          * X_train.txt
          * y_train.txt
          * [Inertial Signals]

## 4. The run_analysis.R script
The **run_analysis.R** script

  1. reads data the "Human Activity Recognition Using Smartphones Data Set" from the directory **UCI HAR Dataset**
  2. merges the training and the test sets to create one data set.
  3. extracts only the measurements on the mean and standard deviation for each measurement.
  4. uses descriptive activity names to name the activities in the data set
  5. appropriately labels the data set with descriptive variable names.
  6. from the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## 5. The CodeBook.md file
**The CodeBook.md** file provides a detailed explanation about the steps performed by the script and the resulting data and variables.