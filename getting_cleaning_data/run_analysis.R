## Created in R version 3.4.1 (2017-06-30) by Olga Tolstova 31.08.2017
# 
## This script
## 0. does preparations: installs packages, loads libraries ans reads data the "Human Activity Recognition Using Smartphones Data Set" from the directory C:\R\3C\data\UCI_HAR_Dataset
## 1. merges the training and the test sets to create one data set.
## 2. extracts only the measurements on the mean and standard deviation for each measurement.
## 3. uses descriptive activity names to name the activities in the data set
## 4. appropriately labels the data set with descriptive variable names.
## 5. from the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# 
## The origin data source: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
## The data for analysis was loaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
 
 
## 0. Reading data from the diretory

# set correct working directory
setwd("C:/R/3C/data")

#  install / load packages and libraries 
if (length(grep("data.table", installed.packages(), fixed=TRUE)) == 0) {
  install.packages("data.table")
}
library(dplyr)  # to merge datasets
library(tidyr)
library(data.table)

# load zipped data  
if (!file.exists("./UCI HAR Dataset")) {
  # download the data
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  zipfile="./UCI_HAR_data.zip"
  message("Downloading data")
  download.file(fileURL, destfile=zipfile)
  unzip(zipfile, exdir=".")
}

# load features and activity
features <- read.table("./UCI HAR Dataset/features.txt")
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
# rename columns 
names(features) <- c("feature_id","feature_name")
names(activity_labels) <- c("activity","activity_name")

# load, rename columns and join test dataset 
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")

names(subject_test) <- "subject"
names(x_test) <- features$feature_name
names(y_test) <- "activity"

test <- cbind(y_test, x_test, subject_test)

# load, rename columns and join train dataset
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

names(subject_train) <- "subject"
names(x_train) <- features$feature_name
names(y_train) <- "activity"

train <- cbind(y_train, x_train, subject_train)

## 1. Merging the training and the test sets to create one data set.
# add column IsTrainSet to test and train datasets
train$IsTrainSet <-TRUE
test$IsTrainSet <-FALSE

# check the column names identity for test amd train data
if(any(names(test) != names(train))) stop("The column names are not equal.")
alldata <- rbind(test, train)
# union datasets with dplyr library
#alldata <- bind_rows (test, train) #-- something wrong  - only 480 columns 10299 obs.


## 2. Extracting only the measurements on the mean and standard deviation for each measurement.
std_names <- grep("std\\(\\)", names(alldata), value = TRUE)
mean_names <- grep("mean\\(\\)",names(alldata), value = TRUE)

columns_with_std_mean <- c(std_names, mean_names)
selected_columns <- c("activity","subject", columns_with_std_mean)
tidydata <- alldata [  ,selected_columns]

## 3. Using descriptive activity names to name the activities in the data set
#x=2
#gsub(x, activity_labels[activity_labels$activity==x, 2], x)
tidydata$activity <- sapply(tidydata$activity, function(x){gsub(x, activity_labels[activity_labels$activity==x, 2], x)})

## 4. Appropriately labeling the data set with descriptive variable names (Remove the parenthesis and dashes names ).
names(tidydata) <- gsub("std", "StanDev"  , names(tidydata))
names(tidydata) <- gsub("mean", "Mean"  , names(tidydata))
names(tidydata) <- gsub("\\(", ""  , names(tidydata))
names(tidydata) <- gsub("\\)", ""  , names(tidydata))
names(tidydata) <- gsub("-", ""  , names(tidydata))
names(tidydata) <- gsub("BodyBody", "Body"  , names(tidydata))

## 5. From the data set in step 4, creating a second, independent tidy data set with the average of each variable for each activity and each subject.
tidydata$activity_mean <- apply(tidydata[,3:68], 1, mean)

## Save the tidy result into a tidydata.csv file  
setwd("C:/GIT/datasciencecoursera/getting_cleaning_data") 
write.csv(tidydata, file = 'tidydata.csv', row.names = FALSE, quote = FALSE)  


