CodeBook
================

Description
-----------

This file describes the variables, the raw data, and finally, the transformations performed to clean it up.

A full description of the experiment is available at the site where the data was obtained:

<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

Here are the data for this project:

<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

The objective is to merge the train and test datasets into one dataset. Then get the mean and standard deviation for each measurment and for each combination of participant and activity.

README file
-----------

In the README file of the dataset it is stated that:

For each record it is provided:
===============================

-   Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
-   Triaxial Angular velocity from the gyroscope.
-   A 561-feature vector with time and frequency domain variables.
-   Its activity label.
-   An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

-   'README.txt'

-   'features\_info.txt': Shows information about the variables used on the feature vector.

-   'features.txt': List of all features.

-   'activity\_labels.txt': Links the class labels with their activity name.

-   'train/X\_train.txt': Training dataset of features.

-   'train/y\_train.txt': Training activity labels.

-   'test/X\_test.txt': Test dataset of features.

-   'test/y\_test.txt': Test activity labels.

The following file is available for the train and test data. Their descriptions are equivalent.

-   'train/subject\_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

The features
------------

Each feature is described by a combination of several factors:

1.  At the begining, the t stands for time\* and f stands for frequency
2.  The Acc reference the Accelerometer signals and the Gyro reference the Gyroscope signals
3.  We have also body and gravitational measurments
4.  Jerk means that a jerk signal was calulated\*\*
5.  Mag stands for Magnitude\*\*\*
6.  XYZ represent the x axis, y axis and z axis respectively

*The time domain signals (prefix 't') were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. **The body linear acceleration and angular velocity were derived in time to obtain Jerk signals. ***The magnitude of the three-dimensional signals were calculated using the Euclidean norm.

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for each pattern:
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

        tBodyAcc-XYZ
        tGravityAcc-XYZ
        tBodyAccJerk-XYZ
        tBodyGyro-XYZ
        tBodyGyroJerk-XYZ
        tBodyAccMag
        tGravityAccMag
        tBodyAccJerkMag
        tBodyGyroMag
        tBodyGyroJerkMag
        fBodyAcc-XYZ
        fBodyAccJerk-XYZ
        fBodyGyro-XYZ
        fBodyAccMag
        fBodyAccJerkMag
        fBodyGyroMag
        fBodyGyroJerkMag

The set of variables that were estimated from these signals are:

        mean(): Mean value
        std(): Standard deviation
        mad(): Median absolute deviation 
        max(): Largest value in array
        min(): Smallest value in array
        sma(): Signal magnitude area
        energy(): Energy measure. Sum of the squares divided by the number of values. 
        iqr(): Interquartile range 
        entropy(): Signal entropy
        arCoeff(): Autorregresion coefficients with Burg order equal to 4
        correlation(): correlation coefficient between two signals
        maxInds(): index of the frequency component with largest magnitude
        meanFreq(): Weighted average of the frequency components to obtain a mean frequency
        skewness(): skewness of the frequency domain signal 
        kurtosis(): kurtosis of the frequency domain signal 
        bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
        angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

        - gravityMean
        - tBodyAccMean
        - tBodyAccJerkMean
        - tBodyGyroMean
        - tBodyGyroJerkMean

Cleaning the data
-----------------

In order to get the requested final dataset I executed the following process:

1.  Importing all the usefull files for train and test groups:

                - features.txt
                - activity_labels.txt
                - train/y_train.txt or test/y_test.txt
                - train/X_train.txt or test/X_test.txt
                - subject_train.txt or test/subject_test.txt

2.  Match the activity labels with the test and train labels (train/y\_train.txt or test/y\_test.txt)
3.  Set the names of the datasets columns to the features names
4.  Filter the columns to the features that correspond to mean or standard deviation of the measures
5.  Merge the subject, activity labels and datasets together to one data frame (one for train data, other for test data)
6.  Merge the test and train data
7.  Group by activity label and participant
8.  Calculate the mean for each variable for each activity and participan combination
