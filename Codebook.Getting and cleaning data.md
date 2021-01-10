---
title: "Getting and Cleaning Data"
author: "Simran"
date: "09/01/2021"
output: html_document
---

The runing_analysis.R script performs the data preparation and then followed by the 5 steps required as described in the course project’s definition.

Download the dataset
Dataset downloaded and extracted under the folder called UCI HAR Dataset

Assign each data to variables
variable_names <- features.txt : 561 rows, 2 columns

activity_labels <- activity_labels.txt : 6 rows, 2 columns
List of activities performed.
x_train ,y_train ,sub_train
x_test ,y_test,sub_test 

Merges the training and the test sets to create one data set
x_final (10299 rows, 561 columns) is created by merging x_train and x_test using rbind() function
y_final (10299 rows, 1 column) is created by merging y_train and y_test using rbind() function
sub_final (10299 rows, 1 column) is created by merging sub_train and sub_test using rbind() function.
final(10299 rows, 563 column) is created by merging x_final, y_final,sub_final using cbind() function

Extracts only the measurements on the mean and standard deviation for each measurement
TidyData (10299 rows, 88 columns) is created by subsetting Merged_Data, selecting only columns: subject, code and the measurements on the mean and standard deviation (std) for each measurement

Uses descriptive activity names to name the activities in the data set
Entire numbers in code column of the TidyData replaced with corresponding activity taken from second column of the activities variable

Appropriately labels the data set with descriptive variable names
code column in TidyData renamed into activities

From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Export FinalData into tidy_data.txt file.


