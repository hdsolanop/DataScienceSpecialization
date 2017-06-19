##setting the woriking directory on my local computer
setwd("~/GitHub/DataScienceSpecialization/Getting and Cleaning Data/Course Project/UCI HAR Dataset")
##Loading required packages
library(dplyr)
##import features names
features <- read.table("features.txt",header = FALSE,col.names = c("n","names"))
##select only the names colunm
features <- select(features,names)
features1 <- select(features,names)
##extract only the features fo the mean or standard deviation measurements
index <- c(grep("*std*",features$names),grep("*[Mm]ean*",features$names))
features <- as.character(features$names[index])
##import activity labels
activity_labels <- read.table("activity_labels.txt",header = FALSE,col.names = c("n","activity_labels"))
##import train and test data
train_data <- read.table("train/X_train.txt",header = FALSE, col.names = features1$names)
test_data <- read.table("test/X_test.txt",header = FALSE,col.names = features1$names)
##import subjects ids from test and train files
test_subjects <- read.table("test/subject_test.txt",header = FALSE,col.names = "subject")
train_subjects <- read.table("train/subject_train.txt",header = FALSE,col.names = "subject")
##import activity labels from test and train files
test_labels_id <- read.table("test/y_test.txt",header = FALSE,col.names = "label_id")
train_labels_id <- read.table("train/y_train.txt",header = FALSE,col.names = "label_id")
##select mean and standard deviation columns
index <- match(features,features1$names)
train_data <- select(train_data,index)
test_data <- select(test_data,index)
##getting activity labels from the activity files for train and test
test_labels <- test_labels_id %>% left_join(activity_labels,by = c("label_id" = "n")) %>% select("activity_labels")
train_labels <- train_labels_id %>% left_join(activity_labels,by = c("label_id" = "n")) %>% select("activity_labels")
##Merging train dataset
train_dataset <- cbind(train_subjects,train_labels,train_data)
##Merging test dataset
test_dataset <- cbind(test_subjects,test_labels,test_data)
##Merging it all together
dataset <- rbind(train_dataset,test_dataset)
##Creating the final dataset grouping subject and activity then getting the mean for all numeric variables
final_dataset <- dataset %>% group_by(subject,activity_labels) %>% summarise_all(mean) %>% arrange(subject,activity_labels)
## modifying names of the variables
names <- sub("t","Time",features)
names <- sub("f","Frequency",names)
names <- sub("Acc","Accelerometer",names)
names <- sub("Gyro","Gyroscope",names)
names <- sub("sTimed","std",names)
names <- sub("Mag","Magnitude",names)
names(final_dataset) <- c("subject","activity_labels",names)
##Export the final dataset
write.table(final_dataset,file = "final_dataset.txt",row.names = FALSE)