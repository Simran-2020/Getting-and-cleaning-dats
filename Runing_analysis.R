library(dplyr)

# Reading data and activity labels
features_names <- read.table("UCI HAR Dataset/features.txt")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE)

#Reading training data 
x_Train <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)
y_Train <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE)
sub_Train <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)

#Reading test data
x_Test <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)
y_Test <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE)
sub_Test <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)

#Step 1.Merging the training and the test data to create one dataset

x_final <- rbind(x_Train, x_Test)
y_final <- rbind(y_Train, y_Test)
sub_final <- rbind(sub_Train, sub_Test)

#Step2.Extracts only the measurements on the mean and standard deviation for each measurement.

sel_features <- variable_names[grep(".*mean\\(\\)|std\\(\\)", features[,2], ignore.case = FALSE),]
x_final     <- x_final[,sel_features[,1]]



# Step 3 - Use descriptive activity names to name the activities in the data          set

#Naming the columns

colnames(x_final)   <- sel_features[,2]
colnames(y_final)   <- "activity"
colnames(sub_final) <- "subject"

# merging final dataset
final <- cbind(sub_final, y_final, x_final)

# replacing activity values with named factor levels
 
final$activity <- factor(final$activity, levels = activity_labels[,1], labels = activity_labels[,2]) 
final$subject  <- as.factor(final$subject) 

#Step4: - Appropriately label the data set with descriptive variable names

extractedData <- final[,sel_features]
dim(extractedData)


#5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

extractedData$Subject <- as.factor(extractedData$Subject)


tidyData <- aggregate(. ~Subject + Activity, extractedData, mean)
tidyData <- tidyData[order(tidyData$Subject,tidyData$Activity),]

# output to file "tidy_data.txt"

write.table(tidyData, file = "Tidy.txt", row.names = FALSE)

