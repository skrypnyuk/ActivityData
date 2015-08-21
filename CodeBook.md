---
title: "CodeBook"
output: html_document
---

The data file "tidydata.txt" contains 11880 rows and 4 columns, without headers. The columns are the following: 

- "subject" (numeric identifier between 1 and 30)
- "activity" (string identifier of one of the 6 activities, i.e. "WALKING", "WALKING_UPSTAIRS"", "WALKING_DOWNSTAIRS", "SITTING"", "STANDING", "LAYING"")
- "measurement" (string identifier of the measurement type of data)
- "mean" (numeric, calculated separately for each type of measurement, for each subject and each activity)

The measurements come from the accelerometer and the gyroscope carried by subjects. Using these instruments, a number of parameters (e.g. body acceleration or tBodyAcc) have been measured or estimated with a constant rate of 50 Hz. We have used the following parameters:

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

See more detailed description in "UCI HAR Dataset/README.txt" and "UCI HAR Dataset/features_info.txt". "XYZ" in the names of the parameters mean, that they have been measured separately for X, Y and Z axes. The measurements have been normalised and bounded within [-1,1]. 

In the original data a number of statistics have been computed for these parameters in each time window (i.e. mean, standard deviation, median, energy etc.) We use only mean and standard deviation, denoted by respectively "mean()" and "std()" in parameters' names. The script "run_analysis.R" calculates the means of all available data for each measurement, subject and activity and saves them in the "mean" column of the "tidydata.txt".
