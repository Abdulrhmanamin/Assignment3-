features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names ="subject")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt",col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt",col.names = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names ="subject")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt",col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt",col.names = "code")


##Merges the training and the test sets to create one data set.
X <- rbind(X_train,X_test)
y <- rbind(y_train,y_test)
subject <- rbind(subject_train,subject_test)
mergedData <- cbind(subject,X,y)

##Extracts only the measurements on the mean and standard deviation for each measurement.
TidyData <- mergedData %<%
  select(subject,code,contains("mean"),contains("std"))