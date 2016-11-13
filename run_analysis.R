# This is the R script that generate tidy data set from data collected from 
# Samsung Galaxy S smartphone in a study described at 
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
# The original data is downloaded and unzipped form the website
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# Author: Brian Yi Liu

# working directory at the parent folder for the unzipped data
# Input data into R from the raw file
library(dplyr)

fileloc<-"UCI HAR Dataset/"
# read activity labels
activity.labels<-read.table(paste(fileloc,"activity_labels.txt",sep=""))
activity.list<-activity.labels$V2
names(activity.list)<-activity.labels$V1

# load feature labels into factor
features<-read.table(paste(fileloc,"features.txt",sep=""))

# label training and testing location
trainloc<-paste(fileloc,"train/",sep="")
testloc<-paste(fileloc,"test/",sep="")
trainrawloc<-paste(trainloc,"Inertial Signals/",sep="")
traintestloc<-paste(testloc,"Inertial Signals/",sep="")

# load training data label and set
train.labels<-read.table(paste(trainloc,"y_train.txt",sep=""))
train.set<-read.table(paste(trainloc,"x_train.txt",sep=""))
train.subject<-read.table(paste(trainloc,"subject_train.txt",sep=""))

# turn label into descriptive factor format
train.labels<-as.factor(as.character(train.labels$V1))
levels(train.labels)<-activity.list

# assign feature label, activity and subject to train.set
colnames(train.set)<-as.character(features$V2)
train.set$subject<-train.subject$V1
train.set$activity<-train.labels
# add data set type,"training" group
train.set$set<-rep("TRAINING",nrow(train.set))
# reordering column
train.set<-train.set[c(562:564,1:561)]

# load and label test set
test.labels<-read.table(paste(testloc,"y_test.txt",sep=""))
test.set<-read.table(paste(testloc,"X_test.txt",sep=""))
test.subject<-read.table(paste(testloc,"subject_test.txt",sep=""))
# turn label into descriptive factor format
test.labels<-as.factor(as.character(test.labels$V1))
levels(test.labels)<-activity.list
# assign feature label and subject to test.set
colnames(test.set)<-as.character(features$V2)
test.set$subject<-test.subject$V1
test.set$activity<-test.labels
# add data set type, "testing" group
test.set$set<-rep("TESTING",nrow(test.set))
# reordering column
test.set<-test.set[c(562:564,1:561)]


# Merge training and testing set
total.set<-rbind(train.set,test.set)
# Creating a set with only mean and std related features
target.features<-c(grep("mean",names(total.set)),grep("std",names(total.set)))
target.set<-total.set[c(1:3,target.features)]

# Create a second dataset to summarize mean for each activity and subject
summary.set<-target.set%>%group_by(subject,activity)%>%summarize_each(funs(mean(., na.rm=TRUE)),-set)

# output summary table
write.table(summary.set,file="data project assignment.txt",row.names=FALSE)


