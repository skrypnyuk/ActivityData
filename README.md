---
title: "README.md"
output: html_document
---

For running the script "run_analysis.R" you should have downloaded the "UCI HAR Dataset" and unzip it into the current working directory. You should therefore do something like this:   


```r
URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(URL, destfile="./activitydata.zip", method="curl")
unzip("activitydata.zip")
```

After downloading the "UCI HAR Dataset" you run the script in this way:


```r
source("run_analysis.R")
run_analysis()
```

This will produce the file "tidydata.txt" in a current directory. 

What this script essentially does is to compute for each subject (of which there are 30, identified by numbers), for each activity of that subject (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) and for each of the selected measurements the mean of the available data. There are 30 subjects, 6 activities and 66 selected measurements, altogether 30x6x66=11880 combinations. Accordingly the table saved in "tidydata.txt" contains 11880 rows and 4 columns. The columns contain the identifiers for subjects, activities, measurements and the computed mean.

It was a bit hard to select all the features (or measurements, as we call them) in the original data set that would contain mean or standard deviation. Finally I have selected only those features, that definitely measure either mean or standard deviation -- i.e. with "mean()" and "std()" in their names. My limited physics knowledge prevents me from discussing more in depth, which features should be included. 


The created data is tidy because each observation is in a separate row and each variable is in a separate column. There are the following fixed variables: subject, activity, and measurement, and the following "measured" variable: mean. 
