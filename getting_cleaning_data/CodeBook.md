---
title: "Getting and Cleaning Data Course Project CodeBook"
author: Olga Tolstova
---

## 1. Introduction
This dataset is derived from the Human Activity Recognition Using Smartphones" dataset.
Data represent the results of the experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 


## 2. The origin data sourse

- The origin data source: <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>
- The data for analysis was loaded from <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

## 3. R version
R version 3.4.1 (2017-06-30)

## 3. Necessary preparations: 
It is nessesary 
- to place the data into the **UCI HAR Dataset** directory
- to set working directory before start scripts in such way:
```
setwd("C:/R/3C/data")
```
- to install a **"data.table" package** and load **libraries**
```
install.packages("data.table")
library(dplyr)  # to merge datasets
library(tidyr)
library(data.table)
```

## Data processing
Test and train datasets should be collected from several file sources.

The original dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.



### Datasets with size:
*features*          - 561 obs. of 2 variables         for feature labels and names  
*activity_labels*   - 6 obs. of 2 variables           for activity labels and names  
*subject_test*      - 2941 obs. of 1 variable         for test subjects  
*x_test*            - 2941 obs. of 561 variables      for test X  
*y_test*            - 2941 obs. of 1 variable         for test y  
*subject_train*     - 7352 obs. of 1 variable         for train subjects  
*x_train*           - 7352 obs. of 561 variables      for train X  
*y_train*           - 7352 obs. of 1 variable         for train y  
*test*              - 2947 obs. of 564 variables      the test dataset  
*train*             - 7352 obs. of 564 variables      the train dataset        
*all*               - 10299 obs. of 564 variables     test + train datasets together.  
*tidydata*          - 10299 obs. of 69 variables      the tidy result dataset  

### Variables:
*fileURL*                 - for the file web address  
*std_names*               - column names with a substring "std"   
*mean_names*              - column names with a substring "mean"  
*columns_with_std_mean*   - column names with a substring "mean" and with a substring "std"   
*selected_columns*        - list of columns for tidydata without the activity_mean column  







