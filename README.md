# Getting-and-Clean-Data-Course
Code, readme and codebook for the Coursera project assignment

To use the code for analysis, download project data from
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
As denoted by the instruction

Unzip the dataset file and set the R working directory at the parent folder
e.g. If the unzipped data file directory is at C:\getdata%2Fprojectfiles%2FUCI%20HAsdsxcR%20Dataset\UCI HAR dataset
then set the working directory in R with the command setwd("C:\getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset")

Per the requirement of the project assignment, running "run_analysis.R" will
1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement.
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive variable names.
5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

An txt file titled "data project assignment.txt" will be created in the same directory containing the required tidy data set

The tidy data set will contain the mean of each extracted features for all 180 combinations of 30 subjects and 6 activities.
All activities have been assigned descriptively using the labels from the "activity_labels.txt" consisting of
"WALKING   WALKING_UPSTAIRS WALKING_DOWNSTAIRS            SITTING           STANDING             LAYING"

The mean of 79 features from the 561 features list are summarized. All these 79 features contains either "mean" or "std" in the 
feature label described in the original datafile. See Codebook for a list of the features. All the extracted features are mean and standard deviation for each measurements

The output data set file are tidy since
1. Each variable is in one column
2. Each different observation for each combination of activity and subject is in a different row

