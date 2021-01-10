---
title: "Getting and cleaning data "
author: "Simran"
date: "09/01/2021"
output: html_document
---
In this project, data which has been collected from the accelerometer and gyroscope of the Samsung Galaxy S smartphone is extracted,cleaned and analysis has been done to prepare a tidy data that can be used for later analysis.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.

Creating the data set

The R script runing_analysis.R can be used to create the data set by implementing the following steps

1)Download and unzip source data if it doesn't exist. 
2)Read data. Merge the training and the test sets to create one data set. 
3)Extract only the measurements on the mean and standard deviation for each measurement. Use descriptive activity names to name the activities in the data set.
4)Appropriately label the data set with descriptive variable names. 5)Create a second, independent tidy set with the average of each variable for each activity and each subject. Write the data set to the tidy_data.txt file. 



