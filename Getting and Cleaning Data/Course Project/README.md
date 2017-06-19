Getting and Cleaning Data Course Project
================

Introduction
------------

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone.

You should create one R script called run\_analysis.R that does the following.

        1. Merges the training and the test sets to create one data set.
        2.Extracts only the measurements on the mean and standard deviation for each measurement.
        3.Uses descriptive activity names to name the activities in the data set
        4.Appropriately labels the data set with descriptive variable names.
        5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The Process with scripts
------------------------

The Run\_analysis.R script conatins all the scripts in one place but hece I explain it step by step.

1.  Importing all the usefull files for train and test groups:

``` r
##setting the woriking directory on my local computer
setwd("~/GitHub/DataScienceSpecialization/Getting and Cleaning Data/Course Project/UCI HAR Dataset")
##Loading required packages
library(dplyr)
```

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
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
```

1.  Match the activity labels with the test and train labels (train/y\_train.txt or test/y\_test.txt)

``` r
##getting activity labels from the activity files for train and test
test_labels <- test_labels_id %>% left_join(activity_labels,by = c("label_id" = "n")) %>% select("activity_labels")
train_labels <- train_labels_id %>% left_join(activity_labels,by = c("label_id" = "n")) %>% select("activity_labels")
```

1.  Filter the columns to the features that correspond to mean or standard deviation of the measures

``` r
##select mean and standard deviation columns
index <- match(features,features1$names)
train_data <- select(train_data,index)
test_data <- select(test_data,index)
```

1.  Merge the subject, activity labels and datasets together to one data frame (one for train data, other for test data)

``` r
##Merging train dataset
train_dataset <- cbind(train_subjects,train_labels,train_data)
##Merging test dataset
test_dataset <- cbind(test_subjects,test_labels,test_data)
```

1.  Merge the test and train data

``` r
##Merging it all together
dataset <- rbind(train_dataset,test_dataset)
```

1.  Group by activity label and participant
2.  Calculate the mean for each variable for each activity and participan combination

``` r
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
write.csv(final_dataset,file = "final_dataset.csv")
head(as.data.frame(final_dataset),6)[,1:4]
```

    ##   subject    activity_labels TimeBodyAccelerometer-std()-X
    ## 1       1             LAYING                   -0.92805647
    ## 2       1            SITTING                   -0.97722901
    ## 3       1           STANDING                   -0.99575990
    ## 4       1            WALKING                   -0.28374026
    ## 5       1 WALKING_DOWNSTAIRS                    0.03003534
    ## 6       1   WALKING_UPSTAIRS                   -0.35470803
    ##   TimeBodyAccelerometer-std()-Y
    ## 1                  -0.836827406
    ## 2                  -0.922618642
    ## 3                  -0.973190056
    ## 4                   0.114461337
    ## 5                  -0.031935943
    ## 6                  -0.002320265
